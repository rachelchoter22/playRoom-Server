const express = require('express');
const router = express.Router();
const customer=require('./routes/Customer');
const manager=require('./routes/Manager');
router.get('/', (_req, res) => {
    res.send('You are in App');
});
router.use('/customer', customer)
router.use('/manager', manager)
module.exports = router;