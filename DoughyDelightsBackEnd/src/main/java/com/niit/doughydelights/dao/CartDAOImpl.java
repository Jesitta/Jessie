package com.niit.doughydelights.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CartItemList;
import com.niit.doughydelights.model.PurchasedItems;
import com.niit.doughydelights.model.UserCart;

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

	/*@Transactional
	public void insertCart(UserCart userCart) {
		sessionFactory.getCurrentSession().saveOrUpdate(userCart);
	}*/
	@Transactional
	public void savePurchasedItems(PurchasedItems purchasedItems) {
		sessionFactory.getCurrentSession().saveOrUpdate(purchasedItems);
	}
	@Transactional
	public List<CartItemList> list(int cartId) {
		String hql = "from CartItemList where cartId  =" + "'" + cartId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<CartItemList> listCart = query.list();

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

	@Transactional
	public CartItemList getCartId(int cartItemId) {
		String hql = "from CartItemList where cartItemId  =" + "'" + cartItemId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<CartItemList> listCart = query.list();

		if (listCart != null && !listCart.isEmpty()) {
			return listCart.get(0);

		}
		return null;
	}

	@Transactional
	public UserCart getByCartId(int id) {
		String hql = "from UserCart where cartId  =" + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<UserCart> listProduct = query.list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);

		}
		return null;
	}
	@Transactional
	public UserCart getCartByUser(String name) {
		String hql = "from UserCart where username  =" + "'" + name + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<UserCart> listProduct = query.list();

		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);

		}
		return null;
	}

	@Transactional
	public void saveCartItem(CartItemList cartItemList) {
		sessionFactory.getCurrentSession().saveOrUpdate(cartItemList);
	}

	@Transactional
	public void saveUserCart(UserCart userCart) {
		sessionFactory.getCurrentSession().saveOrUpdate(userCart);
	}

	@Transactional
	public Double getGrandTotal(int cartId) {
		String hql = "select sum(totalPrice)from CartItemList where userCart  =" + "'" + cartId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Double totalprice = (Double) query.uniqueResult();
		return totalprice;
	}

	@Transactional
	public Double getTotal(int cartId) {
		String hql = "select grandTotal from UserCart where cartId  =" + "'" + cartId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		Double totalamount = (Double) query.uniqueResult();
		return totalamount;
	}

	/*@Transactional
	public List<CartItemList> getCartItemById(int id) {
		String hql = "from CartItemList where CartId=" + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<CartItemList> list = (List<CartItemList>) query.list();

		if (list != null && !list.isEmpty()) {

			return list;
		}

		return null;
	}*/

	@Transactional
	public void delete(int id) {
		CartItemList cartToDelete = new CartItemList();
		cartToDelete.setCartItemId(id);
		sessionFactory.getCurrentSession().delete(cartToDelete);

	}

}
