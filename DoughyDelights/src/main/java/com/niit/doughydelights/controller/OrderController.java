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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.doughydelights.dao.AddressDAO;
import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.dao.OrderDAO;
import com.niit.doughydelights.dao.ProductDAO;
import com.niit.doughydelights.dao.TestDAO;
import com.niit.doughydelights.dao.UserDAO;
import com.niit.doughydelights.dao.UserOrderDAO;
import com.niit.doughydelights.model.AddressDetails;
import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeOrder;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.OrderTest;
import com.niit.doughydelights.model.UserOrder;

@Controller
public class OrderController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserOrderDAO userorderDAO;
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
	@Autowired
	private TestDAO testorderDAO;
	@Autowired
	private OrderTest ordertest;

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address(Model model) {
		model.addAttribute("addressDetails", new AddressDetails());

		return "addressdetails";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public ModelAndView checkout(@Valid @ModelAttribute("addressDetails") AddressDetails addressDetails, BindingResult result,
			HttpSession session, HttpServletRequest req)

	{

		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {

			mv.setViewName("addressdetails");
System.err.println("inside error");
		}

		else {
			String loggedInUser = req.getRemoteUser();
			CakeUser cakeUser = userDAO.getUser(loggedInUser);
			addressDetails.setUser(cakeUser);
			mv.addObject("details", addressDetails);
			addressDAO.saveOrUpdate(addressDetails);

			mv.addObject("ordersum", "ORDER SUMMARY");

			List<CakeCart> cartList = cartDAO.list(loggedInUser);

			for (CakeCart cake : cartList) {
				CakeOrder cakeOrder = new CakeOrder();

				cakeOrder.setCart(cake);
				cakeOrder.setUser(cakeUser);
				CakeProduct cakeProduct = productDAO.get(cake.getProduct().getId());
				System.out.println(cake.getProduct().getId());
				cakeProduct.setStock(cakeProduct.getStock() - cake.getQuantity());
				productDAO.saveOrUpdate(cakeProduct);
				// cakeOrder.setDate();
				// cakeOrder.setTime();

				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				cakeOrder.setDate(dateFormat.format(date));
				DateFormat timeFormat = new SimpleDateFormat(" HH:mm:ss");
				Date time = new Date();
				cakeOrder.setTime(timeFormat.format(time));
				cakeOrder.setAddress(addressDetails);
				orderDAO.saveOrUpdate(cakeOrder);
			}

			List<CakeCart> order = cartDAO.list(loggedInUser);
			mv.addObject("order", order);

			mv.addObject("totalAmount", cartDAO.getTotalAmount(loggedInUser));
			List<CakeCart> cart = cartDAO.list(loggedInUser);
			UserOrder userOrder = new UserOrder();
			userOrder.setUser(cakeUser);

			userOrder.setGrandtotal(cartDAO.getGrandTotalAmount(loggedInUser));
			userorderDAO.saveOrUpdate(userOrder);
			for (CakeCart cakeCart : cart) {
				cakeCart.setStatus('D');

				cartDAO.saveOrUpdate(cakeCart);

			}
			mv.setViewName("checkout");
		}

		return mv;

	}

	@RequestMapping("/continue")
	public String continueshopping() {
		return "redirect:/home";

	}

	@RequestMapping("/adminvieworder")
	public ModelAndView viewproduct() {
		ModelAndView mv = new ModelAndView("/vieworder");
		mv.addObject("OrderList", "ORDER LIST");
		Gson gson = new Gson();
		List<CakeOrder> order = orderDAO.list();
		String orders = gson.toJson(order);
		mv.addObject("orders", orders);
		return mv;
	}
}
