package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeOrder;

public interface OrderDAO {
	public List<CakeOrder> list(String loggedInUser);
	public CakeOrder get(int id);
	public void saveOrUpdate(CakeOrder cakeOrder);
}
