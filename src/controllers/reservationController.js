const { v4: uuidv4 } = require('uuid');
const db = require('../config/database');
const { validateReservationData, validateUuid } = require('../utils/ReservationValidation');
const logger = require('../utils/logger');

/**
 * Get all Reservations with optional pagination.
 */
const getAllReservations = async (req, res) => {
    let query = 'SELECT * FROM reservations2';
    const limit = req.query.limit && /^\d+$/.test(req.query.limit) ? parseInt(req.query.limit, 10) : null;
    const offset = req.query.offset && /^\d+$/.test(req.query.offset) ? parseInt(req.query.offset, 10) : null;

    if (req.query.limit && (isNaN(limit) || limit <= 0)) {
        return res.status(400).json({ message: 'Invalid limit value. Must be a positive integer.' });
    }

    if (req.query.offset && (isNaN(offset) || offset < 0)) {
        return res.status(400).json({ message: 'Invalid offset value. Must be a non-negative integer.' });
    }

    if (limit !== null) {
        query += ` LIMIT ${limit}`;
    }

    if (offset !== null && limit !== null) {
        query += ` OFFSET ${offset}`;
    }

    try {
        const conn = await db.createConnection();
        const [reservations2] = await conn.execute(query);
        await conn.end();
        return res.status(200).json(reservations2);
    } catch (error) {
        logger.error('Error fetching reservations2:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};

/**
 * Get a single reservation by UUID.
 */
const getReservationById = async (req, res) => {
    const { id } = req.params;

    if (!validateUuid(id)) {
        return res.status(400).json({ message: 'Invalid reservation ID. Must be a valid UUID.' });
    }

    try {
        const conn = await db.createConnection();
        const [rows] = await conn.execute(
            `SELECT r.*, a.username 
             FROM reservations2 r
             JOIN accounts a ON r.user_id = a.id
             WHERE r.reservation_uuid = ?`,
            [id]
        );
        await conn.end();

        if (rows.length === 0) {
            return res.status(404).json({ message: 'Reservation not found' });
        }

        return res.status(200).json(rows[0]);
    } catch (error) {
        logger.error('Error fetching reservation by ID:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};

/**
 * Create a new reservation.
 */
const createReservation = async (req, res) => {
    const ReservationValidation = validateReservationData(req.body);
    if (!ReservationValidation.valid) {
        return res.status(400).json({ message: ReservationValidation.message });
    }

    const { user_id, restaurant_id, reservation_datetime, guests, status, created_at } = req.body;
    console.log(req.body);
    const reservation_uuid = uuidv4();

    try {
        const conn = await db.createConnection();
        await conn.execute(
            'INSERT INTO reservations2 (reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at]
        );
        await conn.end();

        return res.status(201).json({ reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at });
    } catch (error) {
        logger.error('Error creating reservation:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};

/**
 * Update a reservation by UUID.
 */
const updateReservation = async (req, res) => {
    const { id } = req.params;
    const { reservation_datetime, guests } = req.body;

    if (!validateUuid(id)) {
        return res.status(400).json({ message: 'Invalid reservation ID. Must be a valid UUID.' });
    }

    try {
        const conn = await db.createConnection();

        // First verify the reservation exists
        const [existingReservation] = await conn.execute(
            'SELECT * FROM reservations2 WHERE reservation_uuid = ?',
            [id]
        );

        if (existingReservation.length === 0) {
            await conn.end();
            return res.status(404).json({ message: 'Reservation not found' });
        }

        // Update only the two fields we want to change
        const [result] = await conn.execute(
            `UPDATE reservations2 
             SET reservation_datetime = ?,
                 guests = ?
             WHERE reservation_uuid = ?`,
            [
                reservation_datetime || null,
                guests || null,
                id
            ]
        );

        await conn.end();

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Reservation not found' });
        }

        return res.status(200).json({ message: 'Reservation updated successfully' });
    } catch (error) {
        logger.error('Error updating reservation:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};

/**
 * Delete a reservation by UUID.
 */
const deleteReservation = async (req, res) => {
    const { reservation_id } = req.params;

    if (!validateUuid(reservation_id)) {
        return res.status(400).json({ message: 'Invalid UUID format.' });
    }

    try {
        const conn = await db.createConnection();
        const [existing] = await conn.execute('SELECT * FROM reservations2 WHERE reservation_uuid = ?', [reservation_id]);

        if (existing.length === 0) {
            await conn.end();
            return res.status(404).json({ message: 'Reservation not found.' });
        }

        await conn.execute('DELETE FROM reservations2 WHERE reservation_uuid = ?', [reservation_id]);
        await conn.end();

        return res.status(204).json({ message: 'Reservation deleted successfully.' });
    } catch (error) {
        logger.error('Error deleting reservation:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};
/**
 * Get all Reservations by user ID.
 */
const getReservationsByUserId = async (req, res) => {
    const { user_id } = req.params;

    if (!/^\d+$/.test(user_id)) {
        return res.status(400).json({ message: 'Invalid user_id. Must be a number.' });
    }

    try {
        const conn = await db.createConnection();
        const [reservations2] = await conn.execute(
            'SELECT * FROM reservations2 WHERE user_id = ?',
            [user_id]
        );
        await conn.end();

        return res.status(200).json(reservations2);
    } catch (error) {
        logger.error('Error fetching reservations2by user_id:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};
/**
 * Get all Reservations by restaurant UUID.
 */
const getReservationsByRestaurantId = async (req, res) => {
    const { restaurant_id } = req.params;

    if (!validateUuid(restaurant_id)) {
        return res.status(400).json({ message: 'Invalid restaurant_id. Must be a valid UUID.' });
    }

    try {
        const conn = await db.createConnection();
        const [reservations2] = await conn.execute(
            `SELECT r.*, a.username
             FROM reservations2 r
                      JOIN restaurants res ON r.restaurant_id = res.restaurant_id
                      JOIN accounts a ON r.user_id = a.id
             WHERE res.restaurant_uuid = ?`,
            [restaurant_id]
        );
        await conn.end();

        return res.status(200).json(reservations2);
    } catch (error) {
        logger.error('Error fetching reservations by restaurant_id:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};
/**
 * Get all Reservations by username.
 */
const getReservationsByUsername = async (req, res) => {
    const { username } = req.params;

    if (!username) {
        return res.status(400).json({ message: 'Username is required.' });
    }

    try {
        const conn = await db.createConnection();
        const [reservations] = await conn.execute(
            `SELECT r.*, res.name as restaurant_name
             FROM reservations2 r
             JOIN accounts a ON r.user_id = a.id
             JOIN restaurants res ON r.restaurant_id = res.restaurant_id
             WHERE a.username = ?`,
            [username]
        );
        await conn.end();

        return res.status(200).json(reservations);
    } catch (error) {
        logger.error('Error fetching reservations by username:', error);
        return res.status(500).json({ message: 'Server error. Please try again later.' });
    }
};
module.exports = {
    getAllReservations,
    getReservationById,
    createReservation,
    updateReservation,
    deleteReservation,
    getReservationsByUserId,
    getReservationsByRestaurantId,
    getReservationsByUsername
};
