package com.niit.doughydelights.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.CallbackException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.SupplierDAO;
import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeProduct;

@Controller
public class LoginController {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CakeProduct cakeProduct;
	@Autowired
	private CartDAO cartDAO;

	@RequestMapping("/")
	public ModelAndView main(HttpServletRequest req) {
		System.out.println(req.getContextPath());
		ModelAndView mv = new ModelAndView("index");

		mv.addObject("categoryList", categoryDAO.list());
		return mv;
	}

	@RequestMapping(value = "/about")
	public String about() {

		return "AboutUs";
	}

	@RequestMapping(value = "/final")
	public ModelAndView finalpage(HttpServletRequest req, Principal principal) {
		ModelAndView mv = new ModelAndView();
		String loggedInUser = principal.getName();
		if (req.getRemoteUser() != null) {
			List<CakeCart> cartList = cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());

			mv.setViewName("Thanks");
		} else {
			mv.addObject("logincart", "Please Login to buy your yummy cake");

			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping("/productlist")

	public ModelAndView goListPrdct(HttpServletRequest req, Principal principal) {
		String catname = req.getParameter("catname");
		CakeCategory cakeCategory = categoryDAO.getByName(catname);
		System.out.println(cakeCategory);
		String loggedInUser = req.getRemoteUser();
		List<CakeCart> cartList = cartDAO.list(loggedInUser);

		ModelAndView mv = new ModelAndView("productlist");
		mv.addObject("cartSize", cartList.size());
		mv.addObject("ViewProduct", "CHOOSE YOUR CAKE..!");
		List<CakeProduct> prodct = productDAO.getByCategory(cakeCategory.getId());
		System.out.println(cakeCategory.getName());
		Gson gs = new Gson();
		String prd = gs.toJson(prodct);
		mv.addObject("prodlist", prd);
		return mv;
	}

	@RequestMapping("/proddesc")

	public ModelAndView goList(HttpServletRequest req, Principal principal) {
		String pdid = req.getParameter("pdid");
		cakeProduct = productDAO.get(Integer.parseInt(pdid));
		String loggedInUser = req.getRemoteUser();
		List<CakeCart> cartList = cartDAO.list(loggedInUser);
		ModelAndView mv = new ModelAndView("prodfinal");
		mv.addObject("cartSize", cartList.size());
		List<CakeProduct> product = productDAO.getByProduct(cakeProduct.getId());
		System.out.println(cakeProduct.getId());
		System.out.println("ProdctList" + product);
		mv.addObject("prodfinal", product);
		return mv;
	}

}
