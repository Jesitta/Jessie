package com.niit.cakepark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.UserDAO;

import com.niit.cakeshakes.model.CakeUser;


@Controller
public class UserController {
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	
	@Autowired
	private  UserDAO userDAO;
	@Autowired
	private  CakeUser cakeUser;
	
	@RequestMapping(value ="/signup",method=RequestMethod.GET)
	public String signup(Model model){
		model.addAttribute("cakeUser", cakeUser); 
		model.addAttribute("isuserClickedRegisterHere", "true"); 
		return "signup";
	}
	
	@RequestMapping(value ="signup",method=RequestMethod.POST)
	public ModelAndView signuppost(@ModelAttribute("cakeUser") CakeUser cakeUser) {
	userDAO.saveOrUpdate(cakeUser);
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("regsuccess", "Registered Successfully...!!");   
		return modelAndView;
	}
	@RequestMapping(value ="/gologin",method=RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("cakeUser", cakeUser);
		modelAndView.addObject("isuserClickedLoginHere", "true"); 
		return modelAndView;
	}
@RequestMapping(value ="login",method=RequestMethod.POST)
	public ModelAndView loginpost(@RequestParam("username")String username,@RequestParam("password")String password, HttpSession session) {
	
		ModelAndView modelAndView = new ModelAndView("home");
	
		boolean isValidUser=userDAO.isValidUser(username,password);
		if(isValidUser==true)
		{
			cakeUser=userDAO.get(username);
			session.setAttribute("loggedInUser",cakeUser.getName());
			if(cakeUser.getRole().equals("ROLE_ADMIN"))
			{	
				modelAndView.addObject("isAdmin","true");
				
				
			}else{
				modelAndView.addObject("isAdmin","false");
				modelAndView.addObject("loginsuccess", "LoggedIn Successfully");
				
				}	
		}
		else{
			modelAndView.addObject("invalidCredentials","true");
			modelAndView.addObject("errorMessage","Invalid Credentials. Not Yet Registered..!");
			modelAndView.setViewName("login");
			}

		return modelAndView;
	}
	
	
	@RequestMapping(value ="/logout")
	public ModelAndView logout(HttpServletRequest request,HttpSession session){
		ModelAndView modelAndView = new ModelAndView("/home");
		session.invalidate();
		session=request.getSession(true);
		
		modelAndView.addObject("logout", "Loggedout Successfully");
		return modelAndView;
	}
}
