package com.niit.doughydelights.controller;

import java.security.Principal;
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

import com.google.gson.Gson;
import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.UserDAO;
import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.CartItemList;

@Controller
public class UserController {
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		model.addAttribute("cakeUser", new CakeUser());
		model.addAttribute("isuserClickedRegisterHere", "true");
		model.addAttribute("categoryList",categoryDAO.list());
		return "signup";
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public ModelAndView signuppost(@Valid @ModelAttribute("cakeUser") CakeUser cakeUser, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		if (result.hasErrors()) {
			modelAndView.addObject("categoryList",categoryDAO.list());
			modelAndView.setViewName("/signup");
			
		} else {
			userDAO.saveOrUpdate(cakeUser);
			modelAndView.addObject("regsuccess", "Registered Successfully...!!");
			modelAndView.addObject("categoryList",categoryDAO.list());
			modelAndView.setViewName("/home");
		}
		return modelAndView;
	}

	@RequestMapping("/home")
	public ModelAndView index(HttpServletRequest req, HttpSession session, Principal principal) {

		String loggedInUser = principal.getName();

		ModelAndView mv = new ModelAndView("home");
		System.out.println(principal.getName());
		session.setAttribute("loggedInUser", principal.getName());
		System.out.println(loggedInUser);
		mv.addObject("loggedInUser", loggedInUser);
		mv.addObject("categoryList", categoryDAO.list());
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		mv.addObject("cartSize", cartList.size());
		mv.addObject("categoryList",categoryDAO.list());
		List<CakeProduct> productlist =  productDAO.list();
		Gson gson=new Gson();
		String item=gson.toJson(productlist);
		mv.addObject("items",item);
		return mv;
	}

	@RequestMapping(value = "/403")
	public String error() {

		return "403";
	}

	@RequestMapping(value = "/goologin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpSession session,
			HttpServletRequest req) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("errorMessage", "Invalid username and password...!");
		
		}

		if (logout != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
			session.invalidate();
			// session=req.getSession();
			model.addObject("msg", "You've been logged out successfully.");
			model.addObject("categoryList", categoryDAO.list());
			List<CakeProduct> productlist =  productDAO.list();
			Gson gson=new Gson();
			String item=gson.toJson(productlist);
			model.addObject("items",item);
			model.setViewName("index");
			
		}

		else {
			model.addObject("categoryList",categoryDAO.list());
			model.setViewName("login");
		}
		return model;

	}
	@RequestMapping("/reset")
public ModelAndView  reset(HttpServletRequest req){
		ModelAndView mv=new ModelAndView("password");
		mv.addObject("cakeUser",new CakeUser());
		String loggedInUser=req.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		mv.addObject("cartSize", cartList.size());
		mv.addObject("categoryList", categoryDAO.list());
	return mv;
		
	}
	@RequestMapping(value = "resetpwd", method = RequestMethod.POST)
	public ModelAndView signuppost(@ModelAttribute("cakeUser") CakeUser cakeUser,HttpServletRequest req){
		ModelAndView mv=new ModelAndView("home");
		String loggedInUser=req.getRemoteUser();
 CakeUser cakeUser1=userDAO.getUser(loggedInUser);
 cakeUser1.setPassword(cakeUser.getPassword());
		userDAO.saveOrUpdate(cakeUser1);
		
		List<CartItemList> cartList = cartDAO.list(cakeUser1.getUserCart().getCartId());
		mv.addObject("cartSize", cartList.size());
		mv.addObject("categoryList", categoryDAO.list());
		List<CakeProduct> productlist =  productDAO.list();
		Gson gson=new Gson();
		String item=gson.toJson(productlist);
		mv.addObject("items",item);
	return mv;
	
	}
}
