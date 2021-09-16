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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.dto.Contract;
import com.erphero.service.PlanningService;
import com.erphero.vo.Planning;
import com.erphero.vo.Search;

@Controller
@RequestMapping("/planning")
public class PlanningController {
	@Autowired
	PlanningService planningService;

	@GetMapping("/list")
	public String plannings() {
		return "planning/list";
	}

	@RequestMapping("/list/json")
	@ResponseBody
	public ResponseEntity<List<Contract>> searchContracts(@RequestBody Search search) {
		List<Contract> contracts = planningService.searchContracts(search);
		System.out.println("#####################수주등록된 상품"+contracts);
		return new ResponseEntity<>(contracts, HttpStatus.OK);
	}
	
	
	//객체 만들기
	@PostMapping("/list2/json/search")
	@ResponseBody
	public ResponseEntity<List<Planning>> searchPlanning(@RequestBody Search search) { //@LoginEMP가 없어..
		System.out.println("####################"+search); //값이 제대로 오는지 확인
	
		List<Planning> plannings = planningService.searchPlannings(search); //Search를 전해줘야 함
		
		System.out.println("주계획리스트들: "+plannings);
		return new ResponseEntity<List<Planning>>(plannings, HttpStatus.OK);
	}

	@RequestMapping(value="/addPlanning")
	@ResponseBody
	public ResponseEntity<Void> addPlanning(@RequestBody List<Planning> plannings) { // @LoginedEMP Employee employee
		System.out.println("############계획일입력후 저장: "+plannings);
		planningService.addPlanning(plannings);

		return new ResponseEntity<>( HttpStatus.OK);//값을 입력하고 화면이 계속 유지되어야 하기때문에 ajax로 처리해야 함.
	}
	
	@RequestMapping("/deletePlanning")
	@ResponseBody
	public ResponseEntity<Void> deletePlanning(@RequestParam("pcode") List<String> codes) {
		System.out.println("############주계획 삭제되는 행의 코드: "+codes);
		
		planningService.removePlanningByCode(codes);
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
