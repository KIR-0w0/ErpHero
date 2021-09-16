package com.erphero.web.sales;

import java.util.List;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.dto.EstimateProductDto;
import com.erphero.service.ContractService;
import com.erphero.service.EstimateService;
import com.erphero.vo.Contract;
import com.erphero.vo.ContractProduct;
import com.erphero.vo.ParamContract;
import com.erphero.vo.ParamDeleteContract;
import com.erphero.vo.Search;



@Controller
public class ContractController {
	private static Logger logger = LogManager.getLogger(ContractController.class);
	
	@Autowired ContractService contractService;
	@Autowired EstimateService estimateService;
	
	
	@RequestMapping(path = {"/contract"})
	public String contract() {
		logger.info("contract 요청");
		
		return "contract/contractlist";
	}
	
	@RequestMapping("/contract/searchEstimate")
	 public @ResponseBody ResponseEntity<List<EstimateProductDto>> searchEstimate(@RequestBody Search search){
		 logger.info("search실행");
		 List<EstimateProductDto> estimates = contractService.getAllEstimateWithProducts(search);
		 System.out.println("###############");
		 System.out.println("Search :" + search);
		 System.out.println("Estimate: " + estimates);
	 return new ResponseEntity<>(estimates, HttpStatus.OK); 
	}
	
	@PostMapping("/contract/save")
	public String save(ParamContract paramContract) {
		logger.info("save실행");
		logger.info("paramContract"+ paramContract);
		
		
		contractService.insertContract(paramContract);
		
		logger.info("save완료");
		return "/contract/contractlist";
 	}
	
	@PostMapping("/contract/list/search")
	@ResponseBody public ResponseEntity<List<Contract>>search(@RequestBody Search search) {
		logger.info("contract/search 요청");
		List<Contract> contracts = contractService.getContracts(search);
		
		System.out.println("######### Contracts:" +contracts);
		 return new ResponseEntity<>(contracts, HttpStatus.OK); 
	}
	
	@RequestMapping(value="/contract/searchContractProduct")
	@ResponseBody public ResponseEntity<List<ContractProduct>> searchProducts(@RequestParam("contractCode") String code) {
		List<ContractProduct> contractProducts = contractService.getContractProductsByCode(code);
		return new ResponseEntity<>(contractProducts, HttpStatus.OK);
	}
	
	@PostMapping("/contract/delete")
	public String deleteContract(ParamDeleteContract param) {
		logger.info("contract/delete 요청");
		logger.info("############param" + param);
		contractService.deleteContract(param);
		logger.info("삭제완료");
		return "/contract/contractlist";
	}
}
