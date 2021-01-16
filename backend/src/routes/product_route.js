"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controllers/product_controller");
const authService = require("../services/auth_service");

router.get("/", controller.getAllProducts);
router.get("/:id", controller.getProductById);
router.get("/tag/:tag", controller.getProductsByTag);
router.post("/", authService.authorize, controller.create);
router.put("/:id", authService.authorize, controller.update);
router.delete("/:id", authService.authorize, controller.delete);

module.exports = router;