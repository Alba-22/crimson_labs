"use strict";

const mongoose = require("mongoose");
const Product = mongoose.model("Product");

exports.getAllProducts = async () => {
  return await Product.find(
    { active: true }, 
    "_id title price "
  );
}

exports.getById = async (id) => {
  return await Product.findById(id);
}

exports.getByTags = async (tag) => {
  return await Product.find({
    active: true,
    tags: tag
  }, "_id title description price ");
}

exports.create = async (payload) => {
  let product = new Product(payload);
  await product.save();
}

exports.update = async (id, payload) => {
  await Product.findByIdAndUpdate(
    id,
    {
      $set: {
        title: payload.title,
        description: payload.description,
        price: payload.price,
      }
    }
  );
}

exports.delete = async (id) => {
  await Product.findOneAndRemove(id);
}