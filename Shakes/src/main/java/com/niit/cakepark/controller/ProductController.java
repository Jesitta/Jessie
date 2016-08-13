/*package com.niit.cakepark.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.model.FileUpload;
import com.niit.cakeshakes.model.ProductTable;



public class ProductController {
	String path = "F:\\Jessie\'Files";
AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  ProductTable productTable;
	
	@RequestMapping(value ="/product",method=RequestMethod.GET)
	public ModelAndView product(){
		ModelAndView modelAndView = new ModelAndView("product");
		modelAndView.addObject("ProductTable", productTable);  
		
		
		return modelAndView;
	}
	@RequestMapping(value ="/file",method=RequestMethod.POST)
	public ModelAndView addproduct(@ModelAttribute("productTable") ProductTable productTable){
		productDAO.saveOrUpdate(productTable);
		ModelAndView modelAndView = new ModelAndView("viewproduct");
		modelAndView.addObject("productlList",productDAO.list());  
		return modelAndView;
	}

	@RequestMapping(value ="/view",method=RequestMethod.POST)
	public ModelAndView addproducts(@Valid @ModelAttribute("productTable") ProductTable productTable, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
			
			modelAndView.addObject("product", "product") ;
		}
		else {
		productDAO.saveOrUpdate(productTable);	
		MultipartFile file=productTable.getImage();
		FileUpload.upload(path, file, productTable.getId()+".jpg");
		modelAndView.addObject("file",file);
		modelAndView.addObject("manageproducts", "manageproducts");
		modelAndView.addObject("productTable", productTable);
		modelAndView.addObject("productList",this.productDAO.list());
		}
		
		return modelAndView;	
	}
	
}
*/