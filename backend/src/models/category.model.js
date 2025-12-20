const db = require('../db/database');

exports.getCategories = () =>
  new Promise((resolve, reject) => {
    db.all(
      `
      SELECT category, COUNT(*) as product_count
      FROM products
      GROUP BY category
      ORDER BY category ASC
      `,
      [],
      (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
      }
    );
  });

exports.getSubCategoriesByCategory = (category) =>
  new Promise((resolve, reject) => {
    db.all(
      `
      SELECT sub_category, COUNT(*) as product_count
      FROM products
      WHERE category = ?
      GROUP BY sub_category
      ORDER BY sub_category ASC
      `,
      [category],
      (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
      }
    );
  });
