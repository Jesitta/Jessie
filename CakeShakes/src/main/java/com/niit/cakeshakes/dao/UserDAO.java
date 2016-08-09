package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.UserTable;

public interface UserDAO {
	public List<UserTable> list();
	public UserTable get(String id);
	public void saveOrUpdate(UserTable userTable);
	public void delete(String id);
	public boolean isValidUser(String userid,String password);
}