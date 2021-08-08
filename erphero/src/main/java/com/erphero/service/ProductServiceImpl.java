package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.ProductDao;
import com.erphero.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired ProductDao productDao;
	
	@Override
	public List<Product> getAllSellProducts() {
		return productDao.getAllSellProducts();
	}
}
