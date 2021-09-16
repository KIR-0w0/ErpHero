package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.OrderProduct;
import com.erphero.vo.Search;

public interface OrderProductDao {

	List<OrderProduct> searchOrderProducts(Search search);

	List<OrderProduct> searchSavedOrderProducts(Search search);
	
	List<OrderProduct> getOrderProductsByOrderCode(@Param("orderCode") String chargeCode);
	
	List<OrderProduct> getOrderProductsByProductCode(@Param("productCode") String productCode);
	OrderProduct getOrderProductByNo(@Param("no") long no);
	
	/**
	 * 새 발주등록에 따른 상품들을 DB에 저장한다.
	 * @param orderProduct
	 */
	void insertOrderProduct(OrderProduct orderProduct);
	
	/**
	 * 발주에 해당하는 상품들 모두 삭제한다.
	 * @param code
	 */
	void deleteOrderProductByOrderCode (String code);
	
	/**
	 * 발주에 해당하는 상품들 각각 삭제한다.
	 * @param no
	 */
	void deleteOrderProducts(Long no);
	
	/**
	 * 발주수량을 변경한다.
	 * @param no
	 * @param quantity
	 */
	void updateOrderProduct(@Param("no") long no, @Param("quantity") long quantity);
}
