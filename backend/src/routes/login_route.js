"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controllers/login_controller");

router.post("/", controller.auth);

module.exports = router;