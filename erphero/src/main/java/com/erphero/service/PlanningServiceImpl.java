package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.ContractDao;
import com.erphero.dao.PlanningDao;
import com.erphero.dto.Contract;
import com.erphero.vo.Planning;
import com.erphero.vo.Search;

@Service
public class PlanningServiceImpl implements PlanningService {

	@Autowired PlanningDao planningDao;
	@Autowired ContractDao contractDao;
	
	@Override
	public List<Contract> searchContracts(Search search) {
		return planningDao.searchContracts(search);
	}
	@Override
	public Contract getContractDetail() {
		return null;
	}
	@Override
	public List<Planning> searchPlannings(Search search) {
		return planningDao.searchPlannings(search);
	}
		
	@Override
	public void addPlanning(List<Planning> plannings) {
		for(Planning planning: plannings) {
			//작성할 상품의 상태만 변경
			System.out.println("수주때 사원코드 : "+planning.getEmpCode());
			contractDao.updateSaveStatus(planning.getContractProductNo(), "Y");
			planningDao.insertPlanning(planning);
			
			System.out.println("#######저장된 주계획 작성: "+planning);
		}
	}
	@Override
	public void removePlanningByCode(List<String> codes) {
		for(String code: codes) {
			
			Planning planning =planningDao.getPlannningByCode(code);
			contractDao.updateSaveStatus(planning.getContractProductNo(), "N");
			planningDao.deletePlanningByCode(code);
		}
	}
	
	
	@Override
	public Planning getPlanningByCode(String code) {
		return planningDao.getPlannningByCode(code);
	}
	
	

}
