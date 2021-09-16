package com.erphero.web.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.RequiredAmountService;
import com.erphero.vo.RequiredAmount;
import com.erphero.vo.Search;

@Controller
@RequestMapping("/reqAmount")
public class RequiredAmountController {

	@Autowired
	RequiredAmountService requiredAmountService;
	
	@GetMapping("/list")
	public String showReqAmount() {
		return "reqAmount/list";
	}
	@RequestMapping (value="/list/saved")
	public ResponseEntity<List<RequiredAmount>> savedReqAmount(@RequestBody Search search) {
		List<RequiredAmount> reqAmounts = requiredAmountService.searchSavedRequiredAmounts(search);
		
		System.out.println("############DB에 저장된 소요량들  : "+reqAmounts );
		return new ResponseEntity<List<RequiredAmount>>(reqAmounts, HttpStatus.OK);
	}
	
	@RequestMapping (value="/list/with")
	public ResponseEntity<List<RequiredAmount>> reqAmount(@RequestBody Search search) {
		List<RequiredAmount> reqAmounts = requiredAmountService.searchRequiredAmounts(search);
		
		System.out.println("############소요량이 전개되었다~!!: "+reqAmounts );
		return new ResponseEntity<List<RequiredAmount>>(reqAmounts, HttpStatus.OK);
	}
	
	@PostMapping("/list/without")
	@ResponseBody
	public ResponseEntity<List<RequiredAmount>> getReqAmount(@RequestBody Search search) { //@LoginEMP가 없어..
		System.out.println("####################"+search); //값이 제대로 오는지 확인
	
		List<RequiredAmount> reqAmounts = requiredAmountService.searchRequiredAmountsWithoutSafeStock(search);
		return new ResponseEntity<List<RequiredAmount>>(reqAmounts, HttpStatus.OK);
	}
	
	@RequestMapping(value="/addReqAmount")
	@ResponseBody
	public ResponseEntity<Void> addReqAmount(@RequestBody List<RequiredAmount> reqAmounts) { // @LoginedEMP Employee employee
		System.out.println("############소요량 전개 저장: "+reqAmounts);
		requiredAmountService.addRequiredAmount(reqAmounts);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping(value="/sumReqAmount")
	@ResponseBody
	public ResponseEntity<List<RequiredAmount>> sumReqAmount() { // @LoginedEMP Employee employee
		System.out.println("############소요량 취합 뿌려줬음");
		requiredAmountService.getAllAggregateAmount();
		List<RequiredAmount> savedReqAmounts = requiredAmountService.getAllAggregateAmount();
		return new ResponseEntity<List<RequiredAmount>>(savedReqAmounts, HttpStatus.OK);
	}
	@RequestMapping(value="/modifyReqAmount")
	@ResponseBody
	public ResponseEntity<Void> modifyReqAmount(@RequestBody List<RequiredAmount> reqAmounts) { // @LoginedEMP Employee employee
		System.out.println("############소요량 취합 저장할 값, productCode 확인: "+reqAmounts);
		requiredAmountService.modifyAggregateAmount(reqAmounts);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	
	@RequestMapping("/removeReqAmount")
	@ResponseBody
	public ResponseEntity<Void> removeReqAmount(@RequestBody List<RequiredAmount> reqAmounts) {
		System.out.println("############소요량 삭제되는 행의 코드: "+reqAmounts);
		requiredAmountService.removeReqAmount(reqAmounts);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
