const express = require('express');

const AccountRouter = require('./accounts/account-router.js');

//const db = require('./data/dbConfig.js');

const server = express();

server.use(express.json());

server.use('/api/accounts', AccountRouter);

server.get('/', (req, res) => {
    res.send('<h3> Web DB I Challenge </h3>');
});

server.use((err, req, res) => {
    console.log(err)
    res.status(500).json({ 
        message: "Something went wrong."
    });
});

module.exports = server;