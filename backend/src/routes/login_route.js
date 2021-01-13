"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controller/login_controller");

router.post("/", controller.auth);

module.exports = router;