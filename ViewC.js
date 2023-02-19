const express = require('express');
const router = express.Router();
const mysql = require('./config/DB');
router.get('/', (req, res) => {
    res.send('You are in Customer View');
});
module.exports = router;