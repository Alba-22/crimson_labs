"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controllers/users_controller");
const authService = require("../services/auth_service");

router.post("/", authService.authorize, controller.create);
router.get("/me", authService.authorize, controller.getUserData);

module.exports = router;