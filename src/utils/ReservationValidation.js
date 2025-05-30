const { validate: validateUuidV4 } = require('uuid');

/**
 * Validate if a string is a valid UUID v4.
 * @param {string} uuid - UUID string to validate.
 * @returns {boolean} True if valid UUID v4, false otherwise.
 */
function validateUuid(uuid) {
    return validateUuidV4(uuid);
}

/**
 * Validate the structure and types of a Reservation object.
 * @param {object} reservation - Reservation object to validate.
 * @param {number} reservation.user_id
 * @param {string} reservation.restaurant_id
 * @param {string} reservation.reservation_datetime
 * @param {number} reservation.guests
 * @param {string} reservation.status
 * @param {string} reservation.created_at
 * @returns {{ valid: boolean, message?: string }}
 */
function validateReservationData(reservation) {
    if (!reservation || typeof reservation !== 'object') {
        return { valid: false, message: 'Reservation data must be a valid object.' };
    }

    const { user_id, restaurant_id, reservation_datetime, guests, status, created_at } = reservation;

    if (typeof user_id !== 'number' || isNaN(user_id) || user_id <= 0) {
        return { valid: false, message: 'Invalid or missing "user_id". Must be a positive number.' };
    }

    // if (!restaurant_id || typeof restaurant_id !== 'string') {
    //     return { valid: false, message: 'Invalid or missing "restaurant_id". Must be a valid UUID string.' };
    // }

    if (!reservation_datetime || isNaN(Date.parse(reservation_datetime))) {
        return { valid: false, message: 'Invalid or missing "reservation_datetime". Must be a valid ISO datetime string.' };
    }

    if (typeof guests !== 'number' || isNaN(guests) || guests <= 0) {
        return { valid: false, message: 'Invalid or missing "guests". Must be a positive number.' };
    }

    if (!status || typeof status !== 'string') {
        return { valid: false, message: 'Invalid or missing "status". Must be a string.' };
    }

    if (!created_at || isNaN(Date.parse(created_at))) {
        return { valid: false, message: 'Invalid or missing "created_at". Must be a valid ISO datetime string.' };
    }

    return { valid: true };
}

module.exports = {
    validateUuid,
    validateReservationData
};
