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
@Component("cakeOrder")
public class CakeOrder {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int orderid;
private String productname;
private String username;
private String address;
private String mobilenumber;
private int Total;

public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getMobilenumber() {
	return mobilenumber;
}
public void setMobilenumber(String mobilenumber) {
	this.mobilenumber = mobilenumber;
}


public String getProductname() {
	return productname;
}
public void setProductname(String productname) {
	this.productname = productname;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getTotal() {
	return Total;
}
public void setTotal(int total) {
	Total = total;
}
public int getOrderid() {
	return orderid;
}
public void setOrderid(int orderid) {
	this.orderid = orderid;
}

}
