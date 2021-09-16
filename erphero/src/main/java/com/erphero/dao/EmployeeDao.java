package com.erphero.dao;

import java.util.List;

import com.erphero.vo.Employee;

public interface EmployeeDao {

	/**
	 * 지정된 사용자아이디로 데이터베이스에서 자용자정보를 조회해서 반환한다.
	 * @param EmpId 사원아이디
	 * @return 사용자정보, null일 수 있음
	 */
	Employee getEmployeeById(String empId);
	
	/**
	 * 사용자 정보를 전달받아 데이터베이스에 저장한다.
	 * @param Employee 신규 사원정보
	 */
	void insertEmployee(Employee employee);
	/**
	 * 모든 사원을 조회한다.
	 * @return 사업장 리스트
	 */
	List<Employee> getAllEmployees();
	/**
	 * 지정된 사용자아이디로 데이터베이스에서 사용자정보를 조회해서 반환한다.
	 * @param code 사원아이디
	 * @return 사용자정보, null일 수 있음
	 */
	Employee getEmployeeByCode(String code);
	/**
	 * 지정된 사용자아이디로 데이터베이스의 시용자정보를 수정한다.
	 * @param employee
	 */
	void updateEmployee(Employee employee);
	/**
	 * 사원의 정보를 삭제한다.
	 * @param code
	 */
	void deleteEmployeeByCode(String code);
	
}
