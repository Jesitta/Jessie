package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.CakeCart;

public interface CartDAO {
	
	
	public List<CakeCart> list(String loggedInUser);
	public CakeCart get(int id);
	public void saveOrUpdate(CakeCart cakeCart);
	public void delete(int id);
	public Long getTotalAmount(String loggedInUser);
	
   
}
