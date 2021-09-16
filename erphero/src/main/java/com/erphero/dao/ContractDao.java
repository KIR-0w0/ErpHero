package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.Contract;
import com.erphero.vo.Search;


public interface ContractDao {
	/**
	 * 주계획 작성에서의 사용용도로써 주계획 작성의 저장 여부를 저장한다. 
	 * @param contractProductNo
	 * @param saveStatus
	 */
	void updateSaveStatus (@Param("no") long contractProductNo, @Param("saveStatus") String saveStatus);
	
	/**
	 * 수주를 등록한다.
	 * @param contract
	 */
	void insertContract (Contract contract);
	
	void deleteContract (String contractCode);
	
	List<Contract> getContracts (Search search);
}
