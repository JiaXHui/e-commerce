package com.jia.service;

import com.jia.dao.CategoryDao;
import com.jia.eneity.Category;
import com.jia.utils.PageTools;

import java.util.List;


public class CategoryService {
    private CategoryDao categoryDao=new CategoryDao();
    public List<Category> findCategoryList() {
        return categoryDao.findCategoryList();
    }
    public List<Category> findCategoryLimit(Integer id) {
        return categoryDao.findCategoryLimit(id);
    }

    public Category findCategoryById(Integer cid) {
        return categoryDao.findCategoryById(cid);
    }

    public int updateCategory(Category category) {
        return  categoryDao.updateCategory(category);
    }

    public int insertCategory(Category category) {
        return categoryDao.insertCategory(category);
    }

    public int deleteCategoryById(String cid) {
        return categoryDao.deleteCategoryById(cid);
    }

    public Integer findCategoryCount() {
        return categoryDao.findCategoryCount();
    }

    public List<Category> findCategorylimit(PageTools pageTools) {
        return categoryDao.findCategorylimit(pageTools);
    }
}
