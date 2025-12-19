const db = require('../db/database');

exports.getAll = () =>
  new Promise((resolve, reject) => {
    db.all(`SELECT * FROM products ORDER BY id ASC`, [], (err, rows) => {
      if (err) return reject(err);
      resolve(rows);
    });
  });

exports.getByCategory = (category) =>
  new Promise((resolve, reject) => {
    db.all(
      `SELECT * FROM products WHERE category = ? ORDER BY id ASC`,
      [category],
      (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
      }
    );
  });
