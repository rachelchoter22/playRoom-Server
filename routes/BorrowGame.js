const express = require('express');
const router = express.Router();
const mysql = require('../config/DB');
const gameGallery = require('./GameGallery');
const qborrowGame = require('../controllers/QBorrowGame');
router.get('/', (req, res) => {
    res.send('You are in BorrowGame');
});
router.use('/GameGallery', gameGallery);
router.put('/borrowgame', qborrowGame.BorrowGame)
router.put('/returnGame',qborrowGame.ReturnGame)
module.exports = router;