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

import com.erphero.dto.InboundDto;
import com.erphero.service.InboundService;
import com.erphero.vo.Employee;
import com.erphero.vo.Inbound;
import com.erphero.vo.InboundProduct;
import com.erphero.vo.Search;
import com.erphero.web.model.response.MultipleResponseData;
import com.erphero.web.model.service.ResponseDataService;

@Controller
@RequestMapping("/inbound")
public class InboundController {

	@Autowired InboundService inboundService;
	@Autowired ResponseDataService responseDataService;
	
	@GetMapping("/list")
	public String showInbound() {
		return "inbound/list";
	}
	
	@RequestMapping (value="/list/json")
	public ResponseEntity<List<InboundProduct>> searchOrderToInboundProduct(@RequestBody Search search) {
		
		return new ResponseEntity<>(inboundService.searchInboundProducts(search), HttpStatus.OK);
	}
	@RequestMapping (value="/list/search") 
	@ResponseBody
	public ResponseEntity<List<Inbound>> searchSavedInbounds(@RequestBody Search search) {
		
		return new ResponseEntity<>(inboundService.searchSavedInbounds(search),HttpStatus.OK);
	}
	@RequestMapping (value="/list/searchInboundProduct") 
	@ResponseBody
	public ResponseEntity<List<InboundProduct>> getSavedInboundProductsByInboundCode(@RequestParam("inboundCode") String inboundCode) {
		
		return new ResponseEntity<>(inboundService.getInboundProductsByInboundCode(inboundCode), HttpStatus.OK);
	}
	@RequestMapping("/list/empDetail")
	@ResponseBody
	public MultipleResponseData<Employee> detail(@RequestParam(name="name", required = true) String name) {
		 List<Employee> employees = inboundService.searchEmployee(name);
		 return responseDataService.getMultipleResponseData(employees);
	}
	
	@RequestMapping(value="/addInbound")
	@ResponseBody
	public ResponseEntity<List<Inbound>> addInbound(@RequestBody List<Inbound> inbounds) { // @LoginedEMP Employee employee
		System.out.println("############초기입고의뢰등록 자동저장: "+inbounds);
		inboundService.addInbound(inbounds);
		System.out.println("저장될 것 조회: "+inbounds);
		return new ResponseEntity<>(inbounds, HttpStatus.OK);
	}
	@RequestMapping(value="/removeInbound")
	@ResponseBody
	public ResponseEntity<Void> removeInbound(@RequestParam("icode") List<String> codes) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 입고의뢰 정보: "+codes);
		inboundService.removeInbound(codes);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/removeInboundProducts") 
	@ResponseBody
	public ResponseEntity<Void> removeInboundProducts(@RequestParam("orderToInboundProduct") List<Long> nos) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 입고의뢰 정보: "+nos);
		inboundService.removeInboundProducts(nos);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/modifyInbound")
	@ResponseBody
	public ResponseEntity<List<InboundDto>> modifyOrder(@RequestBody List<InboundDto> allData) { // @LoginedEMP Employee employee
		inboundService.modifyInbound(allData);

		return new ResponseEntity<List<InboundDto>>(allData, HttpStatus.OK);
	}
}
