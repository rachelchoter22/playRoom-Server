const express = require('express');
const router = express.Router();
const mysql = require('../config/DB');
const qCustomer = require('../controllers/QCustomer')
router.get('/', (req, res) => {
    res.send('You are in Customer');
});
router.post('/signin', qCustomer.Signin);
router.post('/login', qCustomer.Login);
router.get('/myBorrowedGames/:id', qCustomer.GetBorrowedGames);
router.get('/findbyid/:id', qCustomer.FindByID);
router.put('/updateDetails', qCustomer.UpdateCustomer);
router.put('/disabledCustomer', qCustomer.DisableCustomer);
router.put('/ableCustomer', qCustomer.AbleCustomer);
router.get('/knowgame/:id/:customerId', qCustomer.KnowGame);
router.use('/borrow', require('./BorrowGame'));
router.use('/return',require('./BorrowGame'));
router.use('/games',require('./Games'));
router.get('/canborrow/:id',qCustomer.CanBorrow);
module.exports = router;