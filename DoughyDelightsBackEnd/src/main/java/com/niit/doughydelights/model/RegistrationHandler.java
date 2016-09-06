package com.niit.doughydelights.model;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.doughydelights.dao.UserDAO;

@Component
public class RegistrationHandler {


	@Autowired
	private UserDAO userDAO; 
	public CakeUser initFlow()
	{
		
		return new CakeUser();
	}
	public String validateDetails(CakeUser cakeUser, MessageContext messageContext) {
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
			messageContext.addMessage(new MessageBuilder().error().source("mobilenumber").defaultText("Mobilenumber cannot be Empty").build());
			status = "failure";
		}
		if (cakeUser.getPassword().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("password").defaultText("Password cannot be Empty").build());
			status = "failure";
		}
		if (cakeUser.getAddress().isEmpty()) {
			messageContext.addMessage(
					new MessageBuilder().error().source("address").defaultText("Address cannot be Empty").build());
			status = "failure";
		}
		
		return status;
	}
	
	public void registerUser(CakeUser cakeUser) {
		userDAO.saveOrUpdate(cakeUser);

		
	}

}


