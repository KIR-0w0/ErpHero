package com.erphero.web.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.DashboardService;
import com.erphero.vo.Dashboard;
import com.erphero.vo.Search;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@Autowired
	DashboardService dashboardService;
	
	@GetMapping("/listDay")
	public String showDasboardD() {
		return "dashboard/listDay";
	}
	@GetMapping("/listMonth")
	public String showDashboardM() {
		return "dashboard/listMonth";
	}
	@GetMapping("/listStock")
	public String showDashboardS() {
		return "dashboard/listStock";
	}
	@GetMapping("/listLocation")
	public String showDashboardL() {
		return "dashboard/listLocation";
	}
	@GetMapping("/listYear")
	public String showDashboardY() {
		return "dashboard/listYear";
	}
	@GetMapping("/listDayMain")
	public String showDasboardMainD() {
		return "dashboardMain/listDay";
	}
	@GetMapping("/listMonthMain")
	public String showDashboardMainM() {
		return "dashboardMain/listMonth";
	}
	@GetMapping("/listStockMain")
	public String showDashboardMainS() {
		return "dashboardMain/listStock";
	}
	@GetMapping("/listLocationMain")
	public String showDashboardMainL() {
		return "dashboardMain/listLocation";
	}
	@GetMapping("/listYearMain")
	public String showDashboardMainY() {
		return "dashboardMain/listYear";
	}
	@RequestMapping("/listInboundDays/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateInboundsByDays(@RequestBody Search search) {
		 return new ResponseEntity<>(dashboardService.calculateInboundsByDays(search), HttpStatus.OK);
	}
	@RequestMapping("/listOrderDays/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateOrdersByDays(@RequestBody Search search) {
		 return new ResponseEntity<>(dashboardService.calculateOrdersByDays(search), HttpStatus.OK);
	}
	@RequestMapping("/listInboundMonths/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateInboundsByMonths(@RequestBody Search search) {
		return new ResponseEntity<>(dashboardService.calculateInboundsByMonths(search), HttpStatus.OK);
	}
	@RequestMapping("/listOrderMonths/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateOrdersByMonths(@RequestBody Search search) {
		return new ResponseEntity<>(dashboardService.calculateOrdersByMonths(search), HttpStatus.OK);
	}
	@RequestMapping("/listInboundYears/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateInboundsByYears(@RequestBody Search search) {
		return new ResponseEntity<>(dashboardService.calculateInboundsByYears(search), HttpStatus.OK);
	}
	@RequestMapping("/listOrderYears/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateOrdersByYears(@RequestBody Search search) {
		return new ResponseEntity<>(dashboardService.calculateOrdersByYears(search), HttpStatus.OK);
	}
	@RequestMapping("/listProducts/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateProducts() {
		return new ResponseEntity<>(dashboardService.calculateProducts(), HttpStatus.OK);
	}
	@RequestMapping("/listProductsCategories/json") 
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateProductsByCategories() {
		return new ResponseEntity<>(dashboardService.calculateProductsByCategories(), HttpStatus.OK);
	}
	@RequestMapping("/listInboundProducts/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateInboundProducts() {
		return new ResponseEntity<>(dashboardService.calculateInboundProducts(), HttpStatus.OK);
	}
	@RequestMapping("/listOrderLocations/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateOrderLocations() {
		return new ResponseEntity<>(dashboardService.calculateOrderLocations(), HttpStatus.OK);
	}
	@RequestMapping("/listOrderUnpaid/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateunpaidOrderAmounts() {
		return new ResponseEntity<>(dashboardService.calculateunpaidOrderAmounts(), HttpStatus.OK);
	}
	@RequestMapping("/listOrderProductsSum/json")
	@ResponseBody
	public ResponseEntity<List<Dashboard>> calculateOrderProductsSum() {
		return new ResponseEntity<>(dashboardService.calculateOrderProductsSum(), HttpStatus.OK);
	}
}
