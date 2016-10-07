package com.niit.doughydelights.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


import org.springframework.stereotype.Component;

@Entity
@Table
@Component
public class UserOrder {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
  @OneToOne
	private CakeUser user;
 
	private Long grandtotal;
	public Long getGrandtotal() {
		return grandtotal;
	}
	public void setGrandtotal(Long grandtotal) {
		this.grandtotal = grandtotal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public CakeUser getUser() {
		return user;
	}
	public void setUser(CakeUser user) {
		this.user = user;
	}
	
	
	
	
	
}
