package com.niit.doughydelights.controller;
 
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
	private  CategoryDAO categoryDAO;
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  CakeProduct cakeProduct;
	@Autowired
	private  CartDAO cartDAO;
	
	@RequestMapping("/")
    public String main(HttpServletRequest req) {
        System.out.println(req.getContextPath());
        return "index";
    }
	
	
	
	/*@RequestMapping(value="/gomainpage")
    public String homepage() {
        
		return "home";
    }*/
	@RequestMapping(value="/about")
    public String about() {
        
        return "AboutUs";
    }
	@RequestMapping(value="/final")
    public ModelAndView finalpage(HttpServletRequest req) {
		ModelAndView mv= new ModelAndView();
		String loggedInUser =req.getRemoteUser();
		if(req.getRemoteUser()!=null){
			List <CakeCart> cartList=cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
        
			 mv.setViewName("Thanks");
		}
		else{
			mv.addObject("logincart", "Please Login to buy your yummy cake");
			
			mv.setViewName("login");
		}
       return mv;
	}
   
	
	
    @RequestMapping("/productlist")
    
    public ModelAndView goListPrdct(HttpServletRequest req) {
		String catname=req.getParameter("catname"); 
		CakeCategory cakeCategory = categoryDAO.getByName(catname);
		
		ModelAndView mv=new ModelAndView("productlist");
		String loggedInUser =req.getRemoteUser();
		List <CakeCart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		mv.addObject("ViewProduct","CHOOSE YOUR CAKE..!");
		List <CakeProduct> prodct = productDAO.getByCategory(cakeCategory.getId());
		System.out.println(cakeCategory.getId());
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
		String loggedInUser =req.getRemoteUser();
		List <CakeCart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		//Gson gs=new Gson();
		List <CakeProduct> product=productDAO.getByProduct(cakeProduct.getId());
		System.out.println(cakeProduct.getId());
		System.out.println("ProdctList"+ product);
		//String prd=gs.toJson(pro);
		mv.addObject("prodfinal", product);
		
         return mv;
	}	

 

}	
	 
   
