package com.erphero.service;

import java.util.List;

import com.erphero.vo.Category;

public interface CategoryService {

	void addCategory(Category category);
	
	Category getCategoryByCode(String code);
	
	List<Category> getAllCategories();
}
