package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.DashboardDao;
import com.erphero.vo.Dashboard;
import com.erphero.vo.Search;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired DashboardDao dashboardDao;
	
	@Override
	public List<Dashboard> calculateInboundsByDays(Search search) {
		return dashboardDao.calculateInboundsByDays(search);
	}

	@Override
	public List<Dashboard> calculateInboundsByMonths(Search search) {
		return dashboardDao.calculateInboundsByMonths(search);
	}

	@Override
	public List<Dashboard> calculateInboundsByYears(Search search) {
		return dashboardDao.calculateInboundsByYears(search);
	}

	@Override
	public List<Dashboard> calculateOrdersByDays(Search search) {
		return dashboardDao.calculateOrdersByDays(search);
	}

	@Override
	public List<Dashboard> calculateOrdersByMonths(Search search) {
		return dashboardDao.calculateOrdersByMonths(search);
	}

	@Override
	public List<Dashboard> calculateOrdersByYears(Search search) {
		return dashboardDao.calculateOrdersByYears(search);
	}

	@Override
	public List<Dashboard> calculateProducts() {
		return dashboardDao.calculateProducts();
	}
	@Override
	public List<Dashboard> calculateInboundProducts() {
		return dashboardDao.calculateInboundProducts();
	}
	@Override
	public List<Dashboard> calculateOrderLocations() {
		return dashboardDao.calculateOrderLocations();
	}
	@Override
	public List<Dashboard> calculateProductsByCategories() {
		return dashboardDao.calculateProductsByCategories();
	}
	@Override
	public List<Dashboard> calculateunpaidOrderAmounts() {
		return dashboardDao.calculateunpaidOrderAmounts();
	}
	@Override
	public List<Dashboard> calculateOrderProductsSum() {
		return dashboardDao.calculateOrderProductsSum();
	}
}
