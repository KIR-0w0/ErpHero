package com.erphero.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.erphero.dao.EmployeeDao;
import com.erphero.vo.Employee;
import com.erphero.web.utils.SessionUtils;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired EmployeeDao employeeDao;
	
	@Override
	public void login(String empId, String empPassword) {
		// 사용자정보 조회 - null인지 체크, 삭제된 사용자인지 체크, 비밀번호가 일치하는지 체크
		Employee employee = employeeDao.getEmployeeById(empId);
		
		if (employee == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		} 
		if (!"Y".equals(employee.getStatus())){
			throw new RuntimeException("퇴사 처리된 사원입니다.");
		}
		if (!employee.getPassword().equals(empPassword)) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_EMPLOYEE", employee);
	}
	
	@Override
	public void registerEmplyee(Employee employee) {
		// 사원등록폼 만든후 코딩
	}
}
