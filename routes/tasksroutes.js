const express = require("express");
const router = express.Router();
const controllers = require("../controller/taskController")

router.get("/", controllers.getTasks);
router.get("/:id", controllers.getTask);
router.post("/", controllers.postTask);
router.put("/:id", controllers.putTask);
router.delete("/:id", controllers.deleteTask);

module.exports = router;