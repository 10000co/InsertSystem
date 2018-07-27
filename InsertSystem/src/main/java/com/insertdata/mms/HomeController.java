package com.insertdata.mms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insertdata.mms.dao.FoodinfoRepository;
import com.insertdata.mms.dto.Foodinfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	FoodinfoRepository repository;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "/addData", method = RequestMethod.POST)
	public @ResponseBody List<Foodinfo> addData(@RequestBody List<Foodinfo> foodinfo) {
		
		for(Foodinfo rs : foodinfo) {
			System.out.println(rs);
			repository.insert(rs);
		}
		
		return foodinfo;
	}
}
