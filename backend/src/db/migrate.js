const db = require('./database');

const products = [
  // Baby
  { name: 'Baby Dress 01', category: 'baby', price: 1200, image: 'baby_dress_01.jpg' },
  { name: 'Baby Dress 02', category: 'baby', price: 1300, image: 'baby_dress_02.jpg' },

  // Men
  { name: 'Men Dress 01', category: 'men', price: 3500, image: 'men_dress_1.jpg' },
  { name: 'Men Dress 02', category: 'men', price: 3600, image: 'men_dress_2.jpg' },

  // Women
  { name: 'Women Dress 01', category: 'women', price: 4200, image: 'woman_dress_01.jpg' },
  { name: 'Women Dress 02', category: 'women', price: 4300, image: 'woman_dress_02.jpg' },

  // Furniture
  { name: 'Furniture 01', category: 'furniture', price: 25000, image: 'furnitures_01.jpg' },
  { name: 'Furniture 02', category: 'furniture', price: 26000, image: 'furnitures_02.jpg' }
];

db.serialize(() => {
  db.run(`
    CREATE TABLE IF NOT EXISTS products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      category TEXT NOT NULL,
      price REAL NOT NULL,
      image_path TEXT NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);

  db.run(`DELETE FROM products`);

  const stmt = db.prepare(`
    INSERT INTO products (name, description, category, price, image_path)
    VALUES (?, ?, ?, ?, ?)
  `);

  products.forEach(p => {
    stmt.run(
      p.name,
      p.name,
      p.category,
      p.price,
      `/images/products/${p.image}`
    );
  });

  stmt.finalize();
});

db.close(() => console.log('Database migrated & seeded'));
