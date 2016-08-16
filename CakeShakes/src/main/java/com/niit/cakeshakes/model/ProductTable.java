package com.niit.cakeshakes.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;






@Entity
@Table
@Component("productTable")
public class ProductTable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id; 
	
	
@Size(min=3,message="The field must be atleast 3 characters!")	
	private String name;
	@Length(min =3,max=30, message = "The field must be between 3 and 30 characters long!")
	private String description;
	
	@Range(min=100,max=1000,message="Price should not be less than 100!")
private int price;
@Transient	
private MultipartFile image;
/*@ManyToOne
@JoinColumn(name="CATEGORY_ID")
private CategoryTable category;

public CategoryTable getCategory() {
	return category;
}
public void setCategory(CategoryTable category) {
	this.category = category;
}*/
/*@ManyToOne
@JoinColumn(name="SUPPLIER_ID")
private SupplierTable supplier;
public SupplierTable getSupplier() {
	return supplier;
}
public void setSupplier(SupplierTable supplier) {
	this.supplier = supplier;
}*/

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
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public MultipartFile getImage() {
	return image;
}
public void setImage(MultipartFile image) {
	this.image = image;
}



	
	
}



