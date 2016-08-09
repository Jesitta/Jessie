package com.niit.cakepark.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.CategoryDAO;

@Controller
public class LoginController {
	@Autowired
	private CategoryDAO categoryDAO;
	 
	@RequestMapping("/")
    public String main() {
        
        return "home";
    }
	@RequestMapping("viewcategory")
    public ModelAndView view() {
		ModelAndView mv=new ModelAndView("view");
       mv.addObject("categoryList",categoryDAO.list());
        return mv;
    }

	
    }

 

 
	
	 
   
