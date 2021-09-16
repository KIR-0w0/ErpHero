package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.Charge;
import com.erphero.vo.Search;

public interface ChargeDao {

	List<Charge> searchSavedCharges(Search search);
	
	/**
	 * 새 청구등록 작성을 DB에 저장한다.
	 * @param charge
	 */
	void insertCharge(Charge charge);
	

	/**
	 * 청구등록코드에 해당하는 청구등록 객체를 조회한다.
	 * @param chage
	 * @return
	 */
	Charge getChargeByCode(@Param("code") String code);
	
	/*
	 * 청구등록의 내용을 변경에서 DB에 저장한다.
	 */
	void updateCharge (Charge charge);
	
	
	
}
