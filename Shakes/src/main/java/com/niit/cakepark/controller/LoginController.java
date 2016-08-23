package com.niit.cakepark.controller;
 
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
import com.niit.cakeshakes.dao.CategoryDAO;
import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.dao.SupplierDAO;
import com.niit.cakeshakes.model.CakeCategory;
import com.niit.cakeshakes.model.CakeProduct;

@Controller
public class LoginController {
	
	@Autowired
	private  CategoryDAO categoryDAO;
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  CakeProduct cakeProduct;
	
	@RequestMapping("/")
    public String main() {
        
        return "/home";
    }
	
	@RequestMapping(value="/gomain")
    public String home() {
        
        return "/home";
    }
	@RequestMapping(value="/about")
    public String about() {
        
        return "/AboutUs";
    }
	
	
    @RequestMapping("/productlist")
    
    public ModelAndView goListPrdct(HttpServletRequest req) {
		String catname=req.getParameter("catname"); 
		CakeCategory cakeCategory = categoryDAO.getByName(catname);
		
		ModelAndView mv=new ModelAndView("productlist");
	
		mv.addObject("ViewProduct","VIEW PRODUCT");
		List <CakeProduct> prodct = productDAO.getByCategory(cakeCategory.getId());
		Gson gs=new Gson();
		String prd=gs.toJson(prodct);
		mv.addObject("prodlist", prd);
         return mv;
	}	
	
   @RequestMapping("/proddesc")
    
    public ModelAndView goList(HttpServletRequest req) {
   String pdid=req.getParameter("pdid"); 
    	cakeProduct=productDAO.get(Integer.parseInt(pdid));
		ModelAndView mv=new ModelAndView("prodfinal");
		//Gson gs=new Gson();
		List <CakeProduct> pro=productDAO.getByProduct(cakeProduct.getId());
		System.out.println("ProdctList"+ pro);
		//String prd=gs.toJson(pro);
		mv.addObject("prodfinal", pro);
		
         return mv;
	}	

 

}	
	 
   
