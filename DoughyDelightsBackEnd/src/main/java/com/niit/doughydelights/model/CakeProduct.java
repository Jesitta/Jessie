package com.niit.doughydelights.model;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table
@Component("cakeProduct")
public class CakeProduct {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id; 
	
	@Column(unique=true)	
@Size(min=3,message="The field must be atleast 3 characters!")	
	private String name;
	@Length(min =3,max=30, message = "The field must be between 3 and 30 characters long!")
	private String description;
@NotNull(message="Price cannot be null")	
@Range(min=100,max=10000,message="Price should not be less than 100!")
private Integer price;

@Transient	
private MultipartFile image;


@ManyToOne(cascade=CascadeType.ALL)
@JoinColumn(name="cat_id")
private CakeCategory cat;

@ManyToOne (cascade=CascadeType.ALL)
@JoinColumn(name="sup_id")
private CakeSupplier sup;


public CakeCategory getCat() {
	return cat;
}
public void setCat(CakeCategory cat) {
	this.cat = cat;
}
public CakeSupplier getSup() {
	return sup;
}
public void setSup(CakeSupplier sup) {
	this.sup = sup;
}

public int getId() {
	return id;
}
public void setId(int id) {
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

public Integer getPrice() {
	return price;
}
public void setPrice(Integer price) {
	this.price = price;
}
public MultipartFile getImage() {
	return image;
}
public void setImage(MultipartFile image) {
	this.image = image;
}




	
	
}



