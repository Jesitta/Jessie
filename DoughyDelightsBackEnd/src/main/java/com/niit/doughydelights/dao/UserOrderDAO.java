package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.UserOrder;

public interface UserOrderDAO {
	//public List<CakeOrder> list(String loggedInUser);
	public UserOrder get(int id);
	public void saveOrUpdate(UserOrder userOrder);
	//public Object getTotalAmount(String loggedInUser);
	public List<UserOrder> list(String loggedInUser);
	
}
