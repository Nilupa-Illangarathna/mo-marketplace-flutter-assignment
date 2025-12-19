const express = require('express');
const cors = require('cors');
const path = require('path');

const productRoutes = require('./routes/product.routes');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Serve images
app.use('/images', express.static(path.join(__dirname, '../public/images')));

// API routes
app.use('/api/products', productRoutes);

// Health check
app.get('/', (req, res) => {
  res.json({ status: 'MO Marketplace API running' });
});

app.listen(PORT, () => {
  console.log(`API running on http://localhost:${PORT}`);
});
