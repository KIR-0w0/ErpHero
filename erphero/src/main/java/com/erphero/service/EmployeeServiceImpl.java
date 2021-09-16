package com.erphero.service;


import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
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
		Employee savedEmployee = employeeDao.getEmployeeById(empId);
		String secretPassword = DigestUtils.sha256Hex(empPassword);
		if (savedEmployee == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		} 
		if (!"Y".equals(savedEmployee.getStatus())){
			throw new RuntimeException("퇴사 처리된 사원입니다.");
		}
		if (!secretPassword.equals(savedEmployee.getPassword())) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_EMPLOYEE", savedEmployee);
		
	}

	@Override
	public void registerEmployee(Employee employee) {
		Employee savedEmployee  = employeeDao.getEmployeeById(employee.getId());
		if (savedEmployee != null) {
			throw new RuntimeException("["+employee.getId()+"]는 이미 사용중인 아이디입니다.");
		}
		String secretPassword = DigestUtils.sha256Hex(employee.getPassword());
		employee.setPassword(secretPassword);
		
		employeeDao.insertEmployee(employee);
	}

	@Override
	public void modifyEmployee(Employee employee) {
		employeeDao.updateEmployee(employee);
	}

	@Override
	public void deleteEmployeeByCode(String code) {
		employeeDao.deleteEmployeeByCode(code);
	}

	@Override
	public Employee getEmployeeByCode(String code) {
		return employeeDao.getEmployeeByCode(code);
	}

	@Override
	public List<Employee> getAllEmployees() {
		return employeeDao.getAllEmployees();
	}
	
	
}
