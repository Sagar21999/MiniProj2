package com.example.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project.entity.Test;
import com.example.project.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date today;

	@GetMapping(value={"/home","/"})
	public String show() {
		return "home";
	}
	
	/*
	 * @GetMapping("/") public String showHome() { return "home"; }
	 */
	
	@GetMapping("/add")
	public String add(Model model) {
		
		Test test=new Test();
		
		test.setStatus("Testing");
		model.addAttribute("test", test);

		return "add";
	}
	
	@PostMapping("/addTest")
	public String addTest(@Valid @ModelAttribute Test test,BindingResult result,Model model) {
		test.setStatus("Testing");
		Date today=new Date();
		test.setDateOfTest(today);
		System.out.println(test);
		if(result.hasErrors()) {
			return "add";
		}
		int flag=testService.findTestByAdhaarAndDate(test.getAdhaar(), test.getDateOfTest());
		if(flag==-1) {
			return "add-failure";
		}
		
		testService.addTest(test);
		return "add-success";
		
	}
	
	@GetMapping("/complete")
	public String complete(Model model) {
		today=new Date();
		Integer[] result=testService.generateCompleteReport(today);
		model.addAttribute("testCountToday", result[0]);
		model.addAttribute("testCountMonth", result[1]);
		model.addAttribute("testCountOverall", result[2]);
		model.addAttribute("positiveCountToday", result[3]);
		model.addAttribute("positiveCountMonth", result[4]);
		model.addAttribute("positiveCountOverall", result[5]);
		model.addAttribute("negativeCountToday", result[6]);
		model.addAttribute("negativeCountMonth", result[7]);
		model.addAttribute("negativeCountOverall", result[8]);
		model.addAttribute("pendingCountToday", result[9]);
		model.addAttribute("pendingCountMonth", result[10]);
		model.addAttribute("pendingCountOverall", result[11]);

		
		return "complete";
	}
	
	@GetMapping("/view")
	public String view(Model model) {
		List<Test> testList=testService.getAll();
		model.addAttribute("testList", testList);
		return "view";
	}
	
	@GetMapping("/today")
	public String daily(Model model) {
		model.addAttribute("total", "0");
		model.addAttribute("positive", "0");
		model.addAttribute("negative", "0");
		model.addAttribute("pending", "0");
		List<Test> testList=new ArrayList<>();
		model.addAttribute("testList", testList);

		return "today";
	}
	
	@PostMapping("/viewDay")
	public String showDaily(@RequestParam("category")String category,@RequestParam("dateOfSearch") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,Model model) {
		System.out.println(category+date);
		List<Test> testList=testService.getDailyByCategory(category, date);
		Integer count[]=testService.getDailyCount(date);
		model.addAttribute("testList", testList);
		model.addAttribute("total", count[0]);
		model.addAttribute("positive", count[1]);
		model.addAttribute("negative", count[2]);
		model.addAttribute("pending", count[3]);
		
		return "today";
	}
	
	@GetMapping("/update")
	public String update(Model model) {
		String status="Testing";
		List<Test> testList=testService.getByStatus(status);
		model.addAttribute("testList", testList);
		return "update";
	}
	
	@GetMapping("/update/{id}")
	public String updateStatus(@PathVariable("id")Integer id,Model model) {
		System.out.println(id);
		Optional<Test> t= testService.findById(id);
		Test test=null;
		if(t.isPresent()) {
			 test=t.get();
		}
		model.addAttribute("test", test);
		return "update-status";
	}
	
	@PostMapping("/updateStatus/{id}")
	public String setStatus(@PathVariable("id")Integer id,@RequestParam("status")String status,@ModelAttribute("test")Test test,Model model) {
		Optional<Test> t= testService.findById(id);
		Test test2=null;
		if(t.isPresent()) {
			 test2=t.get();
		}
		test2.setStatus(status);
		
		testService.update(test2);
		
		model.addAttribute("status", status);
		return "update-complete";
	}
}


















