package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.PlanningDao;
import com.erphero.dto.Contract;
import com.erphero.vo.Planning;

@Service
public class PlanningServiceImpl implements PlanningService {

	@Autowired PlanningDao planningDao;
	
	@Override
	public List<Planning> getAllPlannings() {
		return planningDao.getAllPlannings();
	}
	
	@Override
	public List<Contract> getAllContracts() {
		return planningDao.getAllContracts();
	}
	@Override
	public Contract getContractDetail() {
		return null;
	}
	@Override
	public Planning getPlanningDetail(String contractCode) {
		return planningDao.getPlanningByContractCode(contractCode);
	}
	@Override
	public void addReview(Planning planning) {
		planningDao.insertPlanning(planning);
	}
	

	
}
