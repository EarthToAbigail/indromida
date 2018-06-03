module.exports = (sequelize, DataTypes) => {
  const Photo = sequelize.define('Photo', {}, {});
  Photo.associate = function(models) {
    // associations can be defined here
  };
  return Photo;
};
