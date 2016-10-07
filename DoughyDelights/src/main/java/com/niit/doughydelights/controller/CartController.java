package com.niit.doughydelights.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;

import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.UserDAO;
import com.niit.doughydelights.model.CakeCart;

import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CakeCart cakeCart;
	@Autowired
	private CakeProduct cakeProduct;
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	
	

	@RequestMapping("/cart{id}")
	public ModelAndView addcart(@PathVariable("id") int id, HttpSession session, HttpServletRequest req) {
		CakeProduct cakeProduct = productDAO.get(id);
		ModelAndView mv = new ModelAndView();
		String loggedInUser = req.getRemoteUser();
		/*List<CakeCart> cartList = cartDAO.list(loggedInUser);
		  if(cartList !=  null){
			     for (int i=0; i < cartList.size(); i++){
			         if(cakeProduct.getId() == cartList.get(i).getProduct().getId())
			        	cakeCart= cartList.get(i);
			      
			 		cakeCart.setQuantity(cakeCart.getQuantity()+1);
			 		cakeCart.setTotal(cakeProduct.getPrice() * cakeCart.getQuantity());
			 		cartDAO.saveOrUpdate(cakeCart);
			 		
			 		mv.setViewName("redirect:/viewcartt");
			 		
			     }
		  }
		*/
		System.out.println("inside controller");
		System.out.println(productDAO.get(id).getName() + " " + "answer");
		
		CakeCart cakeCart = new CakeCart();
		cakeCart.setStatus('N');
		cakeCart.setPrice(cakeProduct.getPrice());
		cakeCart.setProductname(cakeProduct.getName());
		cakeCart.setProduct(cakeProduct);
		cakeCart.setQuantity(1);
		cakeCart.setTotal(cakeProduct.getPrice() * cakeCart.getQuantity());
		

		if (req.getRemoteUser() != null) {
			cakeCart.setUsername(loggedInUser);
			cartDAO.saveOrUpdate(cakeCart);
			List<CakeCart> cartList = cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
			mv.addObject("categoryList", categoryDAO.list());
			mv.setViewName("redirect:/viewcartt");
		} else {
			mv.addObject("logincart", "Please Login to buy your yummy cake");

			mv.setViewName("loginneww");
		}
		
		return mv;
	}

	@RequestMapping(value = "/viewcartt")
	public String viewcart(Model model, HttpSession session, CakeCart cakeCart) {

		model.addAttribute("cakeCart", new CakeCart());
		String loggedInUser = (String) session.getAttribute("loggedInUser");
		
		model.addAttribute("cartList", cartDAO.list(loggedInUser));
		model.addAttribute("totalAmount", cartDAO.getTotalAmount(loggedInUser));
		List<CakeCart> cartList = cartDAO.list(loggedInUser);
		model.addAttribute("cartSize", cartList.size());
		
		
		model.addAttribute("CartList", "YOUR SOPPING CART");
		model.addAttribute("noitems", "YOUR CART IS EMPTY");

		return "viewcart";

	}

	@RequestMapping("/delcart{id}")
	public String deletecategory(@PathVariable("id") int id) {
		cartDAO.delete(id);

		return "redirect:/viewcartt";
	}
	
	/*@RequestMapping("/final{id}")
	public ModelAndView cartfinal(@PathVariable("id") int id, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("home");

		CakeProduct cakeProduct = productDAO.get(id);

		System.out.println("inside controller");
		System.out.println(productDAO.get(id).getName() + " " + "answer");
		CakeOrder cakeOrder = new CakeOrder();
		String loggedInUser = req.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(loggedInUser);

		cakeOrder.setProductname(cakeProduct.getName());
		cakeOrder.setAddress(cakeUser.getAddress());
		cakeOrder.setMobilenumber(cakeUser.getMobilenumber());
		cakeOrder.setUsername(loggedInUser);
		cakeOrder.setTotal(cakeProduct.getPrice());
		orderDAO.saveOrUpdate(cakeOrder);

		return mv;
	}

	@RequestMapping("/checkout")
	public ModelAndView checkout(HttpSession session, HttpServletRequest req)

	{
		cartDAO.saveOrUpdate(cakeCart);
		ModelAndView mv = new ModelAndView("addressdetails");
		CakeOrder cakeOrder = new CakeOrder();
		mv.addObject("ordersum", "ORDER SUMMARY");
		String loggedInUser = req.getRemoteUser();
		List<CakeCart> cartList = cartDAO.list(loggedInUser);
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		for (CakeCart cake : cartList) {

			cakeOrder.setProductname(cake.getProductname());

			cakeOrder.setAddress(cakeUser.getAddress());
			cakeOrder.setMobilenumber(cakeUser.getMobilenumber());

			cakeOrder.setUsername(loggedInUser);
			cakeOrder.setTotal(cake.getPrice());
			orderDAO.saveOrUpdate(cakeOrder);

		}
		// CakeUser cakeUser=userDAO.getUser(loggedInUser);
		List<CakeCart> order = cartDAO.list(loggedInUser);
		mv.addObject("order", order);
		mv.addObject("ordermobilenumber", cakeUser.getMobilenumber());
		mv.addObject("orderaddress", cakeUser.getAddress());
		mv.addObject("totalAmount", cartDAO.getTotalAmount(loggedInUser));
		List<CakeCart> cart = cartDAO.list(loggedInUser);
		for (CakeCart cakeCart : cart) {
			cartDAO.delete(cakeCart.getId());

		}

		return mv;
	}*/

	@RequestMapping("plus{id}")
	public ModelAndView plus(@PathVariable("id") int id) {
		cakeCart = cartDAO.get(id);
		ModelAndView mv = new ModelAndView("redirect:/viewcartt");
		if (cakeCart.getQuantity() == 5) {
			cakeCart.setQuantity(5);
			cartDAO.saveOrUpdate(cakeCart);
		} else {
			cakeCart.setQuantity(cakeCart.getQuantity() + 1);
			cakeCart.setTotal(cakeCart.getQuantity() * cakeCart.getPrice());
			cartDAO.saveOrUpdate(cakeCart);
		}
		return mv;

	}

	@RequestMapping("minus{id}")
	public ModelAndView minus(@PathVariable("id") int id) {
		cakeCart = cartDAO.get(id);
		ModelAndView mv = new ModelAndView("redirect:/viewcartt");
		if (cakeCart.getQuantity() == 1) {
			cakeCart.setQuantity(1);

			cartDAO.saveOrUpdate(cakeCart);
		} else {
			cakeCart.setQuantity(cakeCart.getQuantity() - 1);
			cakeCart.setTotal(cakeCart.getQuantity() * cakeCart.getPrice());
			cartDAO.saveOrUpdate(cakeCart);
		}
		return mv;

	}

}
