package com.erphero.dao;

import com.erphero.vo.Estimate;

public interface EstimateDao {
	// 사업자번호로 조회해서 거래처가 존재하면 출력
	// 없으면 INSERT 작업을 실행한후 그 값을 출력
	
	void insertEstimate(Estimate estimate);
	
	void updateEstimate(Estimate estimate);
}
