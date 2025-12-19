const Product = require('../models/product.model');

exports.getProducts = async (category) => {
  if (category) {
    return await Product.getByCategory(category);
  }
  return await Product.getAll();
};
