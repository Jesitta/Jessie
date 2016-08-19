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
import com.niit.cakeshakes.dao.SupplierDAO;
import com.niit.cakeshakes.model.FileUtil;
import com.niit.cakeshakes.model.CakeCategory;
import com.niit.cakeshakes.model.CakeSupplier;

@Controller
public class SupplierController {

@Autowired
private CakeSupplier cakeSupplier;
@Autowired
private SupplierDAO supplierDAO;

	@RequestMapping(value ="/supplierr",method=RequestMethod.GET)
	public ModelAndView supplier(){
		ModelAndView modelAndView = new ModelAndView("/supplier");
		modelAndView.addObject("cakeSupplier", cakeSupplier); 
		modelAndView.addObject("addsupplier", "Add Supplier");
	
		return modelAndView;
	}
	@RequestMapping(value ="/supplierview",method=RequestMethod.POST)
	public ModelAndView addsupplier(@Valid @ModelAttribute("cakeSupplier")CakeSupplier cakeSupplier, BindingResult result ){
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
			modelAndView.addObject("addsupplier", "Add Supplier");
			
					modelAndView.setViewName("/supplier");
				}
		else{
		supplierDAO.saveOrUpdate(cakeSupplier);
		
		modelAndView.addObject("SupplierList", "SUPPLIER LIST");
		modelAndView.setViewName("redirect:/viewsup");
		}
		return modelAndView;
	}
	@RequestMapping("viewsup")
    public ModelAndView viewsupplier() {
		ModelAndView mv=new ModelAndView("/viewsupplier");
		mv.addObject("SupplierList", "SUPPLIER LIST");
		Gson gson=new Gson(); 
		List<CakeSupplier> supplier= supplierDAO.list();
		String value1=gson.toJson(supplier);
		mv.addObject("value1",value1);
		return mv;
    }
	@RequestMapping(value ="/es{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
	
		cakeSupplier = supplierDAO.get(id); 
		model.addAttribute("cakeSupplier", cakeSupplier);
	
		model.addAttribute("editsupplier", "Edit Supplier");  
		
		return "/supplier";
		
	}
	@RequestMapping("/s{id}")
	public String deletecategory(@PathVariable("id") int id,ModelMap model) {
		supplierDAO.delete(id);
		/*model.addAttribute("supplierList",supplierDAO.list());
		model.addAttribute("SupplierList", "SUPPLIER LIST");*/
		return "redirect:/viewsup";
	}
	

}
