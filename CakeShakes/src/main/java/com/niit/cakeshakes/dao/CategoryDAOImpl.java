package com.niit.cakeshakes.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.CategoryTable;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public CategoryDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(CategoryTable categoryTable) {
		sessionFactory.getCurrentSession().saveOrUpdate(categoryTable);
	}
	@Transactional
	public  void save(CategoryTable categoryTable) {
	
	sessionFactory.getCurrentSession().save(categoryTable);
	}
	
	@Transactional
	public void update(CategoryTable categoryTable) {
	
		sessionFactory.getCurrentSession().update(categoryTable);
		}

	
	@Transactional
	public void delete(int id) {
		CategoryTable categoryToDelete = new CategoryTable();
		categoryToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(categoryToDelete);
		
	}
	
	@Transactional
	public CategoryTable get(int id) {
		String hql="from CategoryTable where id  =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<CategoryTable> listCategory = query.list();
		
		if(listCategory!= null && !listCategory.isEmpty()) {
			return listCategory.get(0);
			
		}
		return null;
	}
	
	
	@Transactional 
	public List<CategoryTable> list() {
		
		@SuppressWarnings("unchecked")
		List<CategoryTable> listCategory =(List<CategoryTable>)
		sessionFactory.getCurrentSession()
		.createCriteria(CategoryTable.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCategory;
	}
	
}
