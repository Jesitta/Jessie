package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeCategory;


public interface CategoryDAO {
		public List<CakeCategory> list();
		public CakeCategory get(int id);
		public void saveOrUpdate(CakeCategory cakeCategory);
		public void delete(int id);
		public CakeCategory getByName(String catname);
	
		

}
