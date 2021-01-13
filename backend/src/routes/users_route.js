"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controller/users_controller");

router.post("/", controller.create);

module.exports = router;