"use strict";

const mapsRepository = require("../repositories/maps_repository");

exports.getAllMaps = async (_, response, __) => {

  try {
    let result = await mapsRepository.getMaps();
    response.status(200).send({
      maps: result
    });
  }
  catch (error) {
    response.status(500).send({
      message: "Request failed",
      error: error,
    });
  }
  
}