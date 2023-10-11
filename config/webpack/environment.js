const { environment } = require("@rails/webpacker");

environment.node = {
  dgram: "empty",
  fs: "empty",
  net: "empty",
  tls: "empty",
  child_process: "empty",
};

module.exports = environment;
