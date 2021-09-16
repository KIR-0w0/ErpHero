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

import com.erphero.service.EmployeeService;
import com.erphero.vo.Employee;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	
	@PostMapping("/register")
	public String addEmployee(Employee employee) {
		employeeService.registerEmployee(employee);
		return "redirect:register"; 
	}

	@GetMapping("/get/{code}")
	public String getWorkPlace(@RequestParam("code") String code) {
		employeeService.getEmployeeByCode(code);
		return null;
	}
	
	@PutMapping("/update/{code}")
	public ResponseEntity<Employee> updateEmployee(@PathVariable("code") String code, @RequestBody Employee employee) {
		Employee savedEmployee = employeeService.getEmployeeByCode(code);
		if (savedEmployee == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		savedEmployee.setId(employee.getId());
		savedEmployee.setName(employee.getName());
		savedEmployee.setDeptCode(employee.getDeptCode());
		savedEmployee.setResignationDate(employee.getResignationDate());
		savedEmployee.setStatus(employee.getStatus());
		savedEmployee.setEmail(employee.getEmail());
		savedEmployee.setPhone(employee.getPhone());
		savedEmployee.setPassword(employee.getPassword());
		savedEmployee.setJobId(employee.getJobId());
		savedEmployee.setWorkplaceCode(employee.getWorkplaceCode());
		
		employeeService.modifyEmployee(savedEmployee);	
		return new ResponseEntity<>(savedEmployee, HttpStatus.OK); //redirect 어떻게 하지??? 얘만 이렇게 ajax로 보내도 상관없는 건가?
	}
	@GetMapping("/delete")
	public String deleteEmployee(@RequestParam("code") String code) {
		employeeService.deleteEmployeeByCode(code);
		return "redirect:register";
	}
	@GetMapping("/register")
	public String employees(Model model) {
		List<Employee> employees = employeeService.getAllEmployees();
		
		model.addAttribute("employees", employees);
		
		return "employee/form";
	}
	@GetMapping("/detail")
	public String details(@RequestParam("code") String code, Model model) {
		// 상품번호에 해당하는 상품정보 조회
		Employee employee = employeeService.getEmployeeByCode(code);
		// 뷰 페이지에 전달하기 위해서 Model객체에 저장하기
		model.addAttribute("employee", employee);
		
		return "employee/form";
	}
}
