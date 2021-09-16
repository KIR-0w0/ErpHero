package com.erphero.web.purchase;



import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.VenderService;
import com.erphero.vo.Vender;
import com.erphero.web.model.response.MultipleResponseData;
import com.erphero.web.model.service.ResponseDataService;


@Controller
@RequestMapping("/vender")
public class VenderController {
	private static Logger logger = LogManager.getLogger(VenderController.class);
	
	@Autowired
	VenderService venderService;
	@Autowired
	ResponseDataService responseDataService;
	
	@GetMapping("/register")
	public String registerForm(Model model) {
		logger.debug("registerForm() 실행됨");
		logger.info("거래처 등록 요청을 처리함");
		
		List<Vender> venders = venderService.getAllVender();
		model.addAttribute("venders", venders);
		
		logger.debug("registerForm() 실행됨");
		return "/vender/form";
	}
	@PostMapping("/register")
	public String register(Vender newVender) {
		logger.debug("register() 실행됨");
		logger.info("거래처등록 정보: "+ newVender);
		
		Vender vender = new Vender();
		BeanUtils.copyProperties(newVender, vender);
		
		venderService.registerVender(vender);
		
		
		logger.info("거래처등록 요청을 처리함");
		logger.debug("register() 종료됨");
		return "/vender/form";
	
	}
	@GetMapping("/search")
	public String venders() {
		return "vender/list";
	}

	@RequestMapping("/remove")
	public @ResponseBody ResponseEntity<Void> remove(@RequestParam("code") String code) {
		venderService.removeVender(code);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public MultipleResponseData<Vender> detail(@RequestParam(name="name", required = true) String name) {
		 List<Vender> venders = venderService.searchVender(name);
		 return responseDataService.getMultipleResponseData(venders);
	}
	@RequestMapping("/list")
	@ResponseBody
	public MultipleResponseData<Vender> list(@RequestParam(name="name", required = true) String name) { 
		 List<Vender> venders = venderService.searchVender(name);
		 return responseDataService.getMultipleResponseData(venders);
	}
}
