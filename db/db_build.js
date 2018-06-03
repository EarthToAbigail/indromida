const fs = require('fs');
const dbConnect = require('./db_connect');

const sql = fs.readFileSync(`${__dirname}/testDB.sql`).toString();

const runDbBuild = cb => {
  dbConnect.query(sql, (err, res) => {
    if (err) return cb(err);
    return cb(null, res);
  });
};

module.exports = runDbBuild;
