package com.onlineclass.sysadmin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlineclass.sysadmin.service.AdminUserService;

@Controller
public class HomeController {

	@Autowired
	private AdminUserService customerService;
	
	@RequestMapping("/")
	public ModelAndView home() {
//		List<AdminUser> listCustomer = customerService.listAllUsers();
		ModelAndView mav = new ModelAndView("HomeView");
//		mav.addObject("listCustomer", listCustomer);
		mav.addObject("currPage","Home Page");
		return mav;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "Login";
	}
	
}
