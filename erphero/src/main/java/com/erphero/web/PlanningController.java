package com.erphero.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erphero.dto.Contract;
import com.erphero.service.PlanningService;
import com.erphero.vo.Planning;


@Controller
@RequestMapping("/planning")
public class PlanningController {
	@Autowired PlanningService planningService;
	
	
	@GetMapping("/list")
	public String plannings(Model model) {
		
		List<Planning> plannings = planningService.getAllPlannings();
		model.addAttribute("plannings", plannings);
		
		return "planning/list";
	}
	
	@RequestMapping("/list/json")
	@ResponseBody
	public ResponseEntity<List<Contract>> list(){
		List<Contract> contracts = planningService.getAllContracts();
		return new ResponseEntity<>(contracts, HttpStatus.OK);
	}
	
	@RequestMapping("/list2/json/{code}")
	@ResponseBody
	public ResponseEntity<List<Planning>> list2(@PathVariable("code") String contractCode){
		List<Planning> plannings = planningService.getAllPlannings();
		return new ResponseEntity<>(plannings, HttpStatus.OK);
	}
	
	@PostMapping("/addPlanning")
	public String addReview(String code, String contractCode, Date targetDate, String productCode, long amount, RedirectAttributes redirectAttributes) { //@LoginedEMP Employee employee
		Planning planning = new Planning(code, contractCode, targetDate, productCode, amount);
		planningService.addReview(planning);

		redirectAttributes.addAttribute("code", code);
		
		return "redirect:list";
	}
	
	
}
