package com.niit.doughydelights.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Table(name="UserCart")
@Entity
@Component
public class UserCart {


    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int cartId;   

    @OneToOne 
    @JoinColumn(name = "username")
    private CakeUser cakeUser;    
   
    private double grandTotal;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public CakeUser getCakeUser() {
		return cakeUser;
	}

	public void setCakeUser(CakeUser cakeUser) {
		this.cakeUser = cakeUser;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
    
    

}
