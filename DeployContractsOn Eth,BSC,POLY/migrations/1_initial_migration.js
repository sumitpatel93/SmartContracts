const Migrations = artifacts.require("watchContract");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
