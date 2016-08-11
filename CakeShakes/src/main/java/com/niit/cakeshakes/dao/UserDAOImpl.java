package com.niit.cakeshakes.dao;


import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cakeshakes.model.UserTable;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	public UserDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory=sessionFactory;
	}	
	
	@Transactional
	public void saveOrUpdate(UserTable userTable) {
		userTable.setEnabled(true);
		userTable.setRole("user");
		sessionFactory.getCurrentSession().saveOrUpdate(userTable);
	}
	
	@Transactional
	public void delete(String id) {
		UserTable userToDelete = new UserTable();
		userToDelete.setUserid(id);
		sessionFactory.getCurrentSession().delete(userToDelete);
		
	}
	
	@Transactional
	public UserTable get(String id) {
		String hql="from UserTable where userid =" + "'" + id + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		
		List<UserTable> listUser = query.list();
		
		if(listUser!= null && !listUser.isEmpty()) {
			return listUser.get(0);
			
		}
		return null;
	}
	
	@Transactional
	public boolean isValidUser(String userid,String password) {
		String hql="from UserTable where userid ='" + userid + "'and "+"password ='"+ password+"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserTable> listUser = query.list();
		
		if(listUser!= null && !listUser.isEmpty()) {
			return true;
			
		}
		return false;
	}
	@Transactional
	public List<UserTable> list() {
		
		@SuppressWarnings("unchecked")
		List<UserTable> listUser =(List<UserTable>) sessionFactory.getCurrentSession().createCriteria(UserTable.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
}
