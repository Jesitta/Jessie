package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.CakeCategory;


public interface CategoryDAO {
		public List<CakeCategory> list();
		public CakeCategory get(int id);
		public void saveOrUpdate(CakeCategory cakeCategory);
		public void delete(int id);
		public CakeCategory getByName(String catname);
	
		

}
