const express = require('express');
const cors = require('cors');
const path = require('path');

const productRoutes = require('./routes/product.routes');
const categoryRoutes = require('./routes/category.routes');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Serve images
app.use(
  '/images',
  express.static(path.join(__dirname, '../public/images'))
);

// Image logger=
app.use('/images', (req, res, next) => {
  console.log('Image requested:', req.originalUrl);
  next();
});

// API routes
app.use('/api/products', productRoutes);
app.use('/api/categories', categoryRoutes);

// Health check
app.get('/', (req, res) => {
  res.json({ status: 'MO Marketplace API running' });
});

app.listen(PORT, () => {
  console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
  console.log('MO Marketplace Mock Backend...');
  console.log(`API running at http://localhost:${PORT}`);
  console.log('Serving APIs and local images...');
  console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
});
