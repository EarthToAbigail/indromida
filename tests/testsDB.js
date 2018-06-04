const runDbBuild = require('../db/db_build');
const dbConnect = require('../db/db_connect');
const test = require('tape');

test('Is tape working?', t => {
  t.equals(1, 1, 'one equals one');
  t.end();
});

test('Test to see if database exists', t => {
  runDbBuild(err => {
    if (err) console.log(err);
    else {
      const expected = [];
      dbConnect.query('SELECT * FROM users', (error, success) => {
        if (error) console.log(error);
        else {
          t.deepEqual(success.rows, expected, 'Should return an empty array');
          t.end();
        }
      });
    }
  });
});
