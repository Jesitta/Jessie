package com.niit.cakepark.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.cakeshakes.dao.CartDAO;
import com.niit.cakeshakes.dao.ProductDAO;
import com.niit.cakeshakes.model.CakeCart;
import com.niit.cakeshakes.model.CakeProduct;
import com.niit.cakeshakes.model.CakeUser;

@Controller
public class CartController {
	
	
	
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private CakeProduct cakeProduct;
	@Autowired
	private CakeCart cakeCart;
	@Autowired
	private CakeUser cakeUser;
	
	
	@Autowired
	private ProductDAO productDAO;
	
/*	@RequestMapping(value="/addcart", method=RequestMethod.GET)
	public String cart(Model model){
		
		model.addAttribute("cakeCart",new CakeCart());
		model.addAttribute("cartList",cartDAO.list());
		return "/";
	}
	*/
	
	
	@RequestMapping("/cart{id}")
	public String  addcart(@PathVariable("id") int id,HttpSession session,Model model) {
		
	   CakeProduct cakeProduct = productDAO.get(id); 
	   CakeCart cakeCart=new CakeCart();
		cakeCart.setPrice(cakeProduct.getPrice());
		cakeCart.setProductname(cakeProduct.getName());
		cakeCart.setQuantity(1);
		String loggedInUser=(String) session.getAttribute("loggedInUser");
		cakeCart.setUsername(loggedInUser);
		cartDAO.saveOrUpdate(cakeCart);
		return "/";

	}
	@RequestMapping(value="/viewcartt")
	public String viewcart(Model model,HttpSession session){
		model.addAttribute("cakeCart",new CakeCart());
		String loggedInUser= (String) session.getAttribute("loggedInUser");
        model.addAttribute("cartList", cartDAO.list(loggedInUser));
		model.addAttribute("totalAmount", cartDAO.getTotalAmount(loggedInUser));
		model.addAttribute("CartList", "CART LIST");
		return "viewcart";
		
	}
	@RequestMapping("/delcart{id}")
	public String deletecategory(@PathVariable("id") int id) {
		cartDAO.delete(id);
		
		return "redirect:/viewcartt";
	}
	
	
}
