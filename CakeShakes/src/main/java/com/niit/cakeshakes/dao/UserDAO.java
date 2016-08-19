package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.CakeUser;

public interface UserDAO {
	public List<CakeUser> list();
	public CakeUser get(String id);
	public void saveOrUpdate(CakeUser cakeUser);
	public void delete(String id);
	public boolean isValidUser(String userid,String password);
}