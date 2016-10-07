package com.niit.doughydelights.controller;

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
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.SupplierDAO;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeSupplier;
import com.niit.doughydelights.util.FileUtil;

@Controller
public class SupplierController {

@Autowired
private CakeSupplier cakeSupplier;
@Autowired
private ProductDAO productDAO;
@Autowired
private SupplierDAO supplierDAO;

	@RequestMapping(value ="/adminsupplier",method=RequestMethod.GET)
	public String supplier(Model model){
		
		model.addAttribute("cakeSupplier", new CakeSupplier()); 
		model.addAttribute("addsupplier", "ADD SUPPLIER");
	
		return "/supplier";
	}
	@RequestMapping(value ="/adminaddsupl",method=RequestMethod.POST)
	public ModelAndView addsupplier(@Valid @ModelAttribute("cakeSupplier")CakeSupplier cakeSupplier, BindingResult result ){
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
			modelAndView.addObject("addsupplier", "ADD SUPPLIER");
			
					modelAndView.setViewName("supplier");
				}
		else{
			
		supplierDAO.saveOrUpdate(cakeSupplier);
		
		modelAndView.addObject("SupplierList", "SUPPLIER LIST");
		modelAndView.setViewName("redirect:/adminviewsupl");
		}
		return modelAndView;
	}
	@RequestMapping("/adminviewsupl")
    public ModelAndView viewsupplier() {
		ModelAndView mv=new ModelAndView("/viewsupplier");
		mv.addObject("SupplierList", "SUPPLIER LIST");
		Gson gson=new Gson(); 
		List<CakeSupplier> supplier= supplierDAO.list();
		String value1=gson.toJson(supplier);
		mv.addObject("value1",value1);
		return mv;
    }
	@RequestMapping(value ="/admineditsupl{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
	
		cakeSupplier = supplierDAO.get(id); 
		model.addAttribute("cakeSupplier", cakeSupplier);

		model.addAttribute("editsupplier", "EDIT SUPPLIER");  
		
		return "supplier";
		
	}
	@RequestMapping("/admindelsupl{id}")
	public String deletecategory(@PathVariable("id") int id) {
		List<CakeProduct> product=productDAO.getBySupplier(id);
		for(CakeProduct cakeProduct:product){
		productDAO.delete(cakeProduct.getId());
	}
		supplierDAO.delete(id);
		
		return "redirect:/adminviewsupl";
	}


}
