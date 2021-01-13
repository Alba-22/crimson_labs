"use strict";

const express = require("express");
const router = express.Router();
const controller = require("../controller/maps_controller");

router.get("/", controller.getAllMaps);

module.exports = router;