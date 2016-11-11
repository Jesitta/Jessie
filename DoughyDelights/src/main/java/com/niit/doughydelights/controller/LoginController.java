package com.niit.doughydelights.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.CallbackException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.SupplierDAO;
import com.niit.doughydelights.dao.UserDAO;
import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.CartItemList;
import com.niit.doughydelights.model.UserCart;

@Controller

public class LoginController {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CakeProduct cakeProduct;
	@Autowired
	private CartDAO cartDAO;

	@RequestMapping("/")
	public ModelAndView main(HttpServletRequest req) {
		System.out.println(req.getContextPath());
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("categoryList", categoryDAO.list());
		List<CakeProduct> productlist = productDAO.list();
		Gson gson = new Gson();
		String item = gson.toJson(productlist);
		mv.addObject("items", item);

		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("AboutUs");
		mv.addObject("categoryList", categoryDAO.list());
		return mv;
	}

	/*
	 * @RequestMapping(value = "/final") public ModelAndView
	 * finalpage(HttpServletRequest req, Principal principal) { ModelAndView mv
	 * = new ModelAndView(); String loggedInUser = principal.getName(); CakeUser
	 * cakeUser = userDAO.getUser(loggedInUser); UserCart userCart =
	 * cakeUser.getCart(); if (req.getRemoteUser() != null) { List<CartItemList>
	 * cartList = cartDAO.list(user); mv.addObject("cartSize", cartList.size());
	 * 
	 * mv.setViewName("Thanks"); } else { mv.addObject("logincart",
	 * "Please Login to buy your yummy cake");
	 * 
	 * mv.setViewName("login"); } return mv; }
	 */

	@RequestMapping("/productlist")

	public ModelAndView goListPrdct(HttpServletRequest req, Principal principal) {
		String catname = req.getParameter("catname");
		ModelAndView mv = new ModelAndView("productlist");
		String loggedInUser = req.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		if(req.getRemoteUser() != null){
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		mv.addObject("cartSize", cartList.size());
	}
		mv.addObject("categoryList", categoryDAO.list());
		CakeCategory cakeCategory = categoryDAO.getByName(catname);
		System.out.println(cakeCategory);
		
List<CakeProduct> prodct = productDAO.getByCategory(cakeCategory.getId());
		System.out.println(cakeCategory.getName());
		Gson gs = new Gson();
		String prd = gs.toJson(prodct);
		mv.addObject("items", prd);
		return mv;
	}

	@RequestMapping("/proddesc")

	public ModelAndView goList(HttpServletRequest req, Principal principal, Model m) {
		String pdid = req.getParameter("pdid");
		cakeProduct = productDAO.get(Integer.parseInt(pdid));
		ModelAndView mv = new ModelAndView("prodfinal");
		String loggedInUser = req.getRemoteUser();

		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		
		if(req.getRemoteUser() != null){
			List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
			mv.addObject("cartSize", cartList.size());
		}
		mv.addObject("categoryList", categoryDAO.list());
		List<CakeProduct> product = productDAO.getByProduct(cakeProduct.getId());
		System.out.println(cakeProduct.getId());
		System.out.println("ProdctList" + product);
		mv.addObject("prodfinal", product);
		return mv;
	}

}
