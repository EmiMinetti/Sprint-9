const express = require("express");
const router = express.Router();
const taskService = require("../services/taskEndpoints");
const middleware = require("../middlewares/middlewares");
const { validationResult } = require("express-validator");


const getTasks = router.get("/", async (req, res) => {
  const tasks = await taskService.getAll()
  res.send(tasks);
});

const getTask = router.get("/:id", async (req, res) => {
  const id = req.params.id
  const task = await taskService.getById(id)
  res.send(task[0]);
});

const postTask = router.post("/", middleware.authMiddleware, async (req, res) => {
  const validationErrors = validationResult(req);
  if (!validationErrors.isEmpty()) {
    return res.status(400).json({ errors: validationErrors.array() })
  }
  console.log("Ejecutando request")
  let { titulo, prioridad_id, usuario_id, completado } = req.body;
  let data = {titulo, prioridad_id, usuario_id, completado}
  const task = await taskService.create(data)
  const tasks = await taskService.getAll()
  res.send({"Tarea creada con exito": tasks});
});

const putTask = router.put("/:id", async (req, res) => {
  let { titulo, prioridad_id, usuario_id, completado } = req.body
  let id = req.params.id
  let data = { id, titulo, prioridad_id, usuario_id, completado }
  const task = await taskService.update(data)
  const newTask = await taskService.getById(id)
  res.send({"Tarea editada con exito": newTask});
});

const deleteTask = router.delete("/:id", async (req, res) => {
  const id = req.params.id
  const affectedRows = await taskService.remove(id)
  const tasks = await taskService.getAll()
  res.send({"Tarea eliminada con exito, las restantes tareas son": tasks});
});


module.exports = { getTask, getTasks, postTask, putTask, deleteTask };