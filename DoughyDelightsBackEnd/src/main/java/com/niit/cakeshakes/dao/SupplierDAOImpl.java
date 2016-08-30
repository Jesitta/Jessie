package com.niit.cakeshakes.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.CakeCategory;
import com.niit.cakeshakes.model.CakeSupplier;

@Repository("supplierDAO")
public class SupplierDAOImpl implements SupplierDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public SupplierDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(CakeSupplier cakeSupplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(cakeSupplier);
	}
	
	@Transactional
	public void delete(int id) {
		CakeSupplier supplierToDelete = new CakeSupplier();
		supplierToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(supplierToDelete);
		
	}
	
	@Transactional
	public CakeSupplier get(int id) {
		String hql="from CakeSupplier where id =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<CakeSupplier> listSupplier = query.list();
		
		if(listSupplier!= null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
			
		}
		return null;
	}
	
	
	@Transactional
	public List<CakeSupplier> list() {
		
		@SuppressWarnings("unchecked")
		List<CakeSupplier> listSupplier =(List<CakeSupplier>) sessionFactory.getCurrentSession().createCriteria(CakeSupplier.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listSupplier;
	}

	@Transactional
	public CakeSupplier getByName(String name) {
		String hql="from CakeSupplier where name  =" + "'" + name + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeSupplier> listSupplier = query.list();
		
		if(listSupplier!= null && !listSupplier.isEmpty()) {
			return listSupplier.get(0);
			
		}
		return null;
	}
	
}
