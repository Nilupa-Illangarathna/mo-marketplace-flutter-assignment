const db = require('./database');

const products = [
  /* =========================
  * WOMEN → ACTIVE WEAR (8)
  * ========================= */
  { name: 'Women Active Wear Set 01', category: 'women', sub_category: 'active_wear', price: 4200, image: 'woman_dress_01.jpg' },
  { name: 'Women Yoga Pants',        category: 'women', sub_category: 'active_wear', price: 3900, image: 'woman_dress_02.jpg' },
  { name: 'Women Sports Top',        category: 'women', sub_category: 'active_wear', price: 2800, image: 'woman_dress_03.jpg' },
  { name: 'Women Gym Outfit',        category: 'women', sub_category: 'active_wear', price: 5200, image: 'woman_dress_04.jpg' },
  { name: 'Women Running Set',       category: 'women', sub_category: 'active_wear', price: 4600, image: 'woman_dress_05.jpg' },
  { name: 'Women Training Shorts',   category: 'women', sub_category: 'active_wear', price: 2400, image: 'woman_dress_06.jpg' },
  { name: 'Women Fitness Leggings',  category: 'women', sub_category: 'active_wear', price: 3100, image: 'woman_dress_07.jpg' },
  { name: 'Women Sports Jacket',     category: 'women', sub_category: 'active_wear', price: 6100, image: 'woman_dress_08.jpg' },

  /* =========================
  * WOMEN → DRESSES (8)
  * ========================= */
  { name: 'Floral Summer Dress',     category: 'women', sub_category: 'dresses', price: 4500, image: 'woman_dress_09.jpg' },
  { name: 'Evening Party Dress',     category: 'women', sub_category: 'dresses', price: 6800, image: 'woman_dress_10.jpg' },
  { name: 'Casual Cotton Dress',     category: 'women', sub_category: 'dresses', price: 3200, image: 'woman_dress_11.jpg' },
  { name: 'Office Wear Dress',       category: 'women', sub_category: 'dresses', price: 5100, image: 'woman_dress_01.jpg' },
  { name: 'Maxi Long Dress',         category: 'women', sub_category: 'dresses', price: 5900, image: 'woman_dress_02.jpg' },
  { name: 'Wrap Dress',              category: 'women', sub_category: 'dresses', price: 4100, image: 'woman_dress_03.jpg' },
  { name: 'Sleeveless Midi Dress',   category: 'women', sub_category: 'dresses', price: 3700, image: 'woman_dress_04.jpg' },
  { name: 'Linen Day Dress',         category: 'women', sub_category: 'dresses', price: 3600, image: 'woman_dress_05.jpg' },

  /* =========================
  * WOMEN → BAGS & WALLETS (6)
  * ========================= */
  { name: 'Women Handbag',           category: 'women', sub_category: 'bags_wallets', price: 3500, image: 'woman_dress_06.jpg' },
  { name: 'Leather Wallet',          category: 'women', sub_category: 'bags_wallets', price: 2200, image: 'woman_dress_07.jpg' },
  { name: 'Mini Shoulder Bag',       category: 'women', sub_category: 'bags_wallets', price: 2800, image: 'woman_dress_08.jpg' },
  { name: 'Tote Bag',                category: 'women', sub_category: 'bags_wallets', price: 4100, image: 'woman_dress_09.jpg' },
  { name: 'Crossbody Bag',           category: 'women', sub_category: 'bags_wallets', price: 3900, image: 'woman_dress_10.jpg' },
  { name: 'Clutch Purse',            category: 'women', sub_category: 'bags_wallets', price: 2600, image: 'woman_dress_11.jpg' },

  /* =========================
  * WOMEN → BOTTOMS (6)
  * ========================= */
  { name: 'Women Jeans',            category: 'women', sub_category: 'bottoms', price: 4200, image: 'woman_dress_01.jpg' },
  { name: 'Women Leggings',         category: 'women', sub_category: 'bottoms', price: 2600, image: 'woman_dress_02.jpg' },
  { name: 'Women Palazzo Pants',    category: 'women', sub_category: 'bottoms', price: 3100, image: 'woman_dress_03.jpg' },
  { name: 'Women Skirt',            category: 'women', sub_category: 'bottoms', price: 2800, image: 'woman_dress_04.jpg' },
  { name: 'Women Shorts',           category: 'women', sub_category: 'bottoms', price: 2300, image: 'woman_dress_05.jpg' },
  { name: 'Women Formal Pants',     category: 'women', sub_category: 'bottoms', price: 3500, image: 'woman_dress_06.jpg' },

  /* =========================
  * WOMEN → OUTERWEAR (5)
  * ========================= */
  { name: 'Women Denim Jacket',     category: 'women', sub_category: 'outerwear', price: 6200, image: 'woman_dress_07.jpg' },
  { name: 'Women Winter Coat',      category: 'women', sub_category: 'outerwear', price: 8900, image: 'woman_dress_08.jpg' },
  { name: 'Women Hoodie',           category: 'women', sub_category: 'outerwear', price: 5200, image: 'woman_dress_09.jpg' },
  { name: 'Women Cardigan',         category: 'women', sub_category: 'outerwear', price: 4800, image: 'woman_dress_10.jpg' },
  { name: 'Women Blazer',           category: 'women', sub_category: 'outerwear', price: 7500, image: 'woman_dress_11.jpg' },

  /* =========================
  * WOMEN → ETHNIC WEAR (5)
  * ========================= */
  { name: 'Women Saree',            category: 'women', sub_category: 'ethnic_wear', price: 9800, image: 'woman_dress_01.jpg' },
  { name: 'Women Kurti',            category: 'women', sub_category: 'ethnic_wear', price: 4200, image: 'woman_dress_02.jpg' },
  { name: 'Women Salwar Suit',      category: 'women', sub_category: 'ethnic_wear', price: 6800, image: 'woman_dress_03.jpg' },
  { name: 'Women Lehenga',          category: 'women', sub_category: 'ethnic_wear', price: 14500, image: 'woman_dress_04.jpg' },
  { name: 'Women Ethnic Skirt',     category: 'women', sub_category: 'ethnic_wear', price: 5600, image: 'woman_dress_05.jpg' },

  /* =========================
  * WOMEN → SLEEPWEAR (4)
  * ========================= */
  { name: 'Women Night Dress',      category: 'women', sub_category: 'sleepwear', price: 2400, image: 'woman_dress_06.jpg' },
  { name: 'Women Pyjama Set',       category: 'women', sub_category: 'sleepwear', price: 3200, image: 'woman_dress_07.jpg' },
  { name: 'Women Sleep Shirt',      category: 'women', sub_category: 'sleepwear', price: 2100, image: 'woman_dress_08.jpg' },
  { name: 'Women Lounge Wear',      category: 'women', sub_category: 'sleepwear', price: 3600, image: 'woman_dress_09.jpg' },

  /* =========================
  * WOMEN → TOPS (6)
  * ========================= */
  { name: 'Women Casual T-Shirt',   category: 'women', sub_category: 'tops', price: 2200, image: 'woman_dress_10.jpg' },
  { name: 'Women Blouse',           category: 'women', sub_category: 'tops', price: 2800, image: 'woman_dress_11.jpg' },
  { name: 'Women Crop Top',         category: 'women', sub_category: 'tops', price: 1900, image: 'woman_dress_01.jpg' },
  { name: 'Women Tunic Top',        category: 'women', sub_category: 'tops', price: 2600, image: 'woman_dress_02.jpg' },
  { name: 'Women Formal Shirt',     category: 'women', sub_category: 'tops', price: 3200, image: 'woman_dress_03.jpg' },
  { name: 'Women Sleeveless Top',   category: 'women', sub_category: 'tops', price: 2100, image: 'woman_dress_04.jpg' },
  /* =========================
  * MEN → BOTTOMS (6)
  * ========================= */
  { name: 'Men Casual Pants',    category: 'men', sub_category: 'bottoms', price: 3500, image: 'men_dress_1.jpg' },
  { name: 'Men Jeans',           category: 'men', sub_category: 'bottoms', price: 4200, image: 'men_dress_2.jpg' },
  { name: 'Men Shorts',          category: 'men', sub_category: 'bottoms', price: 2600, image: 'men_dress_3.jpg' },
  { name: 'Men Formal Trousers', category: 'men', sub_category: 'bottoms', price: 4800, image: 'men_dress_4.jpg' },
  { name: 'Men Joggers',         category: 'men', sub_category: 'bottoms', price: 3000, image: 'men_dress_5.jpg' },
  { name: 'Men Chino Pants',     category: 'men', sub_category: 'bottoms', price: 3900, image: 'men_dress_1.jpg' },

  /* =========================
  * MEN → TOPS (6)
  * ========================= */
  { name: 'Men T-Shirt',      category: 'men', sub_category: 'tops', price: 1800, image: 'men_dress_2.jpg' },
  { name: 'Men Polo Shirt',   category: 'men', sub_category: 'tops', price: 2400, image: 'men_dress_3.jpg' },
  { name: 'Men Formal Shirt', category: 'men', sub_category: 'tops', price: 3200, image: 'men_dress_4.jpg' },
  { name: 'Men Hoodie',       category: 'men', sub_category: 'tops', price: 5200, image: 'men_dress_5.jpg' },
  { name: 'Men Jacket',       category: 'men', sub_category: 'tops', price: 6400, image: 'men_dress_1.jpg' },
  { name: 'Men Sweater',      category: 'men', sub_category: 'tops', price: 4100, image: 'men_dress_2.jpg' },

  /* =========================
  * BABY → DRESSES (6)
  * ========================= */
  { name: 'Baby Dress Pink',   category: 'baby', sub_category: 'dresses', price: 1200, image: 'baby_dress_01.jpg' },
  { name: 'Baby Party Dress',  category: 'baby', sub_category: 'dresses', price: 1800, image: 'baby_dress_02.jpg' },
  { name: 'Baby Cotton Dress', category: 'baby', sub_category: 'dresses', price: 1400, image: 'baby_dress_03.jpg' },
  { name: 'Baby Frock',        category: 'baby', sub_category: 'dresses', price: 1600, image: 'baby_dress_04.jpg' },
  { name: 'Baby Dress Floral', category: 'baby', sub_category: 'dresses', price: 1500, image: 'baby_dress_05.jpg' },
  { name: 'Baby Dress Casual', category: 'baby', sub_category: 'dresses', price: 1300, image: 'baby_dress_06.jpg' },

  /* =========================
  * BABY → ACCESSORIES (6)
  * ========================= */
  { name: 'Baby Hair Bow',     category: 'baby', sub_category: 'accessories', price: 1000, image: 'baby_dress_07.jpg' },
  { name: 'Baby Socks Set',    category: 'baby', sub_category: 'accessories', price: 900,  image: 'baby_dress_08.jpg' },
  { name: 'Baby Gloves',       category: 'baby', sub_category: 'accessories', price: 750,  image: 'baby_dress_01.jpg' },
  { name: 'Baby Hat',          category: 'baby', sub_category: 'accessories', price: 850,  image: 'baby_dress_02.jpg' },
  { name: 'Baby Bib Pack',     category: 'baby', sub_category: 'accessories', price: 650,  image: 'baby_dress_03.jpg' },
  { name: 'Baby Soft Blanket', category: 'baby', sub_category: 'accessories', price: 2100, image: 'baby_dress_04.jpg' },

  /* =========================
  * FURNITURE → LIVING ROOM (6)
  * ========================= */
  { name: 'Sofa Set',          category: 'furniture', sub_category: 'living_room', price: 25000, image: 'furnitures_01.jpg' },
  { name: 'Coffee Table',      category: 'furniture', sub_category: 'living_room', price: 12000, image: 'furnitures_02.jpg' },
  { name: 'TV Stand',          category: 'furniture', sub_category: 'living_room', price: 18000, image: 'furnitures_03.jpg' },
  { name: 'Living Room Chair', category: 'furniture', sub_category: 'living_room', price: 9000,  image: 'furnitures_04.jpg' },
  { name: 'Bookshelf',         category: 'furniture', sub_category: 'living_room', price: 15000, image: 'furnitures_05.jpg' },
  { name: 'Floor Lamp',        category: 'furniture', sub_category: 'living_room', price: 7000,  image: 'furnitures_06.jpg' },

  /* =========================
  * FURNITURE → BEDROOM (6)
  * ========================= */
  { name: 'Queen Size Bed',  category: 'furniture', sub_category: 'bedroom', price: 42000, image: 'furnitures_07.jpg' },
  { name: 'Wardrobe',        category: 'furniture', sub_category: 'bedroom', price: 38000, image: 'furnitures_01.jpg' },
  { name: 'Bedside Table',   category: 'furniture', sub_category: 'bedroom', price: 9500,  image: 'furnitures_02.jpg' },
  { name: 'Dressing Table',  category: 'furniture', sub_category: 'bedroom', price: 16000, image: 'furnitures_03.jpg' },
  { name: 'Mattress',        category: 'furniture', sub_category: 'bedroom', price: 22000, image: 'furnitures_04.jpg' },
  { name: 'Bedroom Chair',   category: 'furniture', sub_category: 'bedroom', price: 8000,  image: 'furnitures_05.jpg' },

  /* =========================
  * TOYS, GAMES & BOOKS → TOYS (4)
  * ========================= */
  { name: 'Kids Toy Car',     category: 'toys_games_books', sub_category: 'toys', price: 1800, image: 'baby_dress_05.jpg' },
  { name: 'Soft Teddy Bear',  category: 'toys_games_books', sub_category: 'toys', price: 2200, image: 'baby_dress_06.jpg' },
  { name: 'Building Blocks',  category: 'toys_games_books', sub_category: 'toys', price: 1600, image: 'baby_dress_07.jpg' },
  { name: 'Remote Car',       category: 'toys_games_books', sub_category: 'toys', price: 3500, image: 'baby_dress_08.jpg' },
  /* =========================
  * TOYS, GAMES & BOOKS → BOOKS (3)
  * ========================= */
  { name: 'Kids Story Book', category: 'toys_games_books', sub_category: 'books', price: 1200, image: 'baby_dress_01.jpg' },
  { name: 'Colouring Book', category: 'toys_games_books', sub_category: 'books', price: 900,  image: 'baby_dress_02.jpg' },
  { name: 'Puzzle Book',    category: 'toys_games_books', sub_category: 'books', price: 1500, image: 'baby_dress_03.jpg' },

  /* =========================
  * BEAUTY & PERSONAL CARE → SKINCARE (3)
  * ========================= */
  { name: 'Face Cream',      category: 'beauty_care', sub_category: 'skincare', price: 2800, image: 'baby_dress_04.jpg' },
  { name: 'Face Wash',       category: 'beauty_care', sub_category: 'skincare', price: 1800, image: 'baby_dress_05.jpg' },
  { name: 'Sunscreen SPF50', category: 'beauty_care', sub_category: 'skincare', price: 2400, image: 'baby_dress_06.jpg' },

  /* =========================
  * BEAUTY & PERSONAL CARE → HAIRCARE (3)
  * ========================= */
  { name: 'Shampoo',          category: 'beauty_care', sub_category: 'haircare', price: 1900, image: 'baby_dress_07.jpg' },
  { name: 'Hair Conditioner', category: 'beauty_care', sub_category: 'haircare', price: 2100, image: 'baby_dress_08.jpg' },

  /* =========================
  * TV & HOME APPLIANCES → TV (2)
  * ========================= */
  { name: 'Smart LED TV 43"', category: 'home_appliances', sub_category: 'tv', price: 125000, image: 'furnitures_03.jpg' },
  { name: 'Android TV Box',   category: 'home_appliances', sub_category: 'tv', price: 18000,  image: 'furnitures_04.jpg' },

  /* =========================
  * TV & HOME APPLIANCES → KITCHEN (3)
  * ========================= */
  { name: 'Electric Kettle', category: 'home_appliances', sub_category: 'kitchen_appliances', price: 7500,  image: 'furnitures_05.jpg' },
  { name: 'Rice Cooker',     category: 'home_appliances', sub_category: 'kitchen_appliances', price: 16500, image: 'furnitures_06.jpg' },
  { name: 'Blender',         category: 'home_appliances', sub_category: 'kitchen_appliances', price: 9800,  image: 'furnitures_07.jpg' },
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
