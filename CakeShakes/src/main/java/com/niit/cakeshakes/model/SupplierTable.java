package com.niit.cakeshakes.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

@Entity
@Table
@Component

public class SupplierTable {
         @Id
         @GeneratedValue(strategy=GenerationType.AUTO)
		private int id;   
         @Size(min=3,message="The field must be atleast 3 characters!")
		private String name;
		@Length(min =3,max=100, message = "The field must be between 3 and 100 characters long!")
		private String address;
		/*	private Set<ProductTable> product;*/

		/*
		@OneToMany(mappedBy="supplier",fetch=FetchType.EAGER)
		public Set<ProductTable> getProduct() {
			return product;
		}
		public void setProduct(Set<ProductTable> product) {
			this.product = product;
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
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		
		
		
		
		
}
