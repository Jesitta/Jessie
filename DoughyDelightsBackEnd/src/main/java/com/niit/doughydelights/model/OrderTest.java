package com.niit.doughydelights.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;

@Entity
@Component
public class OrderTest {
	@Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
private int id;
@OneToMany(cascade=CascadeType.ALL)
private List<CakeCart> cart;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public List<CakeCart> getCart() {
	return cart;
}
public void setCart(List<CakeCart> cart) {
	this.cart = cart;
}


}
