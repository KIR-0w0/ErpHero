package com.erphero.dao;

import java.util.List;

import com.erphero.vo.ContractProduct;

public interface ContractProductDao {

	void insertContractProduct(ContractProduct product);
	
	void deleteContractProduct(Long no);
	
	ContractProduct getContractProductByNo(Long no); 
	List<ContractProduct> getContractProductByCode(String code);
}
