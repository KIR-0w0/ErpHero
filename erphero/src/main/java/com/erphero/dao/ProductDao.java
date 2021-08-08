package com.erphero.dao;

import java.util.List;

import com.erphero.vo.Product;

public interface ProductDao {
	
	/**
	 * 모든 판매상품 정보를 반환한다
	 * @return 판매상품 목록
	 */
	List<Product> getAllSellProducts();
	
}
