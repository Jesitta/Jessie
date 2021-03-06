package com.niit.doughydelights.model;


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
@Component("cakeSupplier")

public class CakeSupplier {
         @Id
         @GeneratedValue(strategy=GenerationType.AUTO)
		private int id;   
       	
         @Size(min=3,message="The field must be atleast 3 characters!")
		private String name;
		@Length(min =3,max=100, message = "The field must be between 3 and 100 characters long!")
		private String address;
		
		
		
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
