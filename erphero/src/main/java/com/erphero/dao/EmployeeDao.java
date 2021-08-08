package com.erphero.dao;

import com.erphero.vo.Employee;

public interface EmployeeDao {

	/**
	 * 사용자 정보를 전달받아 데이터베이스에 저장한다.
	 * @param Employee 신규 사원정보
	 */
	void insertEmployee(Employee employee);
	
	/**
	 * 지정된 사용자아이디로 데이터베이스에서 자용자정보를 조회해서 반환한다.
	 * @param EmpId 사원아이디
	 * @return 사용자정보, null일 수 있음
	 */
	Employee getEmployeeById(String empId);
}
