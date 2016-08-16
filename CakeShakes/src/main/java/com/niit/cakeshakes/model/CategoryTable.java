package com.niit.cakeshakes.model;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
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
	
	@Size(min=3,message="The field must be atleast 3 characters!")	
	private String name;
	@Length(min =3,max=30, message = "The field must be between 3 and 30 characters long!")
	private String description;
/*	private Set<ProductTable> product;*/

/*
@OneToMany(mappedBy="category",fetch=FetchType.EAGER)
public Set<ProductTable> getProduct() {
	return product;
}
public void setProduct(Set<ProductTable> product) {
	this.product = product;
}*/

public String getName() {
		return name;
	}

public int getId() {
	return id;
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




