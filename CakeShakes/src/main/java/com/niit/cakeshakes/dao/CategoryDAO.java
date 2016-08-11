package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.CategoryTable;


public interface CategoryDAO {
	
		public List<CategoryTable> list();
		public CategoryTable get(int id);
		public void saveOrUpdate(CategoryTable categoryTable);
		public void delete(int id);
		public void save(CategoryTable categoryTable);
		public void update(CategoryTable categoryTable);
		

}
