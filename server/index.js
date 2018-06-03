require('env2')('.env');
const express = require('Express');
const logger = require('morgan');
const path = require('path');
const bodyParser = require('body-parser');
const cookieSession = require('cookie-session');
const passport = require('passport');

const app = express();
const port = process.env.PORT || 3000;
const host = process.env.HOST || 'localhost';

//This will conveniently log all the routes in terminal when in
//Dev environment.
if (process.env.NODE_ENV !== 'production') {
    app.use(logger('dev'));
}

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(
    cookieSession({
        maxAge: 30 * 24 * 60 * 60,
        keys: [process.env.COOKIE_SECRET],
        name: "session"
    })
);

app.use(passport.initialize());
app.use(passport.session());

if (process.env.NODE_ENV === 'production') {
    app.get('/', (req, res) => {
        res.send({ env: "PROD", page: "HOME" });
    });
    // Ask Express to eventually serve the index.html if the route is not
    // recognized.
    app.use(express.static('client/build'));
    app.get('*', (req, res) => {
        res.sendFile(path.resolve(__dirname, '..', 'client', 'build', 'index.html'));
    });
} else {
    app.get('/', (req, res) => {
       res.send({ env: "DEV", page: "HOME" });
    });
    
    // Any other route leads to 404.
    app.get('*', (req, res) => {
        res.status(404).send("Sorry, cant't find what you are looking for...");
    });
}

app.listen(port, () => {
    console.log(`Server listening at ${host} on port ${port}`);
});

