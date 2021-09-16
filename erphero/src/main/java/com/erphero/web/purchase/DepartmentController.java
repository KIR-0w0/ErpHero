package com.erphero.web.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.DepartmentService;
import com.erphero.vo.Department;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	@GetMapping("/register")
	public String departments(Model model) {
		List<Department> departments = departmentService.getAllDepartments();
		
		model.addAttribute("departments", departments);
		
		return "department/form";
	}
	@PostMapping("/register")
	public String addDepartment(Department department) {
		departmentService.registerDepartment(department);
		return "redirect:register"; 
	}

	@GetMapping("/get/{code}")
	public String getWorkPlace(@RequestParam("code") String code) {
		departmentService.getDepartmentByCode(code);
		return null;
	}
	
	@PutMapping("/update/{code}")
	@ResponseBody
	public ResponseEntity<Department> updateDepartment(@PathVariable("code") String code, @RequestBody Department department) {
		Department savedDepartment = departmentService.getDepartmentByCode(code);
		if (savedDepartment == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		savedDepartment.setName(department.getName());
		savedDepartment.setWorkPlaceCode(department.getWorkPlaceCode());
		savedDepartment.setDeletedDate(department.getDeletedDate());
		
		departmentService.modifyDepartment(savedDepartment);		
		
		return new ResponseEntity<>(savedDepartment, HttpStatus.OK); //redirect 어떻게 하지??? 데이터를 제공하고 불가능..얘만 이렇게 ajax로 보내도 상관없는 건가?
	}
	@GetMapping("/delete")
	public String deleteDepartment(@RequestParam("code") String code) {
		departmentService.deleteDepartmentByCode(code);
		return "redirect:register";
	}
	
	@GetMapping("/detail")
	public String details(@RequestParam("code") String code, Model model) {
		Department department = departmentService.getDepartmentByCode(code);
		
		model.addAttribute("dept", department);
		
		return "department/form";
	}
}
