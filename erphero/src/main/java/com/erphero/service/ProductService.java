package com.erphero.service;

import java.util.List;

import com.erphero.vo.Product;

public interface ProductService {

	List<Product> getAllSellProducts();
	
	void insertProduct(Product product);
	
	Product getProductBycode(String code);
}
