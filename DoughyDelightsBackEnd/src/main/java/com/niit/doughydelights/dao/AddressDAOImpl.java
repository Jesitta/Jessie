package com.niit.doughydelights.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.AddressDetails;

@Repository("addressDAO")
public class AddressDAOImpl implements AddressDAO {

	@Autowired
	public SessionFactory sessionFactory;
	
	public  AddressDAOImpl(SessionFactory sessionFactory) {
	
		this.sessionFactory=sessionFactory;
	}

@Transactional
public void saveOrUpdate(AddressDetails addressDetails) {
	sessionFactory.getCurrentSession().saveOrUpdate(addressDetails);
}
@Transactional
public List<AddressDetails> list(String loggedInUser) {
	String hql="from AddressDetails where username  =" + "'" + loggedInUser + "'";
	Query query=sessionFactory.getCurrentSession().createQuery(hql);
	
	List<AddressDetails> list = query.list();
	
	
		return list;
		
}

}
