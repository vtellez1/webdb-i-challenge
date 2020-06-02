const express = require('express');

// database access using knex
const db = require('../data/dbConfig.js');

const router = express.Router();

router.get('/', async (req, res, next) => {
    try{
        res.json(await db.select("*").from("accounts"))
    } catch (err){
        next(err)
    }
    // db.select("*").from("accounts")
    // .then(accounts => {
    //     res.status(200).json(accounts)
    // })
    // .catch(error =>{
    //     console.log(error);
    //     res.status(500).json({
    //         errorMessage: "Error getting accounts"
    //     })
    // })
});

router.get('/:id', async (req, res, next) => {
    try{
        const account = await db("accounts").where("id",
        req.params.id).first()
        res.json(account)
    } catch (error){
        next(error)
    }
    // db.select("*").from("accounts").where({ id: req.params.id }).first()
    // .then(account => {
    //     res.status(200).json(account);
    // })
    // .catch(error => {
    //     console.log(error);
    //     res.status(500).json({
    //     errorMessage: "Error getting account"
    // })
});

router.post('/', async (req, res, next) => {
    try{
        const payload = {
            name: req.body.name,
            budget: req.body.budget,
        }

        const [id] = await db("accounts").insert(payload)
        res.json(await db("accounts").where("id", id).first())
    } catch (error){
        next(error)
    }
});

router.put('/:id', async (req, res, next) => {
    try{
        const payload = {
            name: req.body.name,
            budget: req.body.budget,
        }
        await db("accounts").where("id", req.params.id).update(payload)
        res.json( await db("accounts").where("id", req.params.id).first())
    } catch (error){
        next(error)
    }
});

router.delete('/:id', async (req, res, next) => {
    try{
        await db("accounts").where("id", req.params.id).del()
        res.status(204).end()
    } catch (error){
        next(error)
    }
});

module.exports = router;