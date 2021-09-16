package com.erphero.web.sales;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.EstimateService;
import com.erphero.service.ProductService;
import com.erphero.vo.Employee;
import com.erphero.vo.Estimate;
import com.erphero.vo.Product;
import com.erphero.vo.Search;
import com.erphero.vo.ParamEstimate;
import com.erphero.web.annotation.LoginedEmp;

@Controller
public class EstimateController {
	private static Logger logger = LogManager.getLogger(EstimateController.class);
	
	@Autowired ProductService ProductService;
	@Autowired EstimateService estimateService;
	
	@GetMapping("/estimateform")
	public String estimatesForm() {
		logger.info("견적등록폼 요청 처리");
		
		return "estimatesform";
	}
	
	@RequestMapping("/estimateform/searchList")
	public @ResponseBody ResponseEntity<List<Product>> searchlist() {
		List<Product> sellProductsList = ProductService.getAllSellProducts();
		
		return new ResponseEntity<>(sellProductsList, HttpStatus.OK); 
	}
	
	@PostMapping("/estimateform/insertEstimates")
	public String insertEstimate(ParamEstimate paramEstimate) {
		logger.info("견적등록 insert요청");
		estimateService.insertEstimate(paramEstimate);
		
		return "home";
	}
	
	@GetMapping("/estimate")
	public String estimate(@LoginedEmp Employee employee) {
		logger.info("견적페이지 요청");
		logger.info("사용자 정보" + employee);
		
		return "estimate/estimatelist";
	}
	
	
	 @GetMapping("/estimate/search") 
	 public @ResponseBody ResponseEntity<List<Estimate>> search(Search search){
		 logger.info("search실행");
		 List<Estimate> estimates = estimateService.getAllEstimateWithProducts(search);
		 System.out.println("Estimate: " + estimates);
		 logger.info("seach완료");
		 logger.info("");
		 logger.info("");
	 return new ResponseEntity<>(estimates, HttpStatus.OK); 
	 }
	
	
	
}