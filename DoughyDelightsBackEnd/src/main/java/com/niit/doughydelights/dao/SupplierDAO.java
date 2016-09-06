package com.niit.doughydelights.dao;
import java.util.List;

import com.niit.doughydelights.model.CakeSupplier;

public interface SupplierDAO {
	public List<CakeSupplier> list();
	public CakeSupplier get(int id);
	public void saveOrUpdate(CakeSupplier cakeSupplier);
	public void delete(int id);
	public CakeSupplier getByName(String name);

}
