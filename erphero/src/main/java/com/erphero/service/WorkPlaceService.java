package com.erphero.service;

import java.util.List;

import com.erphero.vo.WorkPlace;

public interface WorkPlaceService {

	void registerWorkPlace (WorkPlace workPlace);
	
	void modifyWorkPlace (WorkPlace workPlace);
	
	void deleteWorkPlaceByCode(String code);
	
	WorkPlace getWorkPlaceByCode(String code);
	
	List<WorkPlace> getAllWorkPlaces();
}
