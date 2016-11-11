package com.niit.doughydelights.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table
@Component

public class CakeUser implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id

	private String username;
	
	private String password;
		
	private String name;
	private String role;

	
	private String mobilenumber;
	private String email;
	
	@OneToOne
    @JoinColumn(name = "addressId")
    private AddressDetails address;


	@OneToOne
    @JoinColumn(name = "cartId")    
    private UserCart userCart; 
    
	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

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



	public UserCart getUserCart() {
		return userCart;
	}

	public void setUserCart(UserCart userCart) {
		this.userCart = userCart;
	}

	public AddressDetails getAddress() {
		return address;
	}

	public void setAddress(AddressDetails address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "CakeUser [username=" + username + ", password=" + password + ", name=" + name + ", role=" + role
				+ ", mobilenumber=" + mobilenumber + ", email=" + email + ", address=" + address + ", userCart="
				+ userCart + ", enabled=" + enabled + "]";
	}

	

	
	
	
}
