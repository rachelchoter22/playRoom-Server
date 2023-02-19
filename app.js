const express = require('express');
const app = express();
const playRoom = require('./PlayRoom');
const bodyParser = require('body-parser');

const cors = require('cors');
app.use(cors({
    origin: '*',
    methods: "*",
}));
app.use(bodyParser.json());
app.use('/', playRoom);

app.listen(3003);