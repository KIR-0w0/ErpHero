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

import com.erphero.service.ChargeService;
import com.erphero.vo.Charge;
import com.erphero.vo.ChargeProduct;
import com.erphero.vo.Employee;
import com.erphero.vo.Search;
import com.erphero.web.annotation.LoginedEmp;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService chargeService;
	
	@GetMapping("/list")
	public String showCharge() {
		return "charge/list";
	}
	
	@RequestMapping (value="/list/json")
	public ResponseEntity<List<ChargeProduct>> searchReqAmountToChargeProduct(@RequestBody Search search) {
		
		return new ResponseEntity<>(chargeService.searchChargeProducts(search),HttpStatus.OK);
	}
	 
	@RequestMapping (value="/list/search") 
	@ResponseBody
	public ResponseEntity<List<Charge>> searchSavedCharges(@RequestBody Search search) {
		
		return new ResponseEntity<>(chargeService.searchSavedCharges(search),HttpStatus.OK);
	}
	@RequestMapping (value="/list/searchChargeProduct") 
	@ResponseBody
	public ResponseEntity<List<ChargeProduct>> getSavedChargeProductsByChargeCode(@RequestParam("chargeCode") String chargeCode) {
		
		return new ResponseEntity<>(chargeService.getChargeProductsByChargeCode(chargeCode),HttpStatus.OK);
	}
	
	@RequestMapping(value="/addCharge")
	@ResponseBody
	public ResponseEntity<List<Charge>> addCharge(@RequestBody List<Charge> charges) { // @LoginedEmp Employee employee
		System.out.println("############초기청구등록 자동저장: "+charges);
		chargeService.addCharge(charges);
		System.out.println("저장될 것 조회: "+charges);
		//그냥 charge만 해도 charge 여러개 저장됨(근데 이 경우는 charge 자체가 배열임)
		return new ResponseEntity<>(charges, HttpStatus.OK);
	}
	
	@RequestMapping(value="/removeCharge")
	@ResponseBody
	public ResponseEntity<Void> removeCharge(@RequestParam("ccode") List<String> codes) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 청구 정보: "+codes);
		chargeService.removeCharge(codes);
		//for문은 서비스에서 구현
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/removeChargeProducts")
	@ResponseBody
	public ResponseEntity<Void> removeChargeProducts(@RequestParam("reqAmountToChargeProduct") List<Long> nos) { // @LoginedEMP Employee employee
		System.out.println("############삭제할 청구상품 정보: "+nos);
		chargeService.removeChargeProducts(nos);
		//for문은 서비스에서 구현
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
