package com.niit.doughydelights.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.UserDAO;

import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.CartItemList;
import com.niit.doughydelights.model.UserCart;

@Controller
public class CartController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "/cart{id}")
	public ModelAndView  addtousercart(@PathVariable("id") int id, HttpServletRequest req) {
		
		
		ModelAndView mv = new ModelAndView();
			String username =req.getRemoteUser();
			if (req.getRemoteUser() == null){
				mv.addObject("logincart", "Please Login to buy your yummy cake");
mv.addObject("categoryList", categoryDAO.list());
				mv.setViewName("login");
			}
			else{
			CakeUser cakeUser = userDAO.getUser(username);
	        UserCart userCart = cakeUser.getUserCart();
	        CakeProduct product = productDAO.get(id);
	        DateFormat nowdate = new SimpleDateFormat("dd/MM/yyyy");
	        DateFormat nowtime = new SimpleDateFormat("hh:mm:ss");
	        Date date = new Date();
	        Calendar calender = Calendar.getInstance();
	        String currentdate = nowdate.format(date);
	        String currenttime = nowtime.format(calender.getTime());
	        
	        //to compare and check whether the product already exist or not	        
	        List<CartItemList> cartItems=null;
	        cartItems = cartDAO.list(userCart.getCartId());
	        if(cartItems !=  null){
	        for (int i=0; i < cartItems.size(); i++){
	        	
	            if(product.getId() == cartItems.get(i).getProducts().getId()){
	            	/*&&cartItems.get(i).getQuantity()<product.getStock()*/
	            	System.out.println("working");
	            	System.out.println(cartItems.get(i));
	                CartItemList cartItem = cartItems.get(i);
	                cartItem.setDate(currentdate);
	                cartItem.setTime(currenttime);
	                cartItem.setQuantity(cartItem.getQuantity() + 1);
	                cartItem.setPrice(product.getPrice());
	                cartItem.setTotalPrice(product.getPrice()*cartItem.getQuantity());
	                cartDAO.saveCartItem(cartItem);
	                
	                //to update cartlist in usercart 
	              userCart.setGrandTotal(cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
	    	        cartDAO.saveUserCart(userCart);
             mv.setViewName("redirect:/home");
            return mv;
	            }
	            
	            
	        }
	        
	        }
	        
	        CartItemList cartItem = new CartItemList();
	      cartItem.setProducts(product);
	          cartItem.setDate(currentdate);
            cartItem.setTime(currenttime);
            cartItem.setQuantity(1);
	        cartItem.setPrice(product.getPrice());
	        cartItem.setTotalPrice(product.getPrice()*cartItem.getQuantity());
	        cartItem.setUsername(username);
	        cartItem.setUserCart(userCart);
	        cartDAO.saveCartItem(cartItem);//save or update
	        
	        userCart.setGrandTotal(cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
	        cartDAO.saveUserCart(userCart);
	        mv.setViewName("redirect:/home");
	        
			}
			return mv;
	    }

	@RequestMapping(value = "viewcartt")
	public ModelAndView getCart(HttpServletRequest request) {
		String username = request.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(username);

		int cartId = cakeUser.getUserCart().getCartId();

		ModelAndView modelAndView = new ModelAndView("viewcart");
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		modelAndView.addObject("cartSize", cartList.size());
		modelAndView.addObject("categoryList", categoryDAO.list());
		// modelAndView.addObject("cart", new UserCart());
		modelAndView.addObject("cartList", cartList);

		modelAndView.addObject("totalAmount", cartDAO.getTotal(cartId));

		modelAndView.addObject("cartId", cartId);

		return modelAndView;
	}

	@RequestMapping("/delcart{id}")
	public String deletecategory(@PathVariable("id") int id, HttpServletRequest request) {
		cartDAO.delete(id);
		CakeUser cakeUser = userDAO.getUser(request.getRemoteUser());
		UserCart userCart = cakeUser.getUserCart();
		userCart.setGrandTotal(cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
		cartDAO.saveUserCart(userCart);

		return "redirect:/viewcartt";
	}

	@RequestMapping("plus{id}")
	public ModelAndView plus(@PathVariable("id") int id, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("redirect:/viewcartt");

		System.out.println("Stock");
		CartItemList cartItem = cartDAO.getCartId(id);
		CakeProduct product = productDAO.get(cartItem.getProducts().getId());

		System.out.println(cartItem.getProducts().getId());
		System.out.println(product.getStock());
		if (cartItem.getQuantity() == product.getStock()) {
			cartItem.setQuantity(product.getStock());
			cartDAO.saveCartItem(cartItem);
		} else {
			cartItem.setQuantity(cartItem.getQuantity() + 1);
			cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getPrice());

			cartDAO.saveCartItem(cartItem);
			CakeUser cakeUser = userDAO.getUser(request.getRemoteUser());
			UserCart userCart = cakeUser.getUserCart();
			userCart.setGrandTotal(cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
			cartDAO.saveUserCart(userCart);

		}
		return mv;

	}

	@RequestMapping("minus{id}")
	public ModelAndView minus(@PathVariable("id") int id, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("redirect:/viewcartt");
		CartItemList cartItem = cartDAO.getCartId(id);
		if (cartItem.getQuantity() == 1) {
			cartItem.setQuantity(1);

			cartDAO.saveCartItem(cartItem);

		} else {
			cartItem.setQuantity(cartItem.getQuantity() - 1);
			cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getPrice());
			cartDAO.saveCartItem(cartItem);

			CakeUser cakeUser = userDAO.getUser(request.getRemoteUser());
			UserCart userCart = cakeUser.getUserCart();
			userCart.setGrandTotal(cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
			cartDAO.saveUserCart(userCart);
		}
		return mv;

	}
}
