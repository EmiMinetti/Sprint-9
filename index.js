require('dotenv').config();
const express = require('express');
const app = express();
app.use(express.json());
const port = process.env.APP_PORT
const taskRoutes = require("./routes/tasksroutes"); 
const { check } = require("express-validator");
const middleware = require("./middlewares/middlewares") 

app.use(middleware.logMiddleware);

app.get('/', (req, res) => {
    res.send('Bienvenidos al sprint 9 de Emiliano Minetti')
})

app.use('/tasks', [
    check("titulo").notEmpty().withMessage("El titulo no puede estar vacio")
], taskRoutes) 

app.listen(port, () => {
    console.log(`La app se ejecuta en http://localhost:${port}`)
})