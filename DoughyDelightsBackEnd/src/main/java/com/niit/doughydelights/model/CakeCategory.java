package com.niit.doughydelights.model;



import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;



 

@Entity
@Table
@Component("cakeCategory")
public class CakeCategory {
	
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	private int id; 
	
	public void setId(int id) {
		this.id = id; 
	}
	
	
	@Size(min=3,message="The field must be atleast 3 characters!")	
	@Column(unique=true)
	private String name;
	@Length(min =3,max=30, message = "The field must be between 3 and 30 characters long!")
	private String description;
	
/*
@OneToMany(mappedBy="cat",fetch=FetchType.EAGER)	
private Set<CakeProduct> product;



public Set<CakeProduct> getProduct() {
		return product;
	}

	public void setProduct(Set<CakeProduct> product) {
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




