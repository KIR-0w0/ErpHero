package com.erphero.web.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.CategoryService;
import com.erphero.vo.Category;
import com.erphero.vo.Department;
import com.erphero.vo.Product;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired CategoryService categoryService;
	
	@GetMapping("/register") 
	public String category(Model model) {
		
		List<Category> categories =	categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		System.out.println("categories" + categories);
		
		return "category/registerForm"; 
	}
	
	@PostMapping("/register") 
	public String addCategory(Category category) {
		categoryService.addCategory(category);
		return "category/registerForm"; 
	}
	
	@GetMapping("/get/{code}")
	public String getCategory(@RequestParam("code") String code) {
		categoryService.getCategoryByCode(code);
		return null;
	}
	
	

	
	@GetMapping("/detail")
	public String details(@RequestParam("code") String code, Model model) {
		Category category = categoryService.getCategoryByCode(code);
		
		model.addAttribute("categories", category);
		
		return "category/registerForm";
	}
}
