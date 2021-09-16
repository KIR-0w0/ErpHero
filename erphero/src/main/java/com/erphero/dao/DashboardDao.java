package com.erphero.dao;

import java.util.List;

import com.erphero.vo.Dashboard;
import com.erphero.vo.Search;

public interface DashboardDao {

	/**
	 * 일일입고현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateInboundsByDays(Search search);
	/**
	 * 일일발주현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateOrdersByDays(Search search);
	/**
	 * 월별입고현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateInboundsByMonths(Search search);
	/**
	 * 월별발주현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateOrdersByMonths(Search search);
	/**
	 * 연별입고현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateInboundsByYears(Search search);
	/**
	 * 연별발주현황
	 * @param search
	 * @return
	 */
	List<Dashboard> calculateOrdersByYears(Search search);
	/**
	 * 총재고량
	 * @return
	 */
	List<Dashboard> calculateProducts();
	/**
	 * 상품카테고리별 재고량
	 * @return
	 */
	List<Dashboard> calculateProductsByCategories();
	/**
	 * 입고상품에 따른 재고량
	 * @return
	 */
	List<Dashboard> calculateInboundProducts();
	/**
	 * 지역별 발주현황
	 * @return
	 */
	List<Dashboard> calculateOrderLocations();
	/**
	 * 지역별 공급가현황
	 * @return
	 */
	List<Dashboard> calculateOrderProductsSum();
	/**
	 * 발주미납현황
	 * @return
	 */
	List<Dashboard> calculateunpaidOrderAmounts();
	
	
}
