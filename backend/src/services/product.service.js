const Product = require('../models/product.model');

exports.getProducts = async (category, subCategory) => {
  if (category && subCategory) {
    return await Product.getByCategoryAndSub(category, subCategory);
  }
  if (category) {
    return await Product.getByCategory(category);
  }
  return await Product.getAll();
};
