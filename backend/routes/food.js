const express = require("express");
const router = express.Router();
const foodController = require("../controllers/foodController");
const { verifyTokenAndAuthorization } = require("../middleware/verifyToken");

router.post("/", verifyTokenAndAuthorization, foodController.addFood);

router.get("/recommendation/:code", foodController.getRandomFood);
router.get("/bycode/:code", foodController.getAllFoodsByCode);

router.get("/:id", foodController.getFoodById);

router.get("/restaurant-foods/:id", foodController.getFoodByRestaurant);

router.get("/search/:search", foodController.searchFoods);

router.get("/:category/:code", foodController.getFoodsByCategoryAndCode);

module.exports = router;
