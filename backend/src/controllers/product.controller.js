const productService = require('../services/product.service');

exports.getProducts = async (req, res) => {
  try {
    const { category, subCategory } = req.query;
    const products = await productService.getProducts(category, subCategory);
    res.json(products);
  } catch {
    res.status(500).json({ error: 'Failed to fetch products' });
  }
};
