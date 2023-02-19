const express = require('express');
const router = express.Router();
const mysql = require('./DB');
const gameGallery = require('./GameGallery');
router.get('/', (req, res) => {
    res.send('You are in BorrowGame');
});
router.use('/GameGallery', gameGallery);
module.exports = router;

   
