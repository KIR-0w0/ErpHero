package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.Employee;
import com.erphero.vo.Order;
import com.erphero.vo.Search;

public interface OrderDao {

	List<Order> searchSavedOrders(Search search);
	

	/**
	 * 새 발주등록 작성을 DB에 저장한다.
	 * @param order
	 */
	void insertOrder(Order order);
	
	
	/**
	 * 발주등록코드에 해당하는 발주등록 객체를 조회한다.
	 * @param code
	 * @return
	 */
	Order getOrderByCode(@Param("code") String code);
	
	/*
	 * 발주등록의 내용을 변경에서 DB에 저장한다.
	 */
	void updateOrder (Order order);
	
	/**
	 * 사원을 찾아서 실적담당자로 지정한다.
	 * @param name
	 * @return 사원들
	 */
	List<Employee> searchEmployee (String name);
		
}
