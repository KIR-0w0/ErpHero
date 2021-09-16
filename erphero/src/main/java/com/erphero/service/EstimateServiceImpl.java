package com.erphero.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.EstimateDao;
import com.erphero.dao.EstimateProductDao;
import com.erphero.dao.VenderDao;
import com.erphero.vo.Estimate;
import com.erphero.vo.EstimateProduct;
import com.erphero.vo.ParamEstimate;
import com.erphero.vo.Search;
import com.erphero.vo.Vender;


@Service
public class EstimateServiceImpl implements EstimateService{

	@Autowired EstimateDao estimateDao;
	@Autowired VenderDao venderDao;
	@Autowired EstimateProductDao estimateProductDao;
	
	@Override
	public void insertEstimate(ParamEstimate paramEstimate){

		if(venderDao.getVenderByregNum(paramEstimate.getBusinessNumber()) == null) {
			Vender vender = new Vender();
			vender.setName(paramEstimate.getVenderName());
			vender.setRegNum(paramEstimate.getBusinessNumber());
			vender.setEmail(paramEstimate.getEmail());
			vender.setPhone(paramEstimate.getPhone());
			venderDao.insertVenderEstimating(vender);
			System.out.println("새로운 venderDB 생성");
			
			Estimate estimate = new Estimate();
			estimate.setReqName(paramEstimate.getName());
			estimate.setVenderCode(paramEstimate.getBusinessNumber());
			estimateDao.insertEstimate(estimate);
			System.out.println("새로운 EstimatesDB 생성");
			System.out.println("############Code : " + estimate.getCode());
			
			
			List<String> reqProductsCode = paramEstimate.getProductsCode();
			List<Long> addListAmount = paramEstimate.getProductsAmount();
			for(int i=0; i<reqProductsCode.size(); i++) {
				EstimateProduct product = new EstimateProduct();
				product.setEstimateCode(estimate.getCode());
				product.setProductCode(reqProductsCode.get(i));
				product.setEstimateAmount(addListAmount.get(i));
				product.setDeliveryDate(paramEstimate.getDeliveryDate());
				
				System.out.println("savedEsProducts: " + product);
				estimateProductDao.insertEstimateProduct(product);
			}
			
		} else {
			
			Estimate estimate = new Estimate();
			estimate.setReqName(paramEstimate.getName());
			estimate.setVenderCode(paramEstimate.getBusinessNumber());
			estimateDao.insertEstimate(estimate);
			System.out.println("새로운 EstimatesDB 생성");
			System.out.println("############Code : " + estimate.getCode());
			
			
			List<String> reqProductsCode = paramEstimate.getProductsCode();
			List<Long> addListAmount = paramEstimate.getProductsAmount();
			for(int i=0; i<reqProductsCode.size(); i++) {
				EstimateProduct product = new EstimateProduct();
				product.setEstimateCode(estimate.getCode());
				product.setProductCode(reqProductsCode.get(i));
				product.setEstimateAmount(addListAmount.get(i));
				product.setDeliveryDate(paramEstimate.getDeliveryDate());
				
				System.out.println("savedEsProducts: " + product);
				estimateProductDao.insertEstimateProduct(product);
			}
			
		}
		
	}
	
	@Override
	public void updateEstimate(Estimate estimate) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Estimate> getAllEstimateWithProducts(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
}
