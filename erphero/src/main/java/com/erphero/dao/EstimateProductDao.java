package com.erphero.dao;

import java.util.List;

import com.erphero.vo.EstimateProduct;

public interface EstimateProductDao {

	void insertEstimateProduct(EstimateProduct esProduct);
	void updateEstimateProductStatus(EstimateProduct estimateProduct);
	
	List<EstimateProduct> getEstimateProductByNo(Long estimateNo);
}
