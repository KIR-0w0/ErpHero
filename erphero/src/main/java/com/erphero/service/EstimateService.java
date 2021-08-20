package com.erphero.service;



import com.erphero.vo.Estimate;
import com.erphero.vo.ReqEstimate;

public interface EstimateService {

	void insertEstimate(ReqEstimate reqEstimate);
	
	void updateEstimate(Estimate estimate);
	
	
}
