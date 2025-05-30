const mysql = require('mysql2/promise');
const dbConfig = require('../config/db.config');

/**
 * Get a new database connection
 * @returns {Promise<mysql.Connection>}
 */
const getConnection = async () => {
    return mysql.createConnection(dbConfig);
};

const reservationModel = {
    /**
     * Fetch all reservations2 with optional pagination
     * @param {number|null} limit
     * @param {number|null} offset
     * @returns {Promise<Array>}
     */
    async getAllReservations(limit = null, offset = null) {
        let query = 'SELECT * FROM reservations2';
        const params = [];

        if (limit !== null) {
            query += ' LIMIT ?';
            params.push(limit);
        }

        if (offset !== null && limit !== null) {
            query += ' OFFSET ?';
            params.push(offset);
        }

        const conn = await getConnection();
        const [rows] = await conn.execute(query, params);
        await conn.end();
        return rows;
    },

    /**
     * Get a reservation by its UUID
     * @param {string} reservation_uuid
     * @returns {Promise<Object|null>}
     */
    async getReservationById(reservation_uuid) {
        const conn = await getConnection();
        const [rows] = await conn.execute('SELECT * FROM reservations2 WHERE reservation_uuid = ?', [reservation_uuid]);
        await conn.end();
        return rows.length ? rows[0] : null;
    },

    /**
     * Create a new reservation
     * @param {Object} reservationData
     * @param {string} reservationData.reservation_uuid
     * @param {number} reservationData.user_id
     * @param {number} reservationData.restaurant_id
     * @param {string} reservationData.reservation_datetime
     * @param {number} reservationData.guests
     * @param {string} reservationData.status
     * @param {string} reservationData.created_at
     * @returns {Promise<void>}
     */
    async createReservation({ reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at }) {
        const conn = await getConnection();
        await conn.execute(
            'INSERT INTO reservations2 (reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [reservation_uuid, user_id, restaurant_id, reservation_datetime, guests, status, created_at]
        );
        await conn.end();
    },

    /**
     * Update an existing reservation
     * @param {string} reservation_uuid
     * @param {Object} reservationData
     * @param {number} reservationData.user_id
     * @param {number} reservationData.restaurant_id
     * @param {string} reservationData.reservation_datetime
     * @param {number} reservationData.guests
     * @param {string} reservationData.status
     * @param {string} reservationData.created_at
     * @returns {Promise<boolean>} - True if updated, false if reservation not found
     */
    async updateReservation(reservation_uuid, { user_id, restaurant_id, reservation_datetime, guests, status, created_at }) {
        const conn = await getConnection();

        const [result] = await conn.execute(
            'UPDATE reservations2 SET user_id = ?, restaurant_id = ?, reservation_datetime = ?, guests = ?, status = ?, created_at = ? WHERE reservation_uuid = ?',
            [user_id, restaurant_id, reservation_datetime, guests, status, created_at, reservation_uuid]
        );

        await conn.end();
        return result.affectedRows > 0;
    },

    /**
     * Delete a reservation by UUID
     * @param {string} reservation_uuid
     * @returns {Promise<boolean>} - True if deleted, false if not found
     */
    async deleteReservation(reservation_uuid) {
        const conn = await getConnection();
        const [result] = await conn.execute('DELETE FROM reservations2 WHERE reservation_uuid = ?', [reservation_uuid]);
        await conn.end();
        return result.affectedRows > 0;
    },

    /**
     * Check if a reservation exists by UUID
     * @param {string} reservation_uuid
     * @returns {Promise<boolean>}
     */
    async reservationExists(reservation_uuid) {
        const conn = await getConnection();
        const [rows] = await conn.execute('SELECT 1 FROM reservations2 WHERE reservation_uuid = ? LIMIT 1', [reservation_uuid]);
        await conn.end();
        return rows.length > 0;
    }
};

module.exports = reservationModel;
