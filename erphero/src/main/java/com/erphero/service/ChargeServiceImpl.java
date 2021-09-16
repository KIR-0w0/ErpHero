package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.ChargeDao;
import com.erphero.dao.ChargeProductDao;
import com.erphero.dao.RequiredAmountDao;
import com.erphero.vo.Charge;
import com.erphero.vo.ChargeProduct;
import com.erphero.vo.Search;

@Service
public class ChargeServiceImpl implements ChargeService{


	@Autowired ChargeDao chargeDao;
	@Autowired ChargeProductDao chargeProductDao;
	@Autowired RequiredAmountDao reqAmountDao;
	
	
	@Override
	public void addCharge(List<Charge> charges) {
		System.out.println("charges가 궁금하다: "+ charges);//여기부터가 사용자가 입력한 값이 안들어옴
		
		for(Charge charge : charges) {
			chargeDao.insertCharge(charge);
			
			List<ChargeProduct> products = charge.getChargeProducts();
			for(ChargeProduct product : products) {
				reqAmountDao.updateSaveStatus(product.getRequiredNo(), "Y");
				product.setChargeCode(charge.getCode());
				chargeProductDao.insertChargeProduct(product);
				System.out.println("저장할 때 req상태는 바뀜: "+product.getRequiredNo());
			}
		}
	}
	@Override
	public void removeCharge(List<String> codes) {
		for(String code: codes) {
			Charge savedCharge = chargeDao.getChargeByCode(code);
			savedCharge.setStatus("N");//
			List<ChargeProduct> products = chargeProductDao.getChargeProductByChargeCode(code);
			for (ChargeProduct product : products) {
				reqAmountDao.updateSaveStatus(product.getRequiredNo(), "N");
				System.out.println("req상태가 왜 안바뀌지???????????????????"+product.getRequiredNo());
			}
			chargeProductDao.deleteChargeProductByChargeCode(code);
			chargeDao.updateCharge(savedCharge);
			
		}		
	}
	
	@Override
	public Charge getChargeByCode(String code) {
		return chargeDao.getChargeByCode(code);
	}
	@Override
	public List<Charge> searchSavedCharges(Search search) {
		return chargeDao.searchSavedCharges(search);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<ChargeProduct> searchChargeProducts(Search search) {
		return chargeProductDao.searchChargeProducts(search);
	}
	@Override
	public void addChargeProduct(String chargeCode, List<ChargeProduct> chargeProducts) {
		//chargeProduct 들을 먼저 저장
		for(ChargeProduct chargeProduct: chargeProducts) {
			chargeProductDao.insertChargeProduct(chargeProduct);
		}
		//상품에서 청구등록을 하는 기본키가 있으니까 그것으로 청구와 연결시켜줌
		Charge charge = chargeDao.getChargeByCode(chargeCode);
		//charge를 업데이트 시켜줌
		chargeDao.updateCharge(charge); 
	}
	@Override
	public List<ChargeProduct> getChargeProductsByChargeCode(String chargeCode) {
		return chargeProductDao.getChargeProductByChargeCode(chargeCode);
	}
	@Override
	public void removeChargeProductByChargeCode(String code) {
		chargeProductDao.deleteChargeProductByChargeCode(code);
	}
	
	@Override
	public ChargeProduct getChargeProductByNo(long no) {
		return chargeProductDao.getChargeProductByNo(no);
	}
	@Override
	public List<ChargeProduct> getChargeProductsByProductCode(String productCode) {
		return chargeProductDao.getChargeProductsByProductCode(productCode);
	}
	@Override
	public void removeChargeProducts(List<Long> nos) {
		String chargeCode = null;
		for(Long no: nos) {
			ChargeProduct chargeProduct = chargeProductDao.getChargeProductByNo(no);
			if(chargeCode == null) {
				chargeCode = chargeProduct.getChargeCode(); 
				System.out.println("지금 삭제중인 상품의 청구코드 : " + chargeCode);
			}
			reqAmountDao.updateSaveStatus(chargeProduct.getRequiredNo(), "N");
			chargeProductDao.deleteChargeProducts(no);
		}
		List<ChargeProduct> chargeProducts = chargeProductDao.getChargeProductByChargeCode(chargeCode);
		if(chargeProducts.isEmpty()) {
			Charge charge = chargeDao.getChargeByCode(chargeCode);
			charge.setStatus("N");
			chargeDao.updateCharge(charge);
		}
	}
}
