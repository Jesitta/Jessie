package com.niit.cakepark.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.model.FileUtil;
import com.niit.cakeshakes.model.ProductTable;



@Controller
public class ProductController {
	String path = "G:/Jessie/Files/";
	
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  ProductTable productTable;
	
	@RequestMapping(value="/productt",method=RequestMethod.GET)
	public ModelAndView product(){
		ModelAndView modelAndView = new ModelAndView("product");
		modelAndView.addObject("productTable", productTable);  
		modelAndView.addObject("addproduct", "Add Product");
		
		return modelAndView;
	}
	
	@RequestMapping(value ="/viewproductt",method=RequestMethod.POST)
	public ModelAndView addproduct(@Valid @ModelAttribute("productTable")ProductTable productTable, BindingResult result ){
		ModelAndView modelAndView = new ModelAndView();
if(result.hasErrors()) {
	modelAndView.addObject("addproduct", "Add Product");
			modelAndView.setViewName("/product");
		}
else{
		productDAO.saveOrUpdate(productTable);
		
		modelAndView.addObject("ProductList", "PRODUCT LIST");
		
	modelAndView.addObject("productList",productDAO.list()); 

		MultipartFile file=productTable.getImage();
		FileUtil.upload(path, file, productTable.getId()+".jpg");
		modelAndView.setViewName("/view");
}
return modelAndView;
	}
	@RequestMapping(value ="/ep{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
		productTable = productDAO.get(id); 
		model.addAttribute("productTable", productTable);
	
		model.addAttribute("editproduct", "Edit Product");  
		System.out.println(productTable.getId());
		return "/product";
		
	}
	@RequestMapping("/p{id}")
	public String deletecategory(@PathVariable("id") int id,ModelMap model) {
		productDAO.delete(id);
		model.addAttribute("productList",productDAO.list());
		model.addAttribute("ProductList", "PRODUCT LIST");
		return "/view";
	}
	
}
