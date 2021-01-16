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
const ProductModel = require("./models/product_model");

// Carrega as Rotas
const indexRoute = require("./routes/index_route");
const usersRoute = require("./routes/users_route");
const loginRoute = require("./routes/login_route");
const productRoute = require("./routes/product_route");

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
app.use("/products", productRoute);

module.exports = app;
