package com.niit.doughydelights.dao;

import java.util.List;



import com.niit.doughydelights.model.AddressDetails;


public interface AddressDAO {
	public void saveOrUpdate(AddressDetails addressDetails);
	public List<AddressDetails> list(String loggedInUser);

	

}
