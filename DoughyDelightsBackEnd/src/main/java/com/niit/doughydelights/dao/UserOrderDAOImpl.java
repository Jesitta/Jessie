package com.niit.doughydelights.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeUser;
import com.niit.doughydelights.model.UserOrder;

@Repository("userorderDAO")
public class UserOrderDAOImpl implements UserOrderDAO {
	@Autowired
	public SessionFactory sessionFactory;
	
	public UserOrderDAOImpl(SessionFactory sessionFactory) {
	
		this.sessionFactory=sessionFactory;
	}

@Transactional
public void saveOrUpdate(UserOrder userOrder) {
	sessionFactory.getCurrentSession().saveOrUpdate(userOrder);
}




@Transactional
public UserOrder get(int id) {
	String hql="from UserOrder where id  =" + "'" + id + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	List<UserOrder> listCart = query.list();
	
	if(listCart!= null && !listCart.isEmpty()) {
		return listCart.get(0);
		
	}
	return null;
}


@Transactional 
public List<UserOrder> list() {
	
	@SuppressWarnings("unchecked")
	List<UserOrder> listCart =(List<UserOrder>)
	sessionFactory.getCurrentSession()
	.createCriteria(UserOrder.class)
	.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	return listCart;
}

@Transactional
public List<UserOrder> list(String loggedInUser) {
	String hql="from UserOrder where username  =" + "'" + loggedInUser + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	List<UserOrder> listOrder = query.list();
	
	
		return listOrder;
		
}
}


