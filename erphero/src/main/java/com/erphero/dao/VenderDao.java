package com.erphero.dao;

import java.util.List;


import com.erphero.vo.Vender;

public interface VenderDao {

	/**
	 * 거래처 정보를 등록한다.
	 * @param vender
	 */
	void insertVender(Vender vender);
	
	/**
	 * 견적요청시 거래처 정보를 등록한다.
	 * @param vender
	 */
	void insertVenderEstimating(Vender vender);
	
	void deleteVenderByCode(String code);
	
	List<Vender> searchVender (String name);
	
	List<Vender> getAllVender();
	
	Vender getVenderByCode(String code);
	
	/**
	 * 사업자 번호로 거래처의 정보를 가져온다.
	 * @param regNum 사업자 번호
	 * @return 일치하는 거래처
	 */
	Vender getVenderByregNum(String regNum);
	
}
