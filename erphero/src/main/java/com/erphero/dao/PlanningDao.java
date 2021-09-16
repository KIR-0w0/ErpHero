package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.dto.Contract;
import com.erphero.vo.Planning;
import com.erphero.vo.Search;

public interface PlanningDao {

	List<Contract> searchContracts(Search search);
	List<Planning> searchPlannings(Search search);
	
	/**
	 * 새 주계획작성을 DB에 저장한다.
	 * @param planning 주계획작성
	 */
	void insertPlanning(Planning planning);
	
	Planning getPlannningByCode(@Param("code") String code);
	/**
	 * 주계획 작성된 것을 삭제한다.
	 * @param code 주계획코드
	 */
	void deletePlanningByCode(String code);
	
	/**
	 * 소요량 전개 단계에서의 사용용도로써 소요량전개 저장 여부를 저장한다. 
	 * @param code
	 * @param saveStatus
	 */
	void updateSaveStatus (@Param("code") String code, @Param("saveStatus") String saveStatus);
}
