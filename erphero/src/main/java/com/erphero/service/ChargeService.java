package com.erphero.service;

import java.util.List;

import com.erphero.vo.Charge;
import com.erphero.vo.ChargeProduct;
import com.erphero.vo.Search;

public interface ChargeService {

	List<Charge> searchSavedCharges(Search search);
	
	/**
	 * 소요량 전개된 상품에 대해 청구 작성을 등록하는 서비스
	 * @param charge 청구등록정보
	 */
	void addCharge(List<Charge> charge);
	
	/**
	 * 청구객체의 상태를 바꾼다.
	 * @param codes
	 */
	void removeCharge(List<String> codes);
	
	/**
	 * 소요량 전개된 상품에 대해 청구 작성 정보를 제공하는 서비스
	 * @param code 청구코드
	 * @return
	 */
	Charge getChargeByCode(String code);
	
	
	//////////////////////////////////////////////////////////////////////////////////
	List<ChargeProduct> searchChargeProducts(Search search);
	void addChargeProduct(String chargeCode, List<ChargeProduct> chargeProducts);
	
	List<ChargeProduct> getChargeProductsByChargeCode(String chargeCode);
	List<ChargeProduct> getChargeProductsByProductCode(String productCode);
	
	void removeChargeProductByChargeCode(String chargeCode);
	ChargeProduct getChargeProductByNo(long no);

	/**
	 * 청구객체의 코드로 얻어진 저장된 상품들을 삭제한다. 
	 * @param nos 청구상품번호
	 */
	void removeChargeProducts(List<Long> nos);
	

	
}
