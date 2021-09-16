package com.erphero.web.purchase;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erphero.service.WorkPlaceService;
import com.erphero.vo.WorkPlace;

@Controller
@RequestMapping("/workPlace")
public class WorkPlaceController {
	
	@Autowired
	WorkPlaceService workPlaceService;
	
	@GetMapping("/register")
	public String workPlaces(Model model) {
		List<WorkPlace> workPlaces = workPlaceService.getAllWorkPlaces();
		
		model.addAttribute("workPlaces", workPlaces);
		
		return "workPlace/form";
	}
	@PostMapping("/register")
	public String addWorkPlace(WorkPlace workPlace) {
		workPlaceService.registerWorkPlace(workPlace);
		return "redirect:register"; 
	}

	@GetMapping("/get/{code}")
	public String getWorkPlace(@RequestParam("code") String code) {
		workPlaceService.getWorkPlaceByCode(code);
		return null;
	}
	
	@PutMapping("/update/{code}")
	@ResponseBody
	public ResponseEntity<WorkPlace> updateWorkPlace(@PathVariable("code") String code, @RequestBody WorkPlace workPlace) {
		WorkPlace savedWorkPlace = workPlaceService.getWorkPlaceByCode(code);
		if (savedWorkPlace == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		savedWorkPlace.setName(workPlace.getName());
		savedWorkPlace.setType(workPlace.getType());
		savedWorkPlace.setRegNum(workPlace.getRegNum());
		savedWorkPlace.setRepName(workPlace.getRepName());
		savedWorkPlace.setBusinessType(workPlace.getBusinessType());
		savedWorkPlace.setBusinessType(workPlace.getBusinessType());
		savedWorkPlace.setBusinessCategory(workPlace.getBusinessCategory());
		savedWorkPlace.setAddress(workPlace.getAddress());
		savedWorkPlace.setPhone(workPlace.getPhone());
		savedWorkPlace.setCreatedDate(new Date());
		savedWorkPlace.setDeletedDate(new Date());
		
		workPlaceService.modifyWorkPlace(savedWorkPlace);		
		
		return new ResponseEntity<>(savedWorkPlace, HttpStatus.OK); //redirect 어떻게 하지??? 데이터를 제공하고 불가능..얘만 이렇게 ajax로 보내도 상관없는 건가?
	}
	@GetMapping("/delete")
	public String deleteWorkPlace(@RequestParam("code") String code) {
		workPlaceService.deleteWorkPlaceByCode(code);
		return "redirect:register";
	}
	
	@GetMapping("/detail")
	public String details(@RequestParam("code") String code, Model model) {
		// 상품번호에 해당하는 상품정보 조회
		WorkPlace workPlace = workPlaceService.getWorkPlaceByCode(code);
		
		// 뷰 페이지에 전달하기 위해서 Model객체에 저장하기
		model.addAttribute("workPlace", workPlace);
		
		return "workPlace/form";
	}
}
