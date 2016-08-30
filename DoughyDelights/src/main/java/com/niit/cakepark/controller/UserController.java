package com.niit.cakepark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.CartDAO;
import com.niit.cakeshakes.dao.UserDAO;
import com.niit.cakeshakes.model.CakeCart;
import com.niit.cakeshakes.model.CakeUser;


@Controller
public class UserController {
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	
	@Autowired
	private  UserDAO userDAO;
	@Autowired
	private  CartDAO cartDAO;
	@Autowired
	private  CakeUser cakeUser;
	

@RequestMapping(value ="/signup",method=RequestMethod.GET)
	public String signup(Model model){
		model.addAttribute("cakeUser", new CakeUser()); 
		model.addAttribute("isuserClickedRegisterHere", "true"); 
		return "signup";
	}
	
	@RequestMapping(value ="signup",method=RequestMethod.POST)
	public ModelAndView signuppost(@Valid @ModelAttribute("cakeUser") CakeUser cakeUser,BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
	modelAndView.setViewName("/signup");
		}
else{
	      userDAO.saveOrUpdate(cakeUser);
		modelAndView.addObject("regsuccess", "Registered Successfully...!!");   
		modelAndView.setViewName("/home");
}
		return modelAndView;
	}
	
	@RequestMapping("/home")
    public ModelAndView index(HttpServletRequest req,HttpSession session) {
		//String loggedInUser = null;
		String loggedInUser =req.getRemoteUser();
		ModelAndView mv= new ModelAndView("home");
		 session.setAttribute("loggedInUser",req.getRemoteUser());
		mv.addObject("loggedInUser",loggedInUser);
		
		List <CakeCart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		 return mv;
    }
	
	@RequestMapping(value="/403")
	 public String error() {
	        
	        return "403";
	    }
	
	
	@RequestMapping(value = "/goologin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout ,HttpSession session,HttpServletRequest req) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("errorMessage", "Invalid username and password...!");
		}

		if (logout != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
			session.invalidate();
			//session=req.getSession();
			model.addObject("msg", "You've been logged out successfully.");
			model.setViewName("index");
		}
		
		
		else{
		     model.setViewName("login");
		}
		return model;

	}
	
	

	
	
	
	
	/*@RequestMapping(value ="/goologin",method=RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("cakeUser", cakeUser);
		modelAndView.addObject("isuserClickedLoginHere", "true"); 
		return modelAndView;
	}
*//*	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

	  ModelAndView model = new ModelAndView();
	  if (error != null) {
		model.addObject("error", "Invalid username and password!");
	  }

	  if (logout != null) {
		model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("/login");

	  return model;

	}*/
	
/*@RequestMapping(value ="springlogin",method=RequestMethod.POST)
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
	}*/
	
	/*@RequestMapping(value ="/logout")
	public ModelAndView logout(HttpServletRequest request,HttpSession session){
		ModelAndView modelAndView = new ModelAndView("/home");
		session.invalidate();
		session=request.getSession(true);
		
		modelAndView.addObject("logout", "Loggedout Successfully");
		return modelAndView;
	}*/
}
