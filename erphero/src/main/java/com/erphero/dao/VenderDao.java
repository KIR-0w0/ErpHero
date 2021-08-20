package com.erphero.dao;

import com.erphero.vo.Vender;

public interface VenderDao {

	/**
	 * 사업자 번호로 거래처의 정보를 가져온다.
	 * @param regNum 사업자 번호
	 * @return 일치하는 거래처
	 */
	Vender getVenderByregNum(String regNum);
	
	/**
	 * 거래처 정보를 등록한다.
	 * @param vender 거래처 정보
	 */
	void insertVender(Vender vender);
	
	/**
	 * 거래처 정보를 업데이트 한다.
	 * @param vender 거래처 정보
	 */
	void updateVender(Vender vender);
	
}
