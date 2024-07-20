package com.developeramit.DAO;

import java.util.List;

import com.devloperamit.entity.Cart;
import com.devloperamit.entity.ServicesDtls;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getServicesByUser(int userId);
	
	public boolean deleteServices(int bid);

}


