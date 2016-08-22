package com.niit.cakeshakes.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.CakeCategory;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public CategoryDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(CakeCategory cakeCategory) {
		sessionFactory.getCurrentSession().saveOrUpdate(cakeCategory);
	}
	
	@Transactional
	public CakeCategory getByName(String name)
	{
		String hql="from CakeCategory where name  =" + "'" + name + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeCategory> listCategory = query.list();
		
		if(listCategory!= null && !listCategory.isEmpty()) {
			return listCategory.get(0);
			
		}
		return null;
	}
	
	@Transactional
	public void delete(int id) {
		CakeCategory categoryToDelete = new CakeCategory();
		categoryToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(categoryToDelete);
		
	}
	
	@Transactional
	public CakeCategory get(int id) {
		String hql="from CakeCategory where id  =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<CakeCategory> listCategory = query.list();
		
		if(listCategory!= null && !listCategory.isEmpty()) {
			return listCategory.get(0);
			
		}
		return null;
	}
	
	
	@Transactional 
	public List<CakeCategory> list() {
		
		@SuppressWarnings("unchecked")
		List<CakeCategory> listCategory =(List<CakeCategory>)
		sessionFactory.getCurrentSession()
		.createCriteria(CakeCategory.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCategory;
	}
	
}
