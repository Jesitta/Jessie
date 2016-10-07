package com.niit.doughydelights.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Entity
@Table
@Component("cakeOrder")
public class CakeOrder {
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	
	private int orderid;
	
	@OneToOne
	private CakeUser user;
	@OneToOne
	private CakeCart cart;
	

	private String date;
	
	
	private String time;
	
	@OneToOne
	private AddressDetails address;
	
	
	public AddressDetails getAddress() {
		return address;
	}
	public void setAddress(AddressDetails address) {
		this.address = address;
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
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public CakeUser getUser() {
		return user;
	}
	public void setUser(CakeUser user) {
		this.user = user;
	}
	public CakeCart getCart() {
		return cart;
	}
	public void setCart(CakeCart cart) {
		this.cart = cart;
	}
	
	
	
	
}