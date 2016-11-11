package com.niit.doughydelights.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
public class AddressDetails {

	@Id
	@GeneratedValue

	private int addressId;
	@Size(min = 1, message = "This field shold not be empty")
	private String doornumber;
	@Size(min = 1, message = "This field shold not be empty")
	private String streetname;
	@Size(min = 1, message = "This field shold not be empty")
	private String locality;
	@Size(min = 1, message = "This field shold not be empty")
	private String city;
	@Size(min = 1, message = "This field shold not be empty")
	private String state;
	@Size(min = 1, message = "This field shold not be empty")
	private String country;
	@Size(min = 1, message = "This field shold not be empty")
	private String pincode;
	@Size(min = 10, message = "Enter the correct number")
	private String mobilenumber;
	@OneToOne

	private CakeUser user;

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getDoornumber() {
		return doornumber;
	}

	public void setDoornumber(String doornumber) {
		this.doornumber = doornumber;
	}

	public String getStreetname() {
		return streetname;
	}

	public void setStreetname(String streetname) {
		this.streetname = streetname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public CakeUser getUser() {
		return user;
	}

	public void setUser(CakeUser user) {
		this.user = user;
	}

}
