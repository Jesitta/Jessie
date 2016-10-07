package com.niit.doughydelights.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeOrder;
import com.niit.doughydelights.model.CakeSupplier;
import com.niit.doughydelights.model.OrderTest;

@Repository("testorderDAO")
public class TestDAOImpl implements TestDAO {
	@Autowired
	public SessionFactory sessionFactory;
	
	public TestDAOImpl(SessionFactory sessionFactory) {
	
		this.sessionFactory=sessionFactory;
	}

@Transactional
public void saveOrUpdate(OrderTest ordertest) {
	sessionFactory.getCurrentSession().saveOrUpdate(ordertest);
}
}
