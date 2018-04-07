'use strict';
module.exports = (sequelize, DataTypes) => {
  var Photo = sequelize.define('Photo', {}, {});
  Photo.associate = function(models) {
    // associations can be defined here
  };
  return Photo;
};