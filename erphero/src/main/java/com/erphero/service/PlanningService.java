package com.erphero.service;

import java.util.List;


import com.erphero.dto.Contract;
import com.erphero.vo.Planning;
import com.erphero.vo.Search;

public interface PlanningService {

	List<Contract> searchContracts(Search search);
	Contract getContractDetail();
	
	/**
	 * 지정된 조건에 해당하는 주계획작성 정보를 제공하는 서비스
	 * @param condition
	 * @return 주계획작성 리스트
	 */
	List<Planning> searchPlannings(Search search);
	
	/**
	 * 수주등록된 상품에 대해 주계획 작성을 등록하는 서비스
	 * @param Planning 주계획작성 정보
	 */
	void addPlanning(List<Planning> plannings);
	
	void removePlanningByCode(List<String> codes);
	
	/**
	 * 주계획작성된 상품에 대해 주계획작성 정보를 제공하는 서비스
	 * @param code 주계획코드
	 * @return
	 */
	Planning getPlanningByCode(String code);
}
