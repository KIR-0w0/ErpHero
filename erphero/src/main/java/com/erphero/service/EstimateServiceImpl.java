package com.erphero.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.EstimateDao;
import com.erphero.dao.EstimateProductDao;
import com.erphero.dao.VenderDao;
import com.erphero.vo.Estimate;
import com.erphero.vo.EstimateProduct;
import com.erphero.vo.ReqEstimate;
import com.erphero.vo.Vender;


@Service
public class EstimateServiceImpl implements EstimateService{

	@Autowired EstimateDao estimateDao;
	@Autowired VenderDao venderDao;
	@Autowired EstimateProductDao estimateProductDao;
	
	@Override
	public void insertEstimate(ReqEstimate reqEstimate){

		if(venderDao.getVenderByregNum(reqEstimate.getBusinessNumber()) == null) {
			Vender vender = new Vender();
			vender.setName(reqEstimate.getVenderName());
			vender.setRegNum(reqEstimate.getBusinessNumber());
			vender.setMail(reqEstimate.getEmail());
			vender.setPhone(reqEstimate.getPhone());
			venderDao.insertVender(vender);
			System.out.println("새로운 venderDB 생성");
			
			Estimate estimate = new Estimate();
			estimate.setReqName(reqEstimate.getName());
			estimate.setVenderCode(reqEstimate.getBusinessNumber());
			estimateDao.insertEstimate(estimate);
			System.out.println("새로운 EstimatesDB 생성");
			System.out.println("############Code : " + estimate.getCode());
			
			
			List<String> reqProductsCode = reqEstimate.getProductsCode();
			List<Long> addListAmount = reqEstimate.getProductsAmount();
			for(int i=0; i<reqProductsCode.size(); i++) {
				EstimateProduct product = new EstimateProduct();
				product.setEstimateCode(estimate.getCode());
				product.setProductCode(reqProductsCode.get(i));
				product.setEstimateAmount(addListAmount.get(i));
				product.setDeliveryDate(reqEstimate.getDeliveryDate());
				
				System.out.println("savedEsProducts: " + product);
				estimateProductDao.insertEstimateProduct(product);
			}
			
		} else {
			
			Estimate estimate = new Estimate();
			estimate.setReqName(reqEstimate.getName());
			estimate.setVenderCode(reqEstimate.getBusinessNumber());
			estimateDao.insertEstimate(estimate);
			System.out.println("새로운 EstimatesDB 생성");
			System.out.println("############Code : " + estimate.getCode());
			
			
			List<String> reqProductsCode = reqEstimate.getProductsCode();
			List<Long> addListAmount = reqEstimate.getProductsAmount();
			for(int i=0; i<reqProductsCode.size(); i++) {
				EstimateProduct product = new EstimateProduct();
				product.setEstimateCode(estimate.getCode());
				product.setProductCode(reqProductsCode.get(i));
				product.setEstimateAmount(addListAmount.get(i));
				product.setDeliveryDate(reqEstimate.getDeliveryDate());
				
				System.out.println("savedEsProducts: " + product);
				estimateProductDao.insertEstimateProduct(product);
			}
			
		}
		
	}
	
	
	@Override
	public void updateEstimate(Estimate estimate) {
		// TODO Auto-generated method stub
		
	}
}
