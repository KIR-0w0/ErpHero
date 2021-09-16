package com.erphero.service;




import java.util.List;

import com.erphero.vo.Estimate;
import com.erphero.vo.ParamEstimate;
import com.erphero.vo.Search;

public interface EstimateService {

	void insertEstimate(ParamEstimate paramEstimate);
	
	void updateEstimate(Estimate estimate);
	
	List<Estimate> getAllEstimateWithProducts(Search search);
	
}
