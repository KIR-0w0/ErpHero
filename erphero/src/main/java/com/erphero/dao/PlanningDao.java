package com.erphero.dao;

import java.util.List;

import com.erphero.dto.Contract;
import com.erphero.vo.Planning;

public interface PlanningDao {

	List<Planning> getAllPlannings();
	List<Contract> getAllContracts();
	//Contract getContractByCode();
	Planning getPlanningByContractCode(String contractCode);
	
	/**
	 * 새 주계획작성을 저장한다.
	 * @param planning 주계획작성
	 */
	void insertPlanning(Planning planning);
}
