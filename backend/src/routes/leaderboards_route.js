"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controller/leaderboards_controller");
const authService = require("../services/auth_service");

router.post("/", authService.authorize, controller.addRegister);
router.get("/", authService.authorize, controller.getAllLeaderboards);
router.get("/:id", authService.authorize, controller.getLeaderboardByMap);

module.exports = router;