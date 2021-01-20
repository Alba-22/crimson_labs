"use strict";

const jwt = require("jsonwebtoken");

exports.generateToken = async (tokenData) => {
  return jwt.sign(tokenData, global.PRIVATE_KEY, { expiresIn: "5d" });
}

exports.decodeToken = async (token) => {
  return jwt.verify(token, global.PRIVATE_KEY);
}

exports.authorize = (request, response, next) => {
  let token = request.headers["x-access-token"];

  if (!token) {
    response.status(401).json({
      message: "Restricted Acess. You need to login first",
    });
  }
  else {
    jwt.verify(
      token, 
      global.PRIVATE_KEY, 
      (error, _) => {
        if (error) {
          response.status(401).json({
            message: "Invalid token"
          });
        }
        else {
          next();
        }
      }
    );
  }
}