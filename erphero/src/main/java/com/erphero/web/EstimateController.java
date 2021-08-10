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

import com.erphero.service.ProductService;
import com.erphero.vo.Product;
import com.erphero.web.view.JsonView;

@Controller
@RequestMapping("/estimates")
public class EstimateController {
	private static Logger logger = LogManager.getLogger(EstimateController.class);
	
	@Autowired ProductService ProductService;
	@Autowired JsonView jsonView;
	
	@GetMapping()
	public String estimatesForm(Model model) {
		logger.info("견적등록폼 요청 처리");
		
		return "estimatesform";
	}
	
	@RequestMapping("searchList")
	public @ResponseBody ResponseEntity<List<Product>> searchlist() {
		List<Product> sellProductsList = ProductService.getAllSellProducts();
		
		return new ResponseEntity<>(sellProductsList,HttpStatus.OK); 
	}
	
	@PostMapping("insertEstimates")
	public String insertEstimate() {
		logger.info("견적등록 insert요청");
		return "clienthome";
	}
}
