package com.niit.cakepark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.UserDAO;

import com.niit.cakeshakes.model.UserTable;


@Controller
public class UserController {
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	
	@Autowired
	private  UserDAO userDAO;
	@Autowired
	private  UserTable userTable;
	
	@RequestMapping(value ="/signup",method=RequestMethod.GET)
	public ModelAndView signup(){
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("userTable", userTable); 
		modelAndView.addObject("isuserClickedRegisterHere", "true"); 
		return modelAndView;
	}
	
	@RequestMapping(value ="signup",method=RequestMethod.POST)
	public ModelAndView signuppost(@ModelAttribute("userTable") UserTable userTable) {
	userDAO.saveOrUpdate(userTable);
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("regsuccess", "Registered Successfully...!!!");   
		return modelAndView;
	}
	@RequestMapping(value ="/login",method=RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("userTable", userTable);
		modelAndView.addObject("isuserClickedLoginHere", "true"); 
		return modelAndView;
	}
	@RequestMapping(value ="login",method=RequestMethod.POST)
	public ModelAndView loginpost(@RequestParam("userid")String userid,@RequestParam("password")String password, HttpSession session) {
	
		ModelAndView modelAndView = new ModelAndView("home");
		
		boolean isValidUser=userDAO.isValidUser(userid,password);
		if(isValidUser==true)
		{
			userTable=userDAO.get(userid);
			session.setAttribute("loggedInUser",userTable.getName());
			if(userTable.getRole().equals("admin"))
			{	
				modelAndView.addObject("isAdmin","true");
				
				
			}else{
				modelAndView.addObject("isAdmin","false");
				modelAndView.addObject("loginsuccess", "LoggedIn Successfully");
				
				}	
		}
		else{
			modelAndView.addObject("invalidCredentials","true");
			modelAndView.addObject("errorMessage","Invalid Credentials..! Not Yet Registered");
			
			}

		return modelAndView;
	}
	
	
	@RequestMapping(value ="/logout")
	public ModelAndView logout(HttpServletRequest request,HttpSession session){
		ModelAndView modelAndView = new ModelAndView("/home");
		session.invalidate();
		session=request.getSession(true);
		modelAndView.addObject("loggedOut", "true");
		modelAndView.addObject("logout", "Loggedout Successfully");
		return modelAndView;
	}
}
