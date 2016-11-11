package com.niit.doughydelights.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.doughydelights.dao.AddressDAO;
import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.OrderDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.UserDAO;

import com.niit.doughydelights.model.AddressDetails;
import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeOrder;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.CartItemList;
import com.niit.doughydelights.model.UserCart;
import com.niit.doughydelights.model.PurchasedItems;

@Controller
public class OrderController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CakeOrder cakeOrder;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private CakeCart cakeCart;
	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private CakeProduct cakeProduct;
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address(Model model, HttpServletRequest req) {
		model.addAttribute("addressDetails", new AddressDetails());
		String loggedInUser = req.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		model.addAttribute("cartSize", cartList.size());
		model.addAttribute("categoryList", categoryDAO.list());
		return "addressdetails";
	}

	@RequestMapping(value = "/addres{id}", method = RequestMethod.GET)
	public ModelAndView addres(@PathVariable("id") int id, Model model, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		if (req.getRemoteUser() != null) {
			model.addAttribute("addressDetails", new AddressDetails());

			mv.setViewName("addressdetails");
		} else {
			mv.addObject("logincart", "Please Login to buy your yummy cake");
			String loggedInUser = req.getRemoteUser();
			CakeUser cakeUser = userDAO.getUser(loggedInUser);
			List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
			mv.addObject("cartSize", cartList.size());
			mv.addObject("categoryList", categoryDAO.list());
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public ModelAndView checkout(@Valid @ModelAttribute("addressDetails") AddressDetails addressDetails,
			BindingResult result, HttpSession session, HttpServletRequest req)

	{

		ModelAndView mv = new ModelAndView();
		String loggedInUser = req.getRemoteUser();
		CakeUser cakeUser = userDAO.getUser(loggedInUser);
		List<CartItemList> cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
		mv.addObject("categoryList", categoryDAO.list());
		if (result.hasErrors()) {

			mv.setViewName("addressdetails");

		}

		else {

			addressDetails.setUser(cakeUser);
			mv.addObject("details", addressDetails);
			addressDAO.saveOrUpdate(addressDetails);

			for (CartItemList cake : cartList) {
				CakeOrder cakeOrder = new CakeOrder();
				cakeOrder.setCart(cake.getUserCart());
				cakeOrder.setUser(cakeUser);
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				cakeOrder.setDate(dateFormat.format(date));
				DateFormat timeFormat = new SimpleDateFormat(" HH:mm:ss");
				Date time = new Date();
				cakeOrder.setTime(timeFormat.format(time));
				cakeOrder.setAddress(addressDetails);
				orderDAO.saveOrUpdate(cakeOrder);
				/* removing the stock of product once it is dispatched */
				CakeProduct cakeProduct = productDAO.get(cake.getProducts().getId());
				System.out.println(cake.getProducts().getId());
				cakeProduct.setStock(cakeProduct.getStock() - cake.getQuantity());
				productDAO.saveOrUpdate(cakeProduct);
			}
			List<CartItemList> cartItems = null;
			cartItems = cartDAO.list(cakeUser.getUserCart().getCartId());
			List<CartItemList> order = cartDAO.list(cakeUser.getUserCart().getCartId());
			mv.addObject("order", order);
			mv.addObject("id", cakeUser.getUserCart().getCartId());
			mv.addObject("totalAmount", cartDAO.getGrandTotal(cakeUser.getUserCart().getCartId()));
			PurchasedItems purchasediems = new PurchasedItems();
			for (CartItemList item : cartItems) {
				purchasediems.setPurchaseItemId(item.getCartItemId());
				purchasediems.setDate(item.getDate());
				purchasediems.setProduct(item.getProducts());
				purchasediems.setQuantity(item.getQuantity());
				purchasediems.setTime(item.getTime());
				purchasediems.setTotalPrice(item.getTotalPrice());
				purchasediems.setUser(item.getUserCart());
				purchasediems.setOrderId(cakeOrder.getOrderid());

				cartDAO.savePurchasedItems(purchasediems);
				cartDAO.delete(item.getCartItemId());
			}

			UserCart userCart = cakeUser.getUserCart();
			userCart.setGrandTotal(0);

			System.out.println(userCart);
			/*
			 * UserCart userCart=
			 * cartDAO.getByCartId(cakeUser.getUserCart().getCartId());
			 * userCart.setGrandTotal(0);
			 */
			cartDAO.saveUserCart(userCart);
			cartList = cartDAO.list(cakeUser.getUserCart().getCartId());
			mv.addObject("cartSize", cartList.size());

		}
		return mv;
	}

	@RequestMapping("/continue")
	public String continueshopping() {
		return "redirect:/home";

	}

}

/*
 * 
 * @RequestMapping("/adminvieworder") public ModelAndView viewproduct() {
 * ModelAndView mv = new ModelAndView("/vieworder"); mv.addObject("OrderList",
 * "ORDER LIST"); Gson gson = new Gson(); List<CakeOrder> order =
 * orderDAO.list(); String orders = gson.toJson(order); mv.addObject("orders",
 * orders); return mv; } }
 */