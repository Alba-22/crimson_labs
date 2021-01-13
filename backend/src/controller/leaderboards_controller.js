"use strict";

const repository = require("../repositories/leaderboards_repository");
const ValidationContract = require("../validators/validator");
const authService = require("../services/auth_service");

exports.addRegister = async (request, response, _) => {

  let contract = new ValidationContract();
  contract.isRequired(request.body.map, "MapId is required");
  contract.isRequired(request.body.round, "Round is required");
  contract.isRequired(request.body.gameType, "Game Type is required");
  contract.isRequired(request.body.dateAchieved, "Achieve Date is required");

  if (!contract.isValid()) {
    response.status(400).send({
      errors: contract.errors()
    });
    return;
  }

  try {
    let token = request.headers["x-access-token"];

    let tokenData = await authService.decodeToken(token);

    await repository.addRegister({
      user: tokenData.id,
      map: request.body.map,
      round: request.body.round,
      gameType: request.body.gameType,
      dateAchieved: request.body.dateAchieved,
    });
    response.status(201).send({
      message: "Leaderboard registered successfully",
    });
  }
  catch (error) {
    response.status(500).send({
      message: "Error while adding register",
      error: error,
    });
  }

}

exports.getAllLeaderboards = async (_, response, __) => {
  try {
    let result = await repository.getAllLeaderboards();
    response.status(200).send({
      leaderboards: result,
    });
  }
  catch (error) {
    console.log(error);
    response.status(500).send({
      message: "Error while loading leaderboard",
      error: error,
    });
  }
}

exports.getLeaderboardByMap = async (request, response, _) => {
  try {
    let result = await repository.getLeaderboardByMap(request.params.id);
    response.status(200).send({
      leaderboards: result,
    });
  }
  catch (error) {
    console.log(error);
    response.status(500).send({
      message: "Error while loading leaderboard",
      error: error,
    });
  }
}