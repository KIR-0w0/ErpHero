package com.erphero.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.ContractDao;
import com.erphero.dao.ContractProductDao;
import com.erphero.dao.EstimateDao;
import com.erphero.dao.EstimateProductDao;
import com.erphero.dto.EstimateProductDto;
import com.erphero.vo.Contract;
import com.erphero.vo.ContractProduct;
import com.erphero.vo.EstimateProduct;
import com.erphero.vo.ParamContract;
import com.erphero.vo.ParamDeleteContract;
import com.erphero.vo.Search;

@Service
public class ContractServiceImpl implements ContractService{
	@Autowired EstimateDao 			estimateDao;
	@Autowired ContractDao 			contractDao;
	@Autowired EstimateProductDao 	estimateProductDao;
	@Autowired ContractProductDao	contractProductDao;
	
	@Override
	public List<EstimateProductDto> getAllEstimateWithProducts(Search search) {
		return estimateDao.getAllEstimateWithProducts(search);
	}
	
	@Override
	public void insertContract(ParamContract paramContract) {
		Contract contract = new Contract();
		contract.setContractDate(paramContract.getContractDate());
		contract.setVenderCode(paramContract.getVenderCode());
		contract.setEmpCode(paramContract.getEmpCode());
		contract.setMgrCode(paramContract.getMgrCode());
		contract.setStatus("Y");
		
		System.out.println("contract: " + contract);
		System.out.println();
		contractDao.insertContract(contract);
		
		List<Long> estimatesNo = paramContract.getEsNo();
		List<String> prCode = paramContract.getPrCode();
		List<Date> shipDate = paramContract.getShipDate();
		List<Date> deliveryDate = paramContract.getDeliveryDate();
		List<Long> amount = paramContract.getAmount();
		for(int i=0; i<estimatesNo.size(); i++) {
			System.out.println("estimatesNo: "+ estimatesNo);
			System.out.println("prCode: "+ prCode);
			System.out.println("shipDate: "+ shipDate);
			ContractProduct cnProduct = new ContractProduct();
			cnProduct.setCnCode(contract.getCode());
			cnProduct.setPrCode(prCode.get(i));
			cnProduct.setEsPrNo(estimatesNo.get(i));
			cnProduct.setShipDate(shipDate.get(i));
			cnProduct.setDeliveryDate(deliveryDate.get(i));
			cnProduct.setAmount(amount.get(i));
			System.out.println("cnProduct: " + cnProduct);
			contractProductDao.insertContractProduct(cnProduct);
			
			Long estimateNo = estimatesNo.get(i);
			
			List<EstimateProduct> estimateProducts = estimateProductDao.getEstimateProductByNo(estimateNo);
			for(EstimateProduct estimateProduct : estimateProducts ) {
					System.out.println("estimateProduct" + estimateProduct);
					estimateProduct.setSaveStatus("Y");
					estimateProductDao.updateEstimateProductStatus(estimateProduct);
			}
			
			System.out.println("#######contractProduct 저장완료");
			System.out.println();
		}
		
	}
	
	@Override
	public List<Contract> getContracts(Search search) {
		List<Contract> contracts = contractDao.getContracts(search);
		for(Contract contract : contracts) {
			System.out.println(contract);
		}
		return contracts;
	}
	
	@Override
	public List<ContractProduct> getContractProductsByCode(String code) {
		
		return contractProductDao.getContractProductByCode(code); 
	}
	
	@Override
	public void deleteContract(ParamDeleteContract param) {
		List<Long> numbers = param.getPrNo();
		List<Long> estimateProductsNo = param.getEsPrNo();
		for(int i=0; i<numbers.size(); i++ ) {
			Long no = numbers.get(i);
			Long estimateProductNo = estimateProductsNo.get(i);
			
			contractProductDao.deleteContractProduct(no);
			List<EstimateProduct> estimateProducts = estimateProductDao.getEstimateProductByNo(estimateProductNo);
			for(EstimateProduct estimateProduct : estimateProducts ) {
				System.out.println("estimateProduct" + estimateProduct);
				estimateProduct.setSaveStatus("N");
				estimateProductDao.updateEstimateProductStatus(estimateProduct);
			}
		}
		
		List<ContractProduct> contractPrdocuts = contractProductDao.getContractProductByCode(param.getContractCode());
		System.out.println(contractPrdocuts + "contractPrdocuts");
		System.out.println(contractPrdocuts.size() + "contractPrdocutsSize");
		
		if(contractPrdocuts.size() == 0) {
			contractDao.deleteContract(param.getContractCode());
		}
	}
	
}
