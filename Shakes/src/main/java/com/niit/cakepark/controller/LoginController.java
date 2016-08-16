package com.niit.cakepark.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.CategoryDAO;
import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.dao.SupplierDAO;

@Controller
public class LoginController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	private ProductDAO productDAO;
	 
	@RequestMapping("/")
    public String main() {
        
        return "/home";
    }
	@RequestMapping("viewcategory")
    public ModelAndView viewcategory() {
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("CategoryList", "CATEGORY LIST");
       mv.addObject("categoryList",categoryDAO.list());
        return mv;
    }

	@RequestMapping("viewsupplier")
    public ModelAndView viewsupplier() {
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("SupplierList", "SUPPLIER LIST");
       mv.addObject("supplierList",supplierDAO.list());
        return mv;
    }
	@RequestMapping("viewproduct")
    public ModelAndView viewproduct() {
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("ProductList", "PRODUCT LIST");
       mv.addObject("productList",productDAO.list());
        return mv;
    }
	@RequestMapping("/404")
    public ModelAndView error() {
		ModelAndView mv=new ModelAndView("404");
	
        return mv;
	}
    }

 

 
	
	 
   
