"use strict";

const mongoose = require("mongoose");
const User = mongoose.model("User");

exports.create = async (payload) => {
  let user = new User(payload);
  await user.save();
}

exports.getById = async (id) => {
  return await User.findById(id);
}

exports.getByEmail = async (email) => {
  return await User.findOne({
    email: email
  });
}

exports.authenticate = async (data) => {
  return await User.findOne({
    email: data.email,
    password: data.password,
  });
}