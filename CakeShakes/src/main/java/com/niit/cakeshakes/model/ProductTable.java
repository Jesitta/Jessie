package com.niit.cakeshakes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table
@Component("productTable")
public class ProductTable {
	
	@Id
	@Column(name="id")
	private String id; //primarykey
	
	@Column(name="name")
	private String name;
	private String description;
	private int price;
	
	

	
	
	
	
	

	public String getId() {
		return id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	




	
	
}




