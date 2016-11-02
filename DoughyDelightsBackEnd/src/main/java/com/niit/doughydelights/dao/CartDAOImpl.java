package com.niit.doughydelights.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CakeCategory;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	public SessionFactory sessionFactory;

	public CartDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void saveOrUpdate(CakeCart cakeCart) {
		sessionFactory.getCurrentSession().saveOrUpdate(cakeCart);
	}

	@Transactional
	public void delete(int id) {
		CakeCart cartToDelete = new CakeCart();
		cartToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(cartToDelete);

	}

	@Transactional
	public CakeCart get(int id) {
		String hql = "from CakeCart where id  =" + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<CakeCart> listCart = query.list();

		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);

		}
		return null;
	}

	/*
	 * @Transactional public List<CakeCart> list() {
	 * 
	 * @SuppressWarnings("unchecked") List<CakeCart> listCart =(List<CakeCart>)
	 * sessionFactory.getCurrentSession() .createCriteria(CakeCart.class)
	 * .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list(); return
	 * listCart; }
	 */

	@Transactional
	public List<CakeCart> list(String loggedInUser) {
		String hql = "from CakeCart where username  =" + "'" + loggedInUser + "'and status =" + "'N'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<CakeCart> listCart = query.list();

		return listCart;

	}

	@Transactional
	public Long getTotalAmount(String loggedInUser) {
		String hql = "select sum(total)from CakeCart where username  =" + "'" + loggedInUser + "'and status =" + "'N'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}

	@Transactional
	public Long getGrandTotalAmount(String loggedInUser) {

		String hql = "select sum(total)from CakeCart where username  =" + "'" + loggedInUser + "'and status =" + "'N'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Long sum = (Long) query.uniqueResult();
		return sum;
	}

}
