package com.erphero.dao;

import java.util.List;

import com.erphero.vo.Department;

public interface DepartmentDao {
	/**
	 * 새로운 부서를 등록한다.
	 * @param department
	 */
	void insertDepartment(Department department);
	/**
	 * 부서의 정보를 변경한다.
	 * @param department
	 */
	void updateDepartment(Department department);
	/**
	 * 부서의 정보를 삭제한다.
	 * @param code
	 */
	void deleteDepartmentByCode(String code);
	/**
	 * 부서의 코드에 해당하는 부서의 정보를 조회한다.
	 * @param code
	 * @return
	 */
	Department getDepartmentByCode(String code);
	/**
	 * 모든 부서를 조회한다.
	 * @return 부서 리스트
	 */
	List<Department> getAllDepartments();
}
