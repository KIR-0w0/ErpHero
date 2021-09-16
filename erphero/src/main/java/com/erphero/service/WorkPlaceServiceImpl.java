package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.WorkPlaceDao;
import com.erphero.vo.WorkPlace;

@Service
public class WorkPlaceServiceImpl implements WorkPlaceService{
	
	@Autowired
	WorkPlaceDao workPlaceDao;
	
	@Override
	public void registerWorkPlace(WorkPlace workPlace) {
		workPlaceDao.insertWorkPlace(workPlace);
	}
	@Override
	public void modifyWorkPlace(WorkPlace workPlace) {
		workPlaceDao.updateWorkPlace(workPlace);
	}
	@Override
	public void deleteWorkPlaceByCode(String code) {
		workPlaceDao.deleteWorkPlaceByCode(code);
	}
	@Override
	public WorkPlace getWorkPlaceByCode(String code) {
		return workPlaceDao.getWorkPlaceByCode(code);
	}
	@Override
	public List<WorkPlace> getAllWorkPlaces() {
		return workPlaceDao.getAllWorkPlaces();
	}
}
