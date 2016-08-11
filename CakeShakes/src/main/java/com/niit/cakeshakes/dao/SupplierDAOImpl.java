package com.niit.cakeshakes.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.SupplierTable;

@Repository("supplierDAO")
public class SupplierDAOImpl implements SupplierDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public SupplierDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(SupplierTable supplierTable) {
		saveOrUpdate(supplierTable);
	}
	
	@Transactional
	public void delete(String id) {
		SupplierTable supplierToDelete = new SupplierTable();
		supplierToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(supplierToDelete);
		
	}
	
	@Transactional
	public SupplierTable get(String id) {
		String hql="from SupplierTable where id =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<SupplierTable> listSupplier = query.list();
		
		if(listSupplier!= null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
			
		}
		return null;
	}
	
	
	@Transactional
	public List<SupplierTable> list() {
		
		@SuppressWarnings("unchecked")
		List<SupplierTable> listSupplier =(List<SupplierTable>) sessionFactory.getCurrentSession().createCriteria(SupplierTable.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listSupplier;
	}
	
}
