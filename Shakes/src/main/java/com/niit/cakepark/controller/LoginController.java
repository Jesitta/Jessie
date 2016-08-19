package com.niit.cakepark.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.dao.SupplierDAO;

@Controller
public class LoginController {
	
	
	@RequestMapping("/")
    public String main() {
        
        return "/home";
    }
	

	
	
	@RequestMapping("/404")
    public ModelAndView error() {
		ModelAndView mv=new ModelAndView("404");
	
        return mv;
	}
    }

 

 
	
	 
   
