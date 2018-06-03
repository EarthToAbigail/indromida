const { Pool } = require('pg');

const url = require('url');
require('env2')('.env');

let DATABASE_URL = process.env.DATABASE_URL;

if (process.env.NODE_ENV === 'test') {
  DATABASE_URL = process.env.TEST_DATABASE_URL;
}

if (!DATABASE_URL) {
  throw new Error('ENV variable DATABASE_URL was NOT SET!!');
}

const pool = new Pool({
  connectionString: DATABASE_URL
});

const params = url.parse(DATABASE_URL);

const options = {
  host: params.hostname,
  port: params.port,
  database: params.pathname.split('/')[1],
  max: process.env.DB_MAX_CONNECTIONS || 2
  // user: params.auth.split(':')[0],
  // password: params.auth.split(':')[1]
};

options.ssl = options.host !== 'localhost';
console.log(options);
module.exports = new Pool(options);
