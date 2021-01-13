"use strict";

const ValidationContract = require("../validators/validator");
const authService = require("../services/auth_service");
const userRepository = require("../repositories/users_repository");
const md5 = require("md5");

exports.auth = async (request, response, _) => {

  let contract = new ValidationContract();
  contract.isEmail(request.body.email, "Invalid Email");
  contract.hasMinLenght(request.body.password, 8, "Password need to have 8 characters");

  if (!contract.isValid()) {
    response.status(400).send(contract.errors()).end();
    return;
  }

  try {
    const user = await userRepository.authenticate({
      email: request.body.email,
      password: md5(request.body.password + global.PRIVATE_KEY),
    });
  
    if (!user) {
      response.status(404).send({
        message: "User or password invalid",
      });
      return;
    }

    const token = await authService.generateToken({
      id: user._id,
      email: user.email,
      name: user.name,
    })
    
    response.status(200).send({
      token: token,
      data: {
        email: user.email,
        name: user.name,
      }
    });
  }
  catch (error) {
    response.status(500).send({
      message: "Error while login",
      error: error,
    });
  }
  
}