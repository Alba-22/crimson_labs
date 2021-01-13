"use strict";

const mongoose = require("mongoose");
const Maps = mongoose.model("Maps");

exports.getMaps = async () => {
  return await Maps.find({});
}