package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.InboundProduct;
import com.erphero.vo.Search;

public interface InboundProductDao {
	
	List<InboundProduct> searchInboundProducts(Search search);

	List<InboundProduct> searchSavedInboundProducts(Search search);
	
	List<InboundProduct> getInboundProductByInboundCode(@Param("inboundCode") String inboundCode);
	
	List<InboundProduct> getInboundProductsByProductCode(@Param("productCode") String productCode);
	InboundProduct getInboundProductByNo(@Param("no") long no);
	
	/**
	 * 새 입고의뢰등록에 따른 상품들을 DB에 저장한다.
	 * @param chargeProduct
	 */
	void insertInboundProduct(InboundProduct inboundProduct);
	
	/**
	 * 입고에 해당하는 상품들 모두 삭제한다.
	 * @param code
	 */
	void deleteInboundProductByInboundCode (String code);
	
	/**
	 * 입고에 해당하는 상품들 각각 삭제한다.
	 * @param no
	 */
	void deleteInboundProducts(Long no);
	
	void updateSaveStatus (@Param("icode") String code, @Param("saveStatus") String saveStatus);
	
	/**
	 * 입고처리시 상품들정보를 변경한다.
	 * @param inboundProduct
	 */
	void updateInboundProduct(InboundProduct inboundProduct);
}
