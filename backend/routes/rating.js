const express = require("express");
const router = express.Router();
const ratingController = require("../controllers/ratingController");
const { verifyTokenAndAuthorization } = require("../middleware/verifyToken");

router.post("/", verifyTokenAndAuthorization, ratingController.addRating);

router.get("/", verifyTokenAndAuthorization, ratingController.checkUserRating);

module.exports = router;
