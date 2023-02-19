const express = require('express');
const router = express.Router();
const mysql = require('../config/DB');
const qCustomer = require('../controllers/QCustomer');
const customerGallery = require('./CustomerGallery');
router.get('/', (req, res) => {
    res.send('You are in Manager');
});
router.get('/nonactiveusers', qCustomer.NonActive)
router.use('/CustomerGallery', customerGallery);
module.exports = router;