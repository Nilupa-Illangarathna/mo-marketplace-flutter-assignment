const productService = require('../services/product.service');

exports.getProducts = async (req, res) => {
  try {
    const { category, subCategory } = req.query;

    console.log(`[API] GET /api/products | category=${category || 'ALL'} | subCategory=${subCategory || 'ALL'}`);

    const products = await productService.getProducts(category, subCategory);
    console.log('[API] Products returned:', products.length);
    res.json(products);
  } catch {
    res.status(500).json({ error: 'Failed to fetch products' });
  }
};
