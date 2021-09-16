package com.erphero.service;

import java.util.List;

import com.erphero.vo.Employee;

public interface EmployeeService {
	
	/**
	 * 지정된 아이디와 비밀번호로 사원인증을 수행하는 서비스
	 * @param empId		사원 아이디
	 * @param empPassword	 사원 비밀번호
	 */
	void login(String empId, String empPassword);
	
	/**
	 * 지정된 사원정보로 사원등록을 수행하는 서비스
	 * @param employee 사원 정보
	 */
	void registerEmployee(Employee employee);
	
	
	void modifyEmployee(Employee employee);
	
	void deleteEmployeeByCode(String code);
	
	Employee getEmployeeByCode(String code);
	
	List<Employee> getAllEmployees();
	
}
