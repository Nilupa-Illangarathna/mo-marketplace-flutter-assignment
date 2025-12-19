const productService = require('../services/product.service');

exports.getProducts = async (req, res) => {
  try {
    const { category } = req.query;
    const products = await productService.getProducts(category);
    res.json(products);
  } catch {
    res.status(500).json({ error: 'Failed to fetch products' });
  }
};
