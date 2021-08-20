package com.erphero.web;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.EstimateService;
import com.erphero.service.ProductService;
import com.erphero.vo.Product;
import com.erphero.vo.ReqEstimate;
import com.erphero.web.view.JsonView;

@Controller
public class EstimateController {
	private static Logger logger = LogManager.getLogger(EstimateController.class);
	
	@Autowired ProductService ProductService;
	@Autowired EstimateService estimateService;
	@Autowired JsonView jsonView;
	
	@GetMapping("/estimateform")
	public String estimatesForm() {
		logger.info("견적등록폼 요청 처리");
		
		return "estimatesform";
	}
	
	@GetMapping("/estimate")
	public String estimate() {
		logger.info("견적페이지 요청");
		
		return "estimate/estimatelist";
	}
	
	@RequestMapping("/estimateform/searchList")
	public @ResponseBody ResponseEntity<List<Product>> searchlist() {
		List<Product> sellProductsList = ProductService.getAllSellProducts();
		
		return new ResponseEntity<>(sellProductsList,HttpStatus.OK); 
	}
	
	@PostMapping("/estimateform/insertEstimates")
	public String insertEstimate(ReqEstimate reqEstimate) {
		logger.info("견적등록 insert요청");
		estimateService.insertEstimate(reqEstimate);
		
		return "clienthome";
	}
	
}