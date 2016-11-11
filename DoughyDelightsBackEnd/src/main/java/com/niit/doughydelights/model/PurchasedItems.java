package com.niit.doughydelights.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

@Entity
@Component
public class PurchasedItems {
	@Id
    private int purchaseItemId;

    @ManyToOne
    @JoinColumn(name = "cartId")
    private UserCart user;

    @ManyToOne
    @JoinColumn(name = "productId")
    private CakeProduct product;
    
    private String date;
    
    private String time;

    private int quantity;
    
    private double totalPrice;
    
    private int orderId;

	public int getPurchaseItemId() {
		return purchaseItemId;
	}

	public void setPurchaseItemId(int purchaseItemId) {
		this.purchaseItemId = purchaseItemId;
	}

	public UserCart getUser() {
		return user;
	}

	public void setUser(UserCart user) {
		this.user = user;
	}

	public CakeProduct getProduct() {
		return product;
	}

	public void setProduct(CakeProduct product) {
		this.product = product;
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

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
    
}
