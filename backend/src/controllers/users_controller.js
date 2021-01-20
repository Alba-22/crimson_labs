"use strict";

const ValidationContract = require("../validators/validator");
const repository = require("../repositories/users_repository");
const md5 = require("md5");
const authService = require("../services/auth_service");

exports.create = async (request, response, _) => {

  let contract = new ValidationContract();
  contract.isRequired(request.body.country, "Country is required");
  contract.hasMinLenght(request.body.name, 2, "Name need to have 2 characters");
  contract.hasMinLenght(request.body.password, 8, "Password need to have 8 characters");
  contract.isEmail(request.body.email, "Invalid Email");

  if (!contract.isValid()) {
    response.status(400).send({
      errors: contract.errors()
    });
    return;
  }

  try {

    let check = await repository.getByEmail(request.body.email);
    if (check) {
      response.status(409).send({
        message: "User already exists",
      });
    return;
    }

    await repository.create({
      name: request.body.name,
      email: request.body.email,
      country: request.body.country,
      password: md5(request.body.password + global.PRIVATE_KEY),
    });
    response.status(201).send({
      message: "User created successfully",
    });
  }
  catch (error) {
    response.status(500).send({
      message: "Error while creating user",
      error: error,
    });
  }
  
}

exports.getUserData = async (request, response, _) => {

  try {
    let token = request.body.token || request.query.token || request.headers["x-access-token"];
    let tokenData = await authService.decodeToken(token);

    let result = await repository.getById(tokenData.id);
    response.status(200).send({
      id: result._id,
      name: result.name,
      email: result.email,
      country: result.country,
    });
  }
  catch(error) {
    response.status(500).send({
      message: "Error while creating user",
      error: error,
    });
  }

}