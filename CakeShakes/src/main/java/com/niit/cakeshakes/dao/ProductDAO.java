package com.niit.cakeshakes.dao;

import java.util.List;

import com.niit.cakeshakes.model.CakeProduct;

public interface ProductDAO {

	public List<CakeProduct> list();
	public CakeProduct get(int id);
	public void saveOrUpdate(CakeProduct cakeProduct);
	public void delete(int id);
}
