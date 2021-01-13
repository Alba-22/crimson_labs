'use strict'

const app = require("../src/app");
const http = require("http");
const debug = require("debug")("zombiesleaderboards:server");

const port = normalizePort(process.env.PORT || '0115');
app.set("port", port);

const server = http.createServer(app);

server.listen(port);
server.on("error", onError);
server.on("listening", onListening);
console.log(`Running on ${port}`);

function normalizePort(value) {
  const port = parseInt(value, 10);
  if (isNaN(port)) {
    return value;
  }
  else if (port >= 0) {
    return port;
  }
  return false;
}

function onError(error) {
  if (error.syscall != "listen") {
    throw error;
  }
  const bind = typeof port == "string"
  ? "Pipe" + port
  : "Port" + port;

  switch(error.code) {
    case "EACCES":
      console.error(bind + " requires elevated privilages");
      process.exit(1);
    case "EADDRINUSE":
      console.error(bind + " is already in use");
      process.exit(1);
    default:
      throw error;
  }
}

function onListening() {
  const address = server.address();
  const bind = typeof address == "string"
  ? "pipe" + address
  : "port" + address.port;
  debug(`Listening on ${bind}`);
}