package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.ChargeProduct;
import com.erphero.vo.Search;

public interface ChargeProductDao {
	
	List<ChargeProduct> searchChargeProducts(Search search);

	List<ChargeProduct> searchSavedChargeProducts(Search search);
	
	List<ChargeProduct> getChargeProductByChargeCode(@Param("chargeCode") String chargeCode);
	
	List<ChargeProduct> getChargeProductsByProductCode(@Param("productCode") String productCode);
	ChargeProduct getChargeProductByNo(@Param("no") long no);
	
	/**
	 * 새 청구등록에 따른 상품들을 DB에 저장한다.
	 * @param chargeProduct
	 */
	void insertChargeProduct(ChargeProduct chargeProduct);
	
	/**
	 * 청구에 해당하는 상품들 모두 삭제한다.
	 * @param code
	 */
	void deleteChargeProductByChargeCode (String code);
	
	/**
	 * 청구에 해당하는 상품들 각각 삭제한다.
	 * @param no
	 */
	void deleteChargeProducts(Long no);
	
}
