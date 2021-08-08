package com.erphero.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.erphero.service.EmployeeService;
import com.erphero.vo.Employee;
import com.erphero.web.utils.SessionUtils;


@Controller
@SessionAttributes
public class HomeController {
	
	private static Logger logger = LogManager.getLogger(HomeController.class);
	
	@Autowired EmployeeService employeeService;
	
	@GetMapping(path = {"/", "/main", "/home"})
	public String home(Model model) {
		
		logger.info("홈페이지 요청을 처리함"); //자바의 println
		
		//view 페이지에 값 전달하기
		model.addAttribute("greeting", "안녕하세요!!"); //name, value
		
		return "clienthome";	// 반환하는 값이 내부이동하는 경로이름이다.
		// /WEB-INF/views/home.jsp 경로에서 "/WEB-INF/views/"와 ".jsp"를 제외한 이름
	}
	
	@GetMapping(path = {"/employeehome"})
	public String empHome(Model model) {
		
		logger.info("로그인요청처리 완료");
		logger.info("사원페이지이동");
		
		return "employeehome";
	}
	
	@GetMapping("/login")
	public String loginform() {
		
		logger.info("로그인폼 요청 처리");
		
		return "loginform";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id") String empId, @RequestParam("password") String empPassword) {
		
		logger.info("로그인 요청처리");
		logger.info("id값 :" + empId);
		logger.info("password값 :" + empPassword);
		
		employeeService.login(empId, empPassword);
		
		
		return "redirect:employeehome";
		
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destroySession();
		
		return "redirect:home";
	}
}
