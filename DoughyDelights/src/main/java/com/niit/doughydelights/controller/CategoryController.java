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

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeProduct;




@Controller

public class CategoryController {
	
	
	@Autowired
	private  CategoryDAO categoryDAO;
	@Autowired
	private  ProductDAO productDAO;
	@Autowired
	private  CakeCategory cakeCategory;
	@RequestMapping(value ="/admincategory",method=RequestMethod.GET)
	public String category(Model model){
		model.addAttribute("cakeCategory",new CakeCategory());
		model.addAttribute("addcategory", "ADD CATEGORY");
		return "category";
	}
	


@RequestMapping("/adminviewcat")
public ModelAndView viewcategory() {
	ModelAndView mv=new ModelAndView("viewcategory");
	mv.addObject("CategoryList", "CATEGORY LIST");
	Gson gson=new Gson();
	List<CakeCategory> category=categoryDAO.list();
	String value=gson.toJson(category);
	mv.addObject("value",value);
	

    return mv;
}
	@RequestMapping(value ="/adminaddcat",method=RequestMethod.POST)
	public ModelAndView  addcategory(@Valid @ModelAttribute("cakeCategory") CakeCategory cakeCategory, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
if(result.hasErrors()) {
	modelAndView.addObject("addcategory", "ADD CATEGORY");
			modelAndView.setViewName("category");
		}
else{
	
		System.out.println(cakeCategory.getId());
		categoryDAO.saveOrUpdate(cakeCategory);
	
	System.out.println(cakeCategory.getId());
	System.out.println(cakeCategory.getName());
	System.out.println(cakeCategory.getDescription());
		modelAndView.setViewName("redirect:/adminviewcat");
		
		
	}
return modelAndView;
	}


	
	@RequestMapping("/admincatdel{id}")
	public String deletecategory(@PathVariable("id") int id) {
		
		List<CakeProduct> product=productDAO.getByCategory(id);
		if(product != null && !product.isEmpty()) {
		for(CakeProduct cakeProduct:product){
		productDAO.delete(cakeProduct.getId());
	}
		}
		categoryDAO.delete(id);
		
		return "redirect:/adminviewcat";
	}
	

	@RequestMapping(value ="/admincatedit{id}")
	public String editcategory(@PathVariable("id") int id,Model model  ) {
		cakeCategory = categoryDAO.get(id); 
		model.addAttribute("cakeCategory",cakeCategory);
	
		model.addAttribute("editcategory", "EDIT CATEGORY");  
		
		return "category";
		
	}

}




