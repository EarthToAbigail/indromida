# Indromida 
Indromida is a social website designed particalury for musicians and people who are looking to meet new people with the same musical taste. Data about target users were collected and organized as three [user models](docs/UserDesign/user_models.md)

## Status 

This project is still under the development phase and is not ready to be launched yet.

## Contribution

 **This should be filled later**


## Dependencies:

This project is build mainly using Javascript running in the Node.js enviroment in addition to other javascript frameworks. To satisfy all the dependencies you need install a version of [nodejs](https://nodejs.org/en/) >=8 in addition to npm. Depending on your operating system the instructions for installation may vary. Moreover, this project uses [postgreSQL](https://www.postgresql.org) as its database managemenet system which you will need to install as well in order to get the server running properly.

## Getting Started

This section will guide you to setup and start the project on your localhost.

**Notes:** 
- Make sure all the projects dependencies are satisfied.
- You will need to clone or download the project before getting started.
	`git clone git@github.com:abdullahemad12/indromida.git`
- Make sure to run `npm install` in the projects root directory before proceeding.



#### Migrations: 

Let us now setup the database.

1. The first step will be creating a postgress database for the project with any name you like. 
2. Make a copy of the hidden .env.example and name it .env.
	In the root directory run: `cp .env.example .env`
3. Modify the following line in the .env file **DATABASE_URL=postgres://postgres@localhost/_database_** by replacing database by your
database name that you created in step 1.
4. run the following in your root directory `npm `


#### Starting the website: 

After installing nodejs and postgreSQL you are ready to start up the server. In order to do so follow these instruction: 


1. Start the server buy running the following command in your root directory: 
	`npm start`
a port number should be printed on the terminal. 
1. In the address bar of your browser type in the following address **localhost:port** or **127.0.0.1:port**

## Documentation: 



## Add contribution and conventions rules for the database(plural and lower case) and modules (singular and upper case)


#### Code Structure
This project follows the MVC pattern in its design.
- For the Model component, the porject contains a different module representing every object that is present in the database when neccessary. The design of the model modules can be found in [modules.md](docs/modules.md).
- Every Object in the database will contain a view to be served to the user. Additionally there might be other views that appears when an error occurs.
- Every Model will have it's corresponding Controller that routes and validate data between the Model modules and the views.

**More details should be added as the project advances**

## License

**To be filled later**


