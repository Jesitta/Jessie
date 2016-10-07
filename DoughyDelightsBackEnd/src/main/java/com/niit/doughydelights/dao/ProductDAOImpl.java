package com.niit.doughydelights.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeProduct;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public ProductDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(CakeProduct cakeProduct) {
		sessionFactory.getCurrentSession().saveOrUpdate(cakeProduct);
	}
	
	@Transactional
	public void delete(int id) {
		CakeProduct productToDelete = new CakeProduct();
		productToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(productToDelete);
		
	}
	@Transactional
	public List<CakeProduct> getByProduct(int id)
	{
		String hql="from CakeProduct where id  =" + "'" + id+ "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeProduct> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;
			
		}
		return null;
	}
	@Transactional
	public CakeProduct get(int id) {
		String hql="from CakeProduct where id =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<CakeProduct> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct.get(0);
			
		}
		return null;
	}
	
	@Transactional
	public List <CakeProduct> getByCategory(int categoryId)
	{
		String hql="from CakeProduct where cat_id  =" + "'" + categoryId + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeProduct> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;
			
		}
		return null;
	}


	
	@Transactional
	public List<CakeProduct> list() {
		
		@SuppressWarnings("unchecked")
		List<CakeProduct> listProduct =(List<CakeProduct>) sessionFactory.getCurrentSession().createCriteria(CakeProduct.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
	}

	@Override
	public List<CakeProduct> getBySupplier(int id) {
		String hql="from CakeProduct where sup_id  =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeProduct> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct;
			
		}
		return null;
	}
}

