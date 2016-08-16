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

import com.niit.cakeshakes.dao.SupplierDAO;
import com.niit.cakeshakes.model.FileUtil;
import com.niit.cakeshakes.model.SupplierTable;

@Controller
public class SupplierController {

@Autowired
private SupplierTable supplierTable;
@Autowired
private SupplierDAO supplierDAO;

	@RequestMapping(value ="/supplierr",method=RequestMethod.GET)
	public ModelAndView supplier(){
		ModelAndView modelAndView = new ModelAndView("/supplier");
		modelAndView.addObject("supplierTable", supplierTable); 
		modelAndView.addObject("addsupplier", "Add Supplier");
	
		return modelAndView;
	}
	@RequestMapping(value ="/supplierview",method=RequestMethod.POST)
	public ModelAndView addsupplier(@Valid @ModelAttribute("supplierTable")SupplierTable supplierTable, BindingResult result ){
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
			modelAndView.addObject("addsupplier", "Add Supplier");
			
					modelAndView.setViewName("/supplier");
				}
		else{
		supplierDAO.saveOrUpdate(supplierTable);
		
		modelAndView.addObject("SupplierList", "SUPPLIER LIST");
	modelAndView.addObject("supplierList",supplierDAO.list()); 
	modelAndView.setViewName("/view"); 
		}
		return modelAndView;
	}
	@RequestMapping(value ="/es{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
		supplierTable = supplierDAO.get(id); 
		model.addAttribute("supplierTable", supplierTable);
	
		model.addAttribute("editsupplier", "Edit Supplier");  
		System.out.println(supplierTable.getId());
		return "/supplier";
		
	}
	@RequestMapping("/s{id}")
	public String deletecategory(@PathVariable("id") int id,ModelMap model) {
		supplierDAO.delete(id);
		model.addAttribute("supplierList",supplierDAO.list());
		model.addAttribute("SupplierList", "SUPPLIER LIST");
		return "/view";
	}
	
}
