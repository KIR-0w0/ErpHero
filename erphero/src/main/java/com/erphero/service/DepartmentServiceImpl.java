package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.DepartmentDao;
import com.erphero.vo.Department;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	DepartmentDao departmentDao;

	@Override
	public void registerDepartment(Department department) {
		departmentDao.insertDepartment(department);
	}

	@Override
	public void modifyDepartment(Department department) {
		departmentDao.updateDepartment(department);
	}

	@Override
	public void deleteDepartmentByCode(String code) {
		departmentDao.deleteDepartmentByCode(code);
	}

	@Override
	public Department getDepartmentByCode(String code) {
		return departmentDao.getDepartmentByCode(code);
	}

	@Override
	public List<Department> getAllDepartments() {
		return departmentDao.getAllDepartments();
	}
	
	
}
