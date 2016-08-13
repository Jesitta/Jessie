package com.niit.cakepark.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.niit.cakeshakes.dao.CategoryDAO;
import com.niit.cakeshakes.model.CategoryTable;




@Controller

public class CategoryController {
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	
	@Autowired
	private  CategoryDAO categoryDAO;
	@Autowired
	private  CategoryTable categoryTable;
	
	@RequestMapping(value ="/category",method=RequestMethod.GET)
	public ModelAndView category(){
		ModelAndView modelAndView = new ModelAndView("/category");
		modelAndView.addObject("categoryTable", categoryTable);  
		modelAndView.addObject("addcategory", "Add Category");
		
		return modelAndView;
	}
	


	@RequestMapping(value ="/vieww",method=RequestMethod.POST)
	public ModelAndView  addcategory(@ModelAttribute("categoryTable") CategoryTable categoryTable) {
	
		System.out.println(categoryTable.getId());
		categoryDAO.saveOrUpdate(categoryTable);
	
	System.out.println(categoryTable.getId());
	System.out.println(categoryTable.getName());
	System.out.println(categoryTable.getDescription());
		ModelAndView modelAndView = new ModelAndView("/view");
	 
		modelAndView.addObject("categoryList",categoryDAO.list());
		
		return modelAndView;
	}
	
	
	@RequestMapping("/{id}")
	public String deletecategory(@PathVariable("id") int id,ModelMap model) {
		categoryDAO.delete(id);
		model.addAttribute("categoryList",categoryDAO.list());
		
		return "/view";
	}
	
	/*@RequestMapping(value ="category/edit/{id}")
	public String editcategory(@PathVariable("id") String id, Model model) {
		categoryTable = categoryDAO.get(id);
		model.addAttribute("categoryTable", categoryTable);
		model.addAttribute("categoryList",this.categoryDAO.list());
		return "category";

*/	
	@RequestMapping(value ="/e{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
		categoryTable = categoryDAO.get(id); 
		model.addAttribute("categoryTable", categoryTable);
	
		model.addAttribute("editcategory", "Edit category");  
		System.out.println(categoryTable.getId());
		return "/category";
		
	}
	/*@RequestMapping(value ="/vieww")
	public String categoryedit(@PathVariable("id") int id,Model model  ) {
		categoryTable = categoryDAO.get(id); 
		model.addAttribute("categoryTable", categoryTable);
	
		model.addAttribute("categoryList",this.categoryDAO.list());
		
		return "view";
	}*/

	
	/*@RequestMapping("/error")
	public ModelAndView  categoryedit(@ModelAttribute("categoryTable") CategoryTable categoryTable) {
	System.out.println("No Error");
	System.out.println(categoryTable.getId());
	System.out.println(categoryTable.getName());
    categoryDAO.update(categoryTable);
     System.out.println("Error");
	
		ModelAndView modelAndView = new ModelAndView("view");
	 
		modelAndView.addObject("categoryList",categoryDAO.list());
		
		return modelAndView;
	}*/
	
}




