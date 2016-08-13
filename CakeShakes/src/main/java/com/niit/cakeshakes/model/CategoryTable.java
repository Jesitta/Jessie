package com.niit.cakeshakes.model;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;
import org.springframework.stereotype.Component;

import com.sun.istack.internal.NotNull;


@Entity
@Table
@Component("categoryTable")
public class CategoryTable {
	
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	private int id; 
	
	public void setId(int id) {
		this.id = id; 
	}
	
	private String name;
	private String description;
/*	private Set<ProductTable> product;*/
	

public String getName() {
		return name;
	}

public int getId() {
	return id;
}



/*
@OneToMany(mappedBy="categoryTable",fetch=FetchType.EAGER)
public Set<ProductTable> getProduct() {
	return product;
}
public void setProduct(Set<ProductTable> product) {
	this.product = product;
}*/
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




