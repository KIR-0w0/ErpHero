package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.RequiredAmount;
import com.erphero.vo.Search;

public interface RequiredAmountDao {

	List<RequiredAmount> searchRequiredAmounts(Search search);
	List<RequiredAmount> searchSavedRequiredAmounts(Search search);
	void insertReqAmount(RequiredAmount reqAmount);
	RequiredAmount getRequiredAmountByNo(long no);
	
	/**
	 * 취합된 소요량 전개의 소요량 취합값을 바꿔주기 위해 해당 품번의 소요량 전개 객체를 조회한다.
	 * @param productCode 품번(상품코드)
	 * @return 소요량 전개 객체 list
	 */
	List<RequiredAmount> getRequiredAmountsByProductCode(@Param("productCode") String productCode);
	
	
	/**
	 * 저장된 소요량 전개 객체들에 대해 소요량을 취합한다.
	 * @return 소요량 전개 객체 list
	 */
	List<RequiredAmount> getAllAggregateAmount();
	/**
	 * 소요량 취합 후, 소요량 전개 객체의 소요량 취합값을 새로 입력한다.
	 * @param reqAmount
	 */
	void updateForAggregateAmount (RequiredAmount reqAmount);
	
	/**
	 * 소요량 전개 객체를 삭제했을 때, 상태를 변경한다.
	 * @param reqAmount
	 */
	void updateStatus(RequiredAmount reqAmount);
	
	/**
	 * 청구등록에서의 사용용도로써 청구등록의 저장 여부를 저장한다. 
	 * @param no
	 * @param saveStatus
	 */
	void updateSaveStatus (@Param("no") long no, @Param("saveStatus") String saveStatus);
}
