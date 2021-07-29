package com.erphero.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
	private static Logger logger = LogManager.getLogger(HomeController.class);
	

	
	@GetMapping(path = {"/", "/main", "/home"})
	public String home(Model model) {
		
		logger.info("홈페이지 요청을 처리함"); //자바의 println
		
		//view 페이지에 값 전달하기
		model.addAttribute("greeting", "안녕하세요!!"); //name, value
		
		return "home";	// 반환하는 값이 내부이동하는 경로이름이다.
		// /WEB-INF/views/home.jsp 경로에서 "/WEB-INF/views/"와 ".jsp"를 제외한 이름
	}
	
	@GetMapping("/login")
	public String loginform() {
		return "loginform";
	}
}
