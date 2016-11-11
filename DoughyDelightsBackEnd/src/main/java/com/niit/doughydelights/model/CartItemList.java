package com.niit.doughydelights.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

@Entity
@Component
public class CartItemList {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cartItemId;

	@ManyToOne
	@JoinColumn(name = "cartId")
	private UserCart userCart;

	@ManyToOne
	@JoinColumn(name = "productId")
	private CakeProduct products;

	private String date;
	private String username;
	private String time;

	private int quantity;
	private double price;
	private double totalPrice;

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public UserCart getUserCart() {
		return userCart;
	}

	public void setUserCart(UserCart userCart) {
		this.userCart = userCart;
	}

	public CakeProduct getProducts() {
		return products;
	}

	public void setProducts(CakeProduct products) {
		this.products = products;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
