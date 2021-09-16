package com.erphero.service;

import java.util.List;

import com.erphero.vo.RequiredAmount;
import com.erphero.vo.Search;

public interface RequiredAmountService {

	List<RequiredAmount> searchRequiredAmounts(Search search);
	List<RequiredAmount> searchSavedRequiredAmounts(Search search);
	List<RequiredAmount> searchRequiredAmountsWithoutSafeStock(Search search);
	List<RequiredAmount> getAllAggregateAmount();
	void addRequiredAmount (List<RequiredAmount> reqAmounts);
	RequiredAmount getRequiredAmountByNo(long no);
	List<RequiredAmount> getRequiredAmountsByProductCode(String productCode);
	void modifyAggregateAmount(List<RequiredAmount> reqAmounts);
	void removeReqAmount(List<RequiredAmount> reqAmounts);
}
