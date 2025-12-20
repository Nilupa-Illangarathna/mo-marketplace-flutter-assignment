const categoryService = require('../services/category.service');

exports.getCategories = async (req, res) => {
  try {
    const data = await categoryService.getCategories();
    res.json(data);
  } catch {
    res.status(500).json({ error: 'Failed to fetch categories' });
  }
};

exports.getSubCategoriesByCategory = async (req, res) => {
  try {
    const { category } = req.params;
    const data = await categoryService.getSubCategoriesByCategory(category);
    res.json(data);
  } catch {
    res.status(500).json({ error: 'Failed to fetch sub-categories' });
  }
};
