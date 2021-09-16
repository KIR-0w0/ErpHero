package com.erphero.service;

import java.util.List;

import com.erphero.vo.Dashboard;
import com.erphero.vo.Search;

public interface DashboardService {

	List<Dashboard> calculateInboundsByDays(Search search);
	List<Dashboard> calculateOrdersByDays(Search search);
	List<Dashboard> calculateInboundsByMonths(Search search);
	List<Dashboard> calculateOrdersByMonths(Search search);
	List<Dashboard> calculateInboundsByYears(Search search);
	List<Dashboard> calculateOrdersByYears(Search search);
	
	List<Dashboard> calculateProducts();
	List<Dashboard> calculateInboundProducts();
	List<Dashboard> calculateOrderLocations();
	
	List<Dashboard> calculateProductsByCategories();
	
	List<Dashboard> calculateOrderProductsSum();
	List<Dashboard> calculateunpaidOrderAmounts();
}
