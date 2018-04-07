'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
	  username: {
		allowNull: true, 
		type: Sequelize.STRING(255),
		unique: true
	  },
 	  email: {
		allowNull: true, 
		type: Sequelize.STRING(50),
		unique: true
	  },
	  firstname: {
		allowNull: true, 
		type: Sequelize.STRING(255),
	  },
  	  lastname: {
		allowNull: true, 
		type: Sequelize.STRING(255),
	  },
	  birthdate:{
	  	allowNull:true,
		type: Sequelize.DATEONLY
	  },
	  biography:{
	  	allowNull: true, 
		type: Sequelize.TEXT
	  },
	  gender:{
		allowNull:true,
		type: Sequelize.BOOLEAN
	  },
	  phone:{
		allowNull: true,
		type: Sequelize.STRING(100)
	  },
	  profile_picture: {
		allowNull: true,
		type: Sequelize.STRING(255)
	  },
	  password_hash:{
		allowNull: true,
		type: Sequelize.STRING(255)
	  },
	  country:{
		allowNull: true,
		type: Sequelize.STRING(60)
	  },
	  city:{
		allowNull: true,
		type: Sequelize.STRING(255)
	  },
      profile_privacy:{
		allowNull:true,
		type: Sequelize.BOOLEAN
	  },
      messaging_privacy:{
		allowNull:true,
		type: Sequelize.BOOLEAN
	  },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Users');
  }
};