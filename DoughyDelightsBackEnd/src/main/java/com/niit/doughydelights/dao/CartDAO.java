package com.niit.doughydelights.dao;

import java.util.List;

import com.niit.doughydelights.model.CakeCart;
import com.niit.doughydelights.model.CartItemList;
import com.niit.doughydelights.model.PurchasedItems;
import com.niit.doughydelights.model.UserCart;

public interface CartDAO {
	
	

	public void saveOrUpdate(CakeCart cakeCart);
	/*public void insertCart(UserCart userCart);*/
	
	public Long getTotalAmount(String loggedInUser);
	public Long getGrandTotalAmount(String loggedInUser);
	
	
	public void savePurchasedItems(PurchasedItems purchasedItems);
	public CartItemList getCartId(int cartItemId);
	public List<CartItemList> list(int cartId);
	public UserCart getByCartId(int id);
	public void saveCartItem(CartItemList cartItemList);
	public void saveUserCart(UserCart userCart);
	public Double getGrandTotal(int cartId);	
	public Double getTotal(int cartId);
/*	public List<CartItemList> getCartItemById(int id) ;*/
	public void delete(int id);
	public UserCart getCartByUser(String name);
}
