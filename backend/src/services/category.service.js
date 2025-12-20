const Category = require('../models/category.model');

exports.getCategories = async () => {
  return await Category.getCategories();
};

exports.getSubCategoriesByCategory = async (category) => {
  return await Category.getSubCategoriesByCategory(category);
};
