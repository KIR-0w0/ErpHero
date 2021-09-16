package com.erphero.dao;

import java.util.List;

import com.erphero.vo.WorkPlace;

public interface WorkPlaceDao {
	/**
	 * 새로운 사업장을 등록한다.
	 * @param workplace
	 */
	void insertWorkPlace(WorkPlace workplace);
	/**
	 * 사업장의 정보를 변경한다.
	 * @param workplace
	 */
	void updateWorkPlace(WorkPlace workplace);
	/**
	 * 사업장의 정보를 삭제한다.
	 * @param code
	 */
	void deleteWorkPlaceByCode(String code);
	/**
	 * 사업장의 코드에 해당하는 사업장의 정보를 조회한다.
	 * @param code
	 * @return
	 */
	WorkPlace getWorkPlaceByCode(String code);
	/**
	 * 모든 사업장을 조회한다.
	 * @return 사업장 리스트
	 */
	List<WorkPlace> getAllWorkPlaces();
}
