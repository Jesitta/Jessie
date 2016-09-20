package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeUser;

public interface UserDAO {
	public List<CakeUser> list();
	public CakeUser get(int id);
	public void saveOrUpdate(CakeUser cakeUser);
	public void delete(String id);
	public boolean isValidUser(String username,String password);
	public CakeUser getUser(String loggedInUser);
	
}