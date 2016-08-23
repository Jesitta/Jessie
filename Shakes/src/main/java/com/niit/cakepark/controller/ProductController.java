package com.niit.cakepark.controller;

import java.util.List;

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

import com.google.gson.Gson;
import com.niit.cakeshakes.dao.CategoryDAO;
import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.model.FileUtil;
import com.niit.cakeshakes.model.CakeCategory;
import com.niit.cakeshakes.model.CakeProduct;
import com.niit.cakeshakes.model.CakeSupplier;



@Controller
public class ProductController {
	String path = "G:/WorkSpace/Shakes/src/main/webapp/resources/images/";
	@Autowired
	private  CategoryDAO categoryDAO;
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  CakeProduct cakeProduct;
	@Autowired
	private  CakeCategory cakeCategory;
	
	
	
	
	@RequestMapping(value="/productt",method=RequestMethod.GET)
	public String product(Model model){
		
		model.addAttribute("cakeProduct", new CakeProduct());  
		
		model.addAttribute("addproduct", "Add Product");
		
		
		model.addAttribute("categoryList",this.categoryDAO.list());
		return "product";
	}
	
	
	@RequestMapping(value ="/viewproductt",method=RequestMethod.POST)
	public ModelAndView addproduct(@Valid @ModelAttribute("cakeProduct")CakeProduct cakeProduct, BindingResult result ){
		ModelAndView modelAndView = new ModelAndView();
if(result.hasErrors()) {
	modelAndView.addObject("addproduct", "Add Product");
	modelAndView.addObject("categoryList",this.categoryDAO.list());
			modelAndView.setViewName("/product");
		}
else{

CakeCategory cakeCategory = categoryDAO.getByName(cakeProduct.getCat().getName());
//System.out.println(cakeCategory.getId());

	cakeProduct.setCat(cakeCategory);
	productDAO.saveOrUpdate(cakeProduct);
		
		modelAndView.addObject("ProductList", "PRODUCT LIST");
	
	
		MultipartFile file=cakeProduct.getImage();
		FileUtil.upload(path, file, cakeProduct.getId()+".jpg");
		modelAndView.setViewName("redirect:/viewpro");
}
return modelAndView;
	}
	@RequestMapping("viewpro")
    public ModelAndView viewproduct() {
		ModelAndView mv=new ModelAndView("/viewproduct");
		mv.addObject("ProductList", "PRODUCT LIST");
		Gson gson=new Gson(); 
		List<CakeProduct> product= productDAO.list();
		String value=gson.toJson(product);
		mv.addObject("value",value);
        return mv;
    }
	@RequestMapping(value ="/ep{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
		cakeProduct = productDAO.get(id); 
		model.addAttribute("cakeProduct", cakeProduct);
		model.addAttribute("categoryList",this.categoryDAO.list());
		model.addAttribute("editproduct", "Edit Product");  
		
		return "/product";
		
	}
	@RequestMapping("/p{id}")
	public String deletecategory(@PathVariable("id") int id,ModelMap model) {
		productDAO.delete(id);
		
		return "redirect:/viewpro";
	}
	
}
