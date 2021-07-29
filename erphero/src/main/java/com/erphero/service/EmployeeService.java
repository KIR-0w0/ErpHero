package com.erphero.service;

import com.erphero.vo.Employee;

public interface EmployeeService {
	
	/**
	 * 지정된 사원정보로 사원등록을 수행하는 서비스
	 * @param employee 사원 정보
	 */
	void registerEmplyee(Employee employee);
	
	/**
	 * 지정된 아이디와 비밀번호로 사원인증을 수행하는 서비스
	 * @param id		사원 아이디
	 * @param password	 사원 비밀번호
	 */
	void login(String id, String password);
	
	
}
