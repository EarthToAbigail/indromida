# Development

It is highly recommended that you go through this document if you are planning to contribute to this project.

## Setting up the development Enviroment
There is a couple of things you will have to configure before writing any code to the project. This section will guide you through all the configurations you will need to make.


#### Database

For this project you will need to setup a two databases, one will be used for development and the other for testing. 

_It is preferred that you name the two databases:_
- indromida_development
- indromida_test

The next step will be migrating the tables and functions to the databases you just created:

1. Modify the following line in the .env file **DATABASE_URL=postgres://postgres@localhost/_database_** by replacing database by the **indromide_development**. 
2. run the following command in the root directory `npm run migrate up`
3. repeat step **1** and **2** for the testing database. 