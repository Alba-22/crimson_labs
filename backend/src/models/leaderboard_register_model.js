"use strict";

const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const schema = new Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  map: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Map",
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

module.exports = mongoose.model("LeaderboardRegister", schema);