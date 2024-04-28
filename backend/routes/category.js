const express = require("express");
const router = express.Router();
const categoryController = require("../controllers/categoryController");

router.post("/", categoryController.createCategory);
router.get("/", categoryController.getAllCategories);
router.get("/random", categoryController.getRamdomCategories);

module.exports = router;
