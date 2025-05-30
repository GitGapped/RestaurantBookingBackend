// routes/index.js
const express = require('express');
const router = express.Router();

const bookRoutes = require('./bookRoutes');
const restaurantRoutes = require('./restaurantRoutes');
const reservationRoutes = require('./reservationRoutes');
const authRoutes = require('./authRoutes');


// These will now be /api/books and /api/login (correct)
router.use('/books', bookRoutes);
router.use('/restaurants', restaurantRoutes);
router.use('/', authRoutes);
router.use('/reservations', reservationRoutes);

module.exports = router;
