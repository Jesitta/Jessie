package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeProduct;

public interface ProductDAO {

	public List<CakeProduct> list();
	public CakeProduct get(int id);
	public void saveOrUpdate(CakeProduct cakeProduct);
	public void delete(int id);
	public List <CakeProduct> getByCategory(int categoryId);
	public List<CakeProduct> getByProduct(int id);
	public List<CakeProduct> getBySupplier(int id);

	public CakeProduct getProductStock(int stock);
	
	
}
