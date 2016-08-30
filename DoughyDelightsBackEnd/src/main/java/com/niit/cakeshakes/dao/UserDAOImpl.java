package com.niit.cakeshakes.dao;


import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.CakeUser;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public UserDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(CakeUser cakeUser) {
		cakeUser.setEnabled(true);
		cakeUser.setRole("ROLE_USER");
		sessionFactory.getCurrentSession().saveOrUpdate(cakeUser);
	}
	
	@Transactional
	public void delete(String id) {
		CakeUser userToDelete = new CakeUser();
		userToDelete.setUsername(id);
		sessionFactory.getCurrentSession().delete(userToDelete);
		
	}
	
	@Transactional
	public CakeUser get(String id) {
		String hql="from CakeUser where username =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<CakeUser> listUser = query.list();
		
		if(listUser!= null && !listUser.isEmpty()) {
			return listUser.get(0);
			
		}
		return null;
	}
	
	@Transactional
	public boolean isValidUser(String username,String password) {
		String hql="from CakeUser where username ='" + username + "'and "+"password ='"+ password+"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CakeUser> listUser = query.list();
		
		if(listUser!= null && !listUser.isEmpty()) {
			return true;
			
		}
		return false;
	}
	@Transactional
	public List<CakeUser> list() {
		
		@SuppressWarnings("unchecked")
		List<CakeUser> listUser =(List<CakeUser>) sessionFactory.getCurrentSession().createCriteria(CakeUser.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}

	
	
}
