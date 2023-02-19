const express = require('express');
const router = express.Router();
const mysql = require('../config/DB');
const qCustomer = require('../controllers/QCustomer')
router.get('/', (req, res) => {
    res.send('You are in CustomerGallery');
});
router.get('/allCustomers', qCustomer.AllCustomers)
module.exports = router;