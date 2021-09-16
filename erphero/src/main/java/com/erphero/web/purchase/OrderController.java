package com.erphero.web.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.OrderService;
import com.erphero.vo.Employee;
import com.erphero.vo.Order;
import com.erphero.vo.OrderProduct;
import com.erphero.vo.Search;
import com.erphero.web.model.response.MultipleResponseData;
import com.erphero.web.model.service.ResponseDataService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired OrderService orderService;
	
	@Autowired ResponseDataService responseDataService;
	
	@GetMapping("/list")
	public String showOrder() {
		return "order/list";
	}
	
	@RequestMapping (value="/list/json")
	public ResponseEntity<List<OrderProduct>> searchChargeToOrderProduct(@RequestBody Search search) {
		
		return new ResponseEntity<>(orderService.searchOrderProducts(search), HttpStatus.OK);
	}
	
	@RequestMapping (value="/list/search") 
	@ResponseBody
	public ResponseEntity<List<Order>> searchSavedOrders(@RequestBody Search search) {
		
		return new ResponseEntity<>(orderService.searchSavedOrders(search),HttpStatus.OK);
	}
	@RequestMapping (value="/list/searchOrderProduct") 
	@ResponseBody
	public ResponseEntity<List<OrderProduct>> getSavedOrderProductsByOrderCode(@RequestParam("orderCode") String orderCode) {
		
		return new ResponseEntity<>(orderService.getOrderProductsByOrderCode(orderCode), HttpStatus.OK);
	}
	@RequestMapping("/list/empDetail")
	@ResponseBody
	public MultipleResponseData<Employee> detail(@RequestParam(name="name", required = true) String name) {
		 List<Employee> employees = orderService.searchEmployee(name);
		 return responseDataService.getMultipleResponseData(employees);
	}
	
	@RequestMapping(value="/addOrder")
	@ResponseBody
	public ResponseEntity<List<Order>> addOrder(@RequestBody List<Order> orders) { // @LoginedEMP Employee employee
		System.out.println("############초기발주등록 자동저장: "+orders);
		orderService.addOrder(orders);
		System.out.println("저장될 것 조회: "+orders);
		return new ResponseEntity<>(orders, HttpStatus.OK);
	}
	@RequestMapping(value="/removeOrder")
	@ResponseBody
	public ResponseEntity<Void> removeCharge(@RequestParam("ocode") List<String> codes) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 발주 정보: "+codes);
		orderService.removeOrder(codes);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/removeOrderProducts") 
	@ResponseBody
	public ResponseEntity<Void> removeOrderProducts(@RequestParam("chargeToOrderProduct") List<Long> nos) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 발주상품 정보: "+nos);
		orderService.removeOrderProducts(nos);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/modifyOrder")
	@ResponseBody
	public ResponseEntity<List<Order>> modifyOrder(@RequestBody List<Order> orders) { // @LoginedEMP Employee employee
		orderService.modifyOrder(orders);

		return new ResponseEntity<List<Order>>(orders, HttpStatus.OK);
	}
	
}
