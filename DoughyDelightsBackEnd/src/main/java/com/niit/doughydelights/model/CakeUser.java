package com.niit.doughydelights.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

@Entity
@Table
@Component

public class CakeUser implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Length(min =10,max=100, message = "The field must be between 10 and 100 characters long!")
	private String address;
	@Size(min=10,max=10,message="The field must contain ten digits!")	
	private String mobilenumber;

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	@Id
	@Size(min=3,message="The field must be atleast 3 characters!")	
	private String username;
	@Size(min=5,message="The field must be atleast 5 characters!")	
	private String password;
	@Size(min=3,message="The field must be atleast 3 characters!")	
	private String name;
	private String role;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	private boolean enabled;

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
