const runDbBuild = require('../db/db_build');
const dbConnect = require('../db/db_connect');
const test = require('tape');

// Sanity checks
test('Tape is working', t => {
  t.equals(1, 1, 'one equals one');
  t.end();
});

test('Database exists', t => {
  runDbBuild(err => {
    if (err) throw err;
    dbConnect.query(
      `SELECT datname FROM pg_catalog.pg_database WHERE
      datname = $1`,
      ['indromidatest'], // Change the name of the database to match your test environment
      (error, success) => {
        if (error) console.log(error);
        else {
          t.deepEqual(success.rowCount, 1, 'Should return 1.');
          t.end();
        }
      }
    );
  });
});
