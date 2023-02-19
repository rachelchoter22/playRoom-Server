const express = require('express');
const router = express.Router();
const mysql = require('../config/DB');
const qborrow = require('../controllers/QBorrowGame');
router.get('/', (req, res) => {
    res.send('You are in GameGallery');
});
router.get('/mostpopular', qborrow.MostPopular);
module.exports = router;