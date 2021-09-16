package com.erphero.service;

import java.util.List;

import com.erphero.vo.Department;

public interface DepartmentService {

	void registerDepartment (Department department);
	
	void modifyDepartment (Department department);
	
	void deleteDepartmentByCode(String code);
	
	Department getDepartmentByCode(String code);
	
	List<Department> getAllDepartments();
}
