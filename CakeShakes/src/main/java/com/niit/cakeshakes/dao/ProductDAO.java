package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.ProductTable;

public interface ProductDAO {

	public List<ProductTable> list();
	public ProductTable get(int id);
	public void saveOrUpdate(ProductTable productTable);
	public void delete(int id);
}
