package com.niit.cakeshakes.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.ProductTable;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public ProductDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(ProductTable productTable) {
		sessionFactory.getCurrentSession().saveOrUpdate(productTable);
	}
	
	@Transactional
	public void delete(int id) {
		ProductTable productToDelete = new ProductTable();
		productToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(productToDelete);
		
	}
	
	@Transactional
	public ProductTable get(int id) {
		String hql="from ProductTable where id =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<ProductTable> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct.get(0);
			
		}
		return null;
	}
	
	
	@Transactional
	public List<ProductTable> list() {
		
		@SuppressWarnings("unchecked")
		List<ProductTable> listProduct =(List<ProductTable>) sessionFactory.getCurrentSession().createCriteria(ProductTable.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
	}
	
}

