package com.niit.cakeshakes.dao;
import java.util.List;
import com.niit.cakeshakes.model.CakeSupplier;

public interface SupplierDAO {
	public List<CakeSupplier> list();
	public CakeSupplier get(int id);
	public void saveOrUpdate(CakeSupplier cakeSupplier);
	public void delete(int id);

}
