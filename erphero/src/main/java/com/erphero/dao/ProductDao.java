package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.Product;

public interface ProductDao {
	
	/**
	 * 모든 판매상품 정보를 반환한다
	 * @return 판매상품 목록
	 */
	List<Product> getAllSellProducts();
	
	/**
	 * 상품의 정보를 변경한다.
	 * @param product
	 */
	void updateProduct(Product product);
	
	/**
	 * 상품번호에 해당하는 상품객체를 조회한다.
	 * @param code
	 * @return
	 */
	Product getProductByCode(@Param("code") String code);
	
	/**
	 * 상품등록
	 * @param product
	 */
	void insertProduct(Product product);
}
