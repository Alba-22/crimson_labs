"use strict";

const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const schema = new Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  map: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Maps",
    required: true,
  },
  round: {
    type: Number,
    required: true,
    trim: true,
  },
  gameType: {
    type: String,
    required: true,
    trim: true,
    enum: ["normal", "noperk", "nojug", "noenergy", "firstroom"],
    default: "normal"
  },
  dateAchieved: {
    type: Date,
    required: true,
    default: Date.now,
  }
});

module.exports = mongoose.model("LeaderboardsRegister", schema);