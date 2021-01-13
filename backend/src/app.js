"use strict";

const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const config = require("./config");

const app = express();

// Conecta com o Banco
mongoose.connect(config.connectionString);

// Carrega os Models
const UserModel = require("./models/user_model");
const MapsModel = require("./models/maps_model");
const LeaderboardRegisterModel = require("./models/leaderboards_register_model");

// Carrega as Rotas
const indexRoute = require("./routes/index_route");
const usersRoute = require("./routes/users_route");
const loginRoute = require("./routes/login_route");
const mapsRoute = require("./routes/maps_route");
const leaderboardsRoute = require("./routes/leaderboards_route");

app.use(bodyParser.json({
  limit: "5mb"
}));
app.use(bodyParser.urlencoded({extended: false}));

// Habilita o CORS
app.use((_, response, next) => {
  response.header("Access-Control-Allow-Origin", "*");
  response.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, x-access-token");
  response.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
  next();
})

app.use("/", indexRoute);
app.use("/users", usersRoute);
app.use("/login", loginRoute);
app.use("/maps", mapsRoute);
app.use("/leaderboards", leaderboardsRoute);

module.exports = app;
