package com.niit.cakeshakes.dao;
import java.util.List;
import com.niit.cakeshakes.model.SupplierTable;

public interface SupplierDAO {
	public List<SupplierTable> list();
	public SupplierTable get(int id);
	public void saveOrUpdate(SupplierTable supplierTable);
	public void delete(int id);

}
