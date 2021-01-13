"use strict";

const express = require("express");
const router = express.Router();

router.get(
  "/",
  (_, response, __) => {
    response.status(200).send({
      name: "Zombies Leaderboards API",
      version: "0.0.1",
    });
  }
);

module.exports = router;
