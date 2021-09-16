package com.erphero.dao;

import java.util.List;

import com.erphero.vo.Category;

public interface CategoryDao {

	void insertCategory(Category category);
	
	void updateCategory(Category category);
	
	void deleteCategory(String code);
	
	Category getCategryBycode(String code);
	
	List<Category> getAllCategory();
}
