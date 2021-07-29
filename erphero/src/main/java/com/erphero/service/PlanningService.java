package com.erphero.service;

import java.util.List;


import com.erphero.dto.Contract;
import com.erphero.vo.Planning;

public interface PlanningService {

	List<Planning> getAllPlannings();
	List<Contract> getAllContracts();
	Contract getContractDetail();
	/**
	 * 지정된 수주코드번호에 해당하는 주계획작성의 상세정보를 제공하는 서비스
	 * @param contractCode 수주코드번호
	 * @return 주계획작성정보
	 */
	Planning getPlanningDetail(String contractCode);
	
	/**
	 * 수주등록된 상품에 대해 주계획 작성을 등록하는 서비스
	 * @param Planning 주계획작성 정보
	 */
	void addReview(Planning planning);
}
