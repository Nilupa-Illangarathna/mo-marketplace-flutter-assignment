const express = require('express');
const router = express.Router();

const categoryController = require('../controllers/category.controller');

router.get('/', categoryController.getCategories);
router.get('/:category/subcategories', categoryController.getSubCategoriesByCategory);

module.exports = router;
