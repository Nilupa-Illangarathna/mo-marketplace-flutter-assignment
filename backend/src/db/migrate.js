const db = require('./database');

/**
 * CATEGORY STRUCTURE
 *
 * women
 *   ├─ active_wear
 *   ├─ dresses
 *   └─ bags_wallets
 *
 * men
 *   ├─ bottoms
 *   └─ tops
 *
 * baby
 *   ├─ dresses
 *   └─ accessories
 *
 * furniture
 *   ├─ living_room
 *   └─ bedroom
 */

// Available images in your folder (re-use for now)
// women: woman_dress_01.jpg ... woman_dress_11.jpg
// men: men_dress_1.jpg ... men_dress_5.jpg
// baby: baby_dress_01.jpg ... baby_dress_08.jpg
// furniture: furnitures_01.jpg ... furnitures_07.jpg

const products = [
  /* =========================
   * WOMEN → ACTIVE WEAR (8)
   * ========================= */
  { name: 'Women Active Wear Set 01', category: 'women', sub_category: 'active_wear', price: 4200, image: 'woman_dress_01.jpg' }, // TODO: replace with activewear image
  { name: 'Women Yoga Pants',        category: 'women', sub_category: 'active_wear', price: 3900, image: 'woman_dress_02.jpg' }, // TODO
  { name: 'Women Sports Top',        category: 'women', sub_category: 'active_wear', price: 2800, image: 'woman_dress_03.jpg' }, // TODO
  { name: 'Women Gym Outfit',        category: 'women', sub_category: 'active_wear', price: 5200, image: 'woman_dress_04.jpg' }, // TODO
  { name: 'Women Running Set',       category: 'women', sub_category: 'active_wear', price: 4600, image: 'woman_dress_05.jpg' }, // TODO
  { name: 'Women Training Shorts',   category: 'women', sub_category: 'active_wear', price: 2400, image: 'woman_dress_06.jpg' }, // TODO
  { name: 'Women Fitness Leggings',  category: 'women', sub_category: 'active_wear', price: 3100, image: 'woman_dress_07.jpg' }, // TODO
  { name: 'Women Sports Jacket',     category: 'women', sub_category: 'active_wear', price: 6100, image: 'woman_dress_08.jpg' }, // TODO

  /* =========================
   * WOMEN → DRESSES (8)
   * ========================= */
  { name: 'Floral Summer Dress',     category: 'women', sub_category: 'dresses', price: 4500, image: 'woman_dress_09.jpg' }, // TODO
  { name: 'Evening Party Dress',     category: 'women', sub_category: 'dresses', price: 6800, image: 'woman_dress_10.jpg' }, // TODO
  { name: 'Casual Cotton Dress',     category: 'women', sub_category: 'dresses', price: 3200, image: 'woman_dress_11.jpg' }, // TODO
  { name: 'Office Wear Dress',       category: 'women', sub_category: 'dresses', price: 5100, image: 'woman_dress_01.jpg' }, // TODO
  { name: 'Maxi Long Dress',         category: 'women', sub_category: 'dresses', price: 5900, image: 'woman_dress_02.jpg' }, // TODO
  { name: 'Wrap Dress',              category: 'women', sub_category: 'dresses', price: 4100, image: 'woman_dress_03.jpg' }, // TODO
  { name: 'Sleeveless Midi Dress',   category: 'women', sub_category: 'dresses', price: 3700, image: 'woman_dress_04.jpg' }, // TODO
  { name: 'Linen Day Dress',         category: 'women', sub_category: 'dresses', price: 3600, image: 'woman_dress_05.jpg' }, // TODO

  /* =========================
   * WOMEN → BAGS & WALLETS (6)
   * ========================= */
  { name: 'Women Handbag',           category: 'women', sub_category: 'bags_wallets', price: 3500, image: 'woman_dress_06.jpg' }, // TODO: replace with bag image
  { name: 'Leather Wallet',          category: 'women', sub_category: 'bags_wallets', price: 2200, image: 'woman_dress_07.jpg' }, // TODO
  { name: 'Mini Shoulder Bag',       category: 'women', sub_category: 'bags_wallets', price: 2800, image: 'woman_dress_08.jpg' }, // TODO
  { name: 'Tote Bag',                category: 'women', sub_category: 'bags_wallets', price: 4100, image: 'woman_dress_09.jpg' }, // TODO
  { name: 'Crossbody Bag',           category: 'women', sub_category: 'bags_wallets', price: 3900, image: 'woman_dress_10.jpg' }, // TODO
  { name: 'Clutch Purse',            category: 'women', sub_category: 'bags_wallets', price: 2600, image: 'woman_dress_11.jpg' }, // TODO

  /* =========================
   * MEN → BOTTOMS (6)
   * ========================= */
  { name: 'Men Casual Pants',        category: 'men', sub_category: 'bottoms', price: 3500, image: 'men_dress_1.jpg' }, // TODO
  { name: 'Men Jeans',               category: 'men', sub_category: 'bottoms', price: 4200, image: 'men_dress_2.jpg' }, // TODO
  { name: 'Men Shorts',              category: 'men', sub_category: 'bottoms', price: 2600, image: 'men_dress_3.jpg' }, // TODO
  { name: 'Men Formal Trousers',     category: 'men', sub_category: 'bottoms', price: 4800, image: 'men_dress_4.jpg' }, // TODO
  { name: 'Men Joggers',             category: 'men', sub_category: 'bottoms', price: 3000, image: 'men_dress_5.jpg' }, // TODO
  { name: 'Men Chino Pants',         category: 'men', sub_category: 'bottoms', price: 3900, image: 'men_dress_1.jpg' }, // TODO

  /* =========================
   * MEN → TOPS (6)
   * ========================= */
  { name: 'Men T-Shirt',             category: 'men', sub_category: 'tops', price: 1800, image: 'men_dress_2.jpg' }, // TODO
  { name: 'Men Polo Shirt',          category: 'men', sub_category: 'tops', price: 2400, image: 'men_dress_3.jpg' }, // TODO
  { name: 'Men Formal Shirt',        category: 'men', sub_category: 'tops', price: 3200, image: 'men_dress_4.jpg' }, // TODO
  { name: 'Men Hoodie',              category: 'men', sub_category: 'tops', price: 5200, image: 'men_dress_5.jpg' }, // TODO
  { name: 'Men Jacket',              category: 'men', sub_category: 'tops', price: 6400, image: 'men_dress_1.jpg' }, // TODO
  { name: 'Men Sweater',             category: 'men', sub_category: 'tops', price: 4100, image: 'men_dress_2.jpg' }, // TODO

  /* =========================
   * BABY → DRESSES (6)
   * ========================= */
  { name: 'Baby Dress Pink',         category: 'baby', sub_category: 'dresses', price: 1200, image: 'baby_dress_01.jpg' }, // TODO
  { name: 'Baby Party Dress',        category: 'baby', sub_category: 'dresses', price: 1800, image: 'baby_dress_02.jpg' }, // TODO
  { name: 'Baby Cotton Dress',       category: 'baby', sub_category: 'dresses', price: 1400, image: 'baby_dress_03.jpg' }, // TODO
  { name: 'Baby Frock',              category: 'baby', sub_category: 'dresses', price: 1600, image: 'baby_dress_04.jpg' }, // TODO
  { name: 'Baby Dress Floral',       category: 'baby', sub_category: 'dresses', price: 1500, image: 'baby_dress_05.jpg' }, // TODO
  { name: 'Baby Dress Casual',       category: 'baby', sub_category: 'dresses', price: 1300, image: 'baby_dress_06.jpg' }, // TODO

  /* =========================
   * BABY → ACCESSORIES (6)
   * ========================= */
  { name: 'Baby Hair Bow',           category: 'baby', sub_category: 'accessories', price: 1000, image: 'baby_dress_07.jpg' }, // TODO: replace with accessory image
  { name: 'Baby Socks Set',          category: 'baby', sub_category: 'accessories', price: 900,  image: 'baby_dress_08.jpg' }, // TODO
  { name: 'Baby Gloves',             category: 'baby', sub_category: 'accessories', price: 750,  image: 'baby_dress_01.jpg' }, // TODO
  { name: 'Baby Hat',                category: 'baby', sub_category: 'accessories', price: 850,  image: 'baby_dress_02.jpg' }, // TODO
  { name: 'Baby Bib Pack',           category: 'baby', sub_category: 'accessories', price: 650,  image: 'baby_dress_03.jpg' }, // TODO
  { name: 'Baby Soft Blanket',       category: 'baby', sub_category: 'accessories', price: 2100, image: 'baby_dress_04.jpg' }, // TODO

  /* =========================
   * FURNITURE → LIVING ROOM (6)
   * ========================= */
  { name: 'Sofa Set',                category: 'furniture', sub_category: 'living_room', price: 25000, image: 'furnitures_01.jpg' }, // TODO
  { name: 'Coffee Table',            category: 'furniture', sub_category: 'living_room', price: 12000, image: 'furnitures_02.jpg' }, // TODO
  { name: 'TV Stand',                category: 'furniture', sub_category: 'living_room', price: 18000, image: 'furnitures_03.jpg' }, // TODO
  { name: 'Living Room Chair',       category: 'furniture', sub_category: 'living_room', price: 9000,  image: 'furnitures_04.jpg' }, // TODO
  { name: 'Bookshelf',               category: 'furniture', sub_category: 'living_room', price: 15000, image: 'furnitures_05.jpg' }, // TODO
  { name: 'Floor Lamp',              category: 'furniture', sub_category: 'living_room', price: 7000,  image: 'furnitures_06.jpg' }, // TODO

  /* =========================
   * FURNITURE → BEDROOM (6)
   * ========================= */
  { name: 'Queen Size Bed',          category: 'furniture', sub_category: 'bedroom', price: 42000, image: 'furnitures_07.jpg' }, // TODO
  { name: 'Wardrobe',                category: 'furniture', sub_category: 'bedroom', price: 38000, image: 'furnitures_01.jpg' }, // TODO
  { name: 'Bedside Table',           category: 'furniture', sub_category: 'bedroom', price: 9500,  image: 'furnitures_02.jpg' }, // TODO
  { name: 'Dressing Table',          category: 'furniture', sub_category: 'bedroom', price: 16000, image: 'furnitures_03.jpg' }, // TODO
  { name: 'Mattress',                category: 'furniture', sub_category: 'bedroom', price: 22000, image: 'furnitures_04.jpg' }, // TODO
  { name: 'Bedroom Chair',           category: 'furniture', sub_category: 'bedroom', price: 8000,  image: 'furnitures_05.jpg' }, // TODO
];

db.serialize(() => {
  db.run(`
    CREATE TABLE IF NOT EXISTS products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      category TEXT NOT NULL,
      sub_category TEXT NOT NULL,
      price REAL NOT NULL,
      image_path TEXT NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);

  db.run(`DELETE FROM products`);

  const stmt = db.prepare(`
    INSERT INTO products (name, description, category, sub_category, price, image_path)
    VALUES (?, ?, ?, ?, ?, ?)
  `);

  products.forEach((p) => {
    stmt.run(
      p.name,
      p.name,
      p.category,
      p.sub_category,
      p.price,
      `/images/products/${p.image}`
    );
  });

  stmt.finalize();
});

db.close(() => console.log('Database migrated & seeded'));
