package com.niit.doughydelights.util;

import java.security.SecureRandom;
import java.util.List;
import java.util.Locale.Category;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.niit.doughydelights.dao.CartDAO;
import com.niit.doughydelights.dao.CategoryDAO;
import com.niit.doughydelights.model.UserCart;
import com.niit.doughydelights.dao.UserDAO;
import com.niit.doughydelights.model.CakeCategory;
import com.niit.doughydelights.model.CakeProduct;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.util.MailUtil;

@Controller
public class RegistrationHandler {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private UserCart userCart;
	@Autowired
	private CartDAO cartDAO;

	public CakeUser initFlow() {

		return new CakeUser();
	}

	public String validateDetails(CakeUser cakeUser, MessageContext messageContext) {

		List<CakeUser> userList = null;
		userList = userDAO.list();
		String status = "success";

		if (cakeUser.getName().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("name").defaultText("Name cannot be Empty").build());
			status = "failure";
		}
		if (cakeUser.getUsername().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("username").defaultText("Username cannot be Empty").build());
			status = "failure";
		}

		if (cakeUser.getMobilenumber().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("mobilenumber")
					.defaultText("Mobilenumber cannot be Empty").build());
			status = "failure";
		}
		if (cakeUser.getEmail().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("email").defaultText("Email cannot be Empty").build());
			status = "failure";
		}

		if (userList != null) {
			for (int i = 0; i < userList.size(); i++) {
				if (cakeUser.getUsername().equals(userList.get(i).getUsername())) {
					messageContext.addMessage(new MessageBuilder().error().source("username")
							.defaultText("Username already exists").build());
					status = "failure";
				}

			}

		}

		return status;
	}

	public String generatePassword() {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789";

		final int PASSWORD_LENGTH = 5;
		Random rnd = new SecureRandom();
		StringBuilder pass = new StringBuilder();
		for (int i = 0; i < PASSWORD_LENGTH; i++)
			pass.append(chars.charAt(rnd.nextInt(chars.length())));
		return pass.toString();
	}

	public CakeUser mailSender(CakeUser cakeUser) {
		// Spring Bean file you specified in /src/main/resources folder
		String mailSenderConfFile = "mailsender-bean.xml";
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext(mailSenderConfFile);

		// @Service("mailUtil") <-- same annotation you specified in
		// VerificationMailAPI.java
		MailUtil mailUtil = (MailUtil) context.getBean("mailUtil");
		String toAddr = cakeUser.getEmail();
		String fromAddr = "doughydelightsz@gmail.com";

		// email subject
		String subject = "Hey.. This email sent by doughydelights";
		// one time password
		String var = generatePassword();
		cakeUser.setPassword(var);
		// email body
		String body = "There you go.. You got an email..Ur OTP is: " + var;

		mailUtil.ReadyToSendEmail(toAddr, fromAddr, subject, body);
		return cakeUser;
	}

	public void registerUser(CakeUser cakeUser) {

		System.out.println("abbbbbbbbbbbbbsdgj" + cakeUser);
		userDAO.saveOrUpdate(cakeUser);

		System.out.println("saved in table" + cakeUser);
		UserCart newCart = new UserCart();
		// newCart.setGrandTotal(0);
		newCart.setCakeUser(cakeUser);
		cartDAO.saveUserCart(newCart);
		newCart = cartDAO.getCartByUser(cakeUser.getUsername());
		cakeUser.setUserCart(newCart);
		System.out.println("saving" + cakeUser);
		userDAO.saveOrUpdate(cakeUser);
	}

}
