package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.PlanningDao;
import com.erphero.dao.RequiredAmountDao;
import com.erphero.vo.RequiredAmount;
import com.erphero.vo.Search;
@Service
public class RequiredAmountServiceImpl implements RequiredAmountService{

	@Autowired RequiredAmountDao requiredAmountDao;
	@Autowired PlanningDao planningDao;
	
	@Override
	public List<RequiredAmount> searchRequiredAmounts(Search search) {
		List<RequiredAmount> reqAmounts = requiredAmountDao.searchRequiredAmounts(search);
		for(RequiredAmount reqAmount : reqAmounts) {
			reqAmount.calculateRequiredAmount();
		}
		return reqAmounts;
	}
	@Override
	public List<RequiredAmount> searchRequiredAmountsWithoutSafeStock(Search search) {
		List<RequiredAmount> reqAmounts = requiredAmountDao.searchRequiredAmounts(search);
		for(RequiredAmount reqAmount : reqAmounts) {
			reqAmount.setProductSafeStock(0);
			reqAmount.calculateRequiredAmount();
		}
		return reqAmounts;
	}
	@Override
	public void addRequiredAmount(List<RequiredAmount> reqAmounts) {
		for(RequiredAmount reqAmount: reqAmounts) {
			planningDao.updateSaveStatus(reqAmount.getPlanningCode(), "Y");
			requiredAmountDao.insertReqAmount(reqAmount);
		}
	}
	@Override
	public void removeReqAmount(List<RequiredAmount> reqAmounts) {
		for(RequiredAmount reqAmount: reqAmounts) {
			List<RequiredAmount> savedReqAmounts = requiredAmountDao.getRequiredAmountsByProductCode(reqAmount.getProductCode());
			for(RequiredAmount savedReqAmount: savedReqAmounts) {
				savedReqAmount.setAmountSum(0);
				savedReqAmount.setStatus("N");
				requiredAmountDao.updateStatus(savedReqAmount);
			}
			planningDao.updateSaveStatus(reqAmount.getPlanningCode(), "N");
		}
	}
	@Override
	public RequiredAmount getRequiredAmountByNo(long no) {
		return requiredAmountDao.getRequiredAmountByNo(no);
	}
	@Override
	public List<RequiredAmount> getRequiredAmountsByProductCode(String productCode) {
		return requiredAmountDao.getRequiredAmountsByProductCode(productCode);
	}
	@Override
	public List<RequiredAmount> getAllAggregateAmount() {
		return requiredAmountDao.getAllAggregateAmount();
	}
	
	@Override
	public void modifyAggregateAmount(List<RequiredAmount> reqAmounts) {
		for(RequiredAmount reqAmount: reqAmounts) {
			List<RequiredAmount> savedReqAmounts = requiredAmountDao.getRequiredAmountsByProductCode(reqAmount.getProductCode());
			for(RequiredAmount savedReqAmount: savedReqAmounts) {
				savedReqAmount.setAmountSum(reqAmount.getAmountSum());
				requiredAmountDao.updateForAggregateAmount(savedReqAmount);
			}
		}
	}
	@Override
	public List<RequiredAmount> searchSavedRequiredAmounts(Search search) {
		return requiredAmountDao.searchSavedRequiredAmounts(search);
	}
}
