const express = require('express');
const router = express.Router();
const mysql = require('../config//DB');
const qgames = require('../controllers/QGames');
const gameGallery = require('./GameGallery');
router.get('/', (req, res) => {
    res.send('You are in AddingGames');
});
router.get('/Available', qgames.IsAvailable);
router.get('/AllAvailable',qgames.AllGamesAvailable);
router.get('/GameGallery', qgames.AllGames);
module.exports = router;