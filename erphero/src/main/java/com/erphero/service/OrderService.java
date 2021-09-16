package com.erphero.service;

import java.util.List;

import com.erphero.vo.Employee;
import com.erphero.vo.Order;
import com.erphero.vo.OrderProduct;
import com.erphero.vo.Search;

public interface OrderService {

	List<Order> searchSavedOrders(Search search);
	
	/**
	 * 청구등록 상품에 대해 발주 작성을 등록하는 서비스
	 * @param order 발주등록정보
	 */
	void addOrder(List<Order> orders);
	
	/**
	 * 발주객체의 정보를 변경한다.
	 * @param charge
	 */
	void modifyOrder(List<Order> orders);
	
	/**
	 * 발주객체의 상태를 바꾼다.
	 * @param charge
	 */
	void removeOrder(List<String> codes);
	

	Order getOrderByCode(String code);
	
	/**
	 * 발주등록한 실적담당자를 지정한다.
	 * @param name
	 * @return 사원들
	 */
	List<Employee> searchEmployee(String name);
	
	//////////////////////////////////////////////////////////////////////////////////
	List<OrderProduct> searchOrderProducts(Search search);
	void addOrderProduct(String orderCode, List<OrderProduct> orderProducts);
	
	List<OrderProduct> getOrderProductsByOrderCode(String orderCode);
	List<OrderProduct> getOrderProductsByProductCode(String productCode);
	
	void removeOrderProductByOrderCode(String orderCode);
	OrderProduct getOrderProductByNo(long no);
	
	/**
	 * 발주객체의 코드로 얻어진 저장된 상품들을 삭제한다.
	 * @param nos 발주상품번호
	 */
	void removeOrderProducts(List<Long> nos);
}
