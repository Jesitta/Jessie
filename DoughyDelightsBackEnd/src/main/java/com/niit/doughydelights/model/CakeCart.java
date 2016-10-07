package com.niit.doughydelights.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Table
@Entity
@Component("cakeCart")
public class CakeCart {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private Long TotalAmount;
	private int quantity;

	private int total;
	

	@Column(name = "PRODUCT_NAME")

	private String productname;
	@Column(name = "USER_NAME")
	private String username;
	@OneToOne
	private CakeProduct product;
	private char status;


	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public CakeProduct getProduct() {
		return product;
	}

	public void setProduct(CakeProduct product) {
		this.product = product;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	private Integer price;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Long getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		TotalAmount = totalAmount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
