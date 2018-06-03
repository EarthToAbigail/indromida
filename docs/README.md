# Indromida Docs

Manual for developers. This document is for mainly describing the structure of the project and contribution guidline. Please visit [development.md](development.md) for setting up the development enviroment.




## Table of contents

- [Introduction](#introduction)
- [Developers Guidelines](#developersguidelines)
- [Front End](#frontend)
- [Back End](#backend)
	- [Postgress Database](#postgressdatabase)
	- [Postgress Functions](#postgressfunctions)


## Introduction
In this document we shall discuss the guidelines for contributing to this project and discuss the internel structure of the project. The interface (frontend) of the website will be discussed briefly, highlighting important patterns that a contributer must take care of when contributing to the project. In addition, this document will focus mainly on the structure of the serverside.


## Developers Guidelines

TODO: Explain how to contribute and mention some rules for contribution



## Front End



## Back End
Indromida was built mostly using javascript technologies. The server is built using node.js and express.js following the Model-View-Controller (MVC) pattern. Additionally, data are stored in postgress Database.

#### Postgress Database: 

The database tables are created using the migrations library [node-pg-migrate](https://github.com/salsita/node-pg-migrate). All the migration can be found in the migrations folders in the root directory of this project. Whenever an additional table needs to be added or an existing table needs to be removed or altered, this has to be done through a migrations to keep other developers updated to the changes in the migrations. The current schema of the database can be found [here](Database/db_schema.md)

Note: Please refer to the docs of [node-pg-migrate](https://github.com/salsita/node-pg-migrate) for more instructions.


#### Postgress Functions

Database functions are used to handle all the queries to the database. For secuirty reasons and code cleanliness, no raw sql statements should be written inside the server's code. All the functions must be clearly documented and again must be done through the migration library described above. The current functions of the database can be found [here](Database/stored_procedures.md)
