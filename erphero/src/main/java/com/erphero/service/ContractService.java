package com.erphero.service;

import java.util.List;


import com.erphero.dto.EstimateProductDto;
import com.erphero.vo.Contract;
import com.erphero.vo.ContractProduct;
import com.erphero.vo.ParamContract;
import com.erphero.vo.ParamDeleteContract;
import com.erphero.vo.Search;

public interface ContractService {
	
	void insertContract (ParamContract paramContract);
	
	void deleteContract (ParamDeleteContract param);
	
	List<ContractProduct> getContractProductsByCode(String code);
	
	List<Contract> getContracts(Search search);
	List<EstimateProductDto> getAllEstimateWithProducts(Search search);
}
