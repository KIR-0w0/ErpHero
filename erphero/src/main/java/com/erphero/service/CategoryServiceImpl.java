package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.CategoryDao;
import com.erphero.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired CategoryDao categoryDao;
	
	@Override
	public void addCategory(Category category) {
		categoryDao.insertCategory(category);
	}
	
	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategory();
	}
	
	@Override
	public Category getCategoryByCode(String code) {
		
		return categoryDao.getCategryBycode(code); 
	}
}
