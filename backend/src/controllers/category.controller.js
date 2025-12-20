const categoryService = require('../services/category.service');

exports.getCategories = async (req, res) => {
  try {
    console.log('[API] GET /api/categories');
    const data = await categoryService.getCategories();
    console.log('[API] Categories returned:', data.length);
    res.json(data);
  } catch {
    res.status(500).json({ error: 'Failed to fetch categories' });
  }
};

exports.getSubCategoriesByCategory = async (req, res) => {
  try {
    const { category } = req.params;
    console.log(`[API] GET sub-categories | category=${category}`);
    const data = await categoryService.getSubCategoriesByCategory(category);
    res.json(data);
  } catch {
    res.status(500).json({ error: 'Failed to fetch sub-categories' });
  }
};
