package com.niit.doughydelights.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeOrder;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	public SessionFactory sessionFactory;
	
	public OrderDAOImpl(SessionFactory sessionFactory) {
	
		this.sessionFactory=sessionFactory;
	}

@Transactional
public void saveOrUpdate(CakeOrder cakeOrder) {
	sessionFactory.getCurrentSession().saveOrUpdate(cakeOrder);
}

@Transactional
public void delete(int id) {
	CakeOrder cartToDelete = new CakeOrder();
	cartToDelete.setOrderid(id);
	sessionFactory.getCurrentSession().delete(cartToDelete);
	
}


@Transactional
public CakeOrder get(int id) {
	String hql="from CakeOrder where id  =" + "'" + id + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	List<CakeOrder> listCart = query.list();
	
	if(listCart!= null && !listCart.isEmpty()) {
		return listCart.get(0);
		
	}
	return null;
}


@Transactional 
public List<CakeOrder> list() {
	
	@SuppressWarnings("unchecked")
	List<CakeOrder> listCart =(List<CakeOrder>)
	sessionFactory.getCurrentSession()
	.createCriteria(CakeOrder.class)
	.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	return listCart;
}

@Transactional
public List<CakeOrder> list(String loggedInUser) {
	String hql="from CakeOrder where username  =" + "'" + loggedInUser + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	List<CakeOrder> listOrder = query.list();
	
	
		return listOrder;
		
}
}


