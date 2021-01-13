"use strict";

const mongoose = require("mongoose");
const LeaderboardRegister = mongoose.model("LeaderboardsRegister");

exports.addRegister = async (payload) => {
  let register = new LeaderboardRegister(payload);
  await register.save();
}

exports.getAllLeaderboards = async () => {
  return await LeaderboardRegister.find({}, "user map round dateAchieved")
  .populate("user", "name country")
  .populate("map", "name");
}

exports.getLeaderboardByMap = async (mapId) => {
  return await LeaderboardRegister.find({
    map: mapId
  })
  .populate("user", "name country")
  .populate("map", "name");
}