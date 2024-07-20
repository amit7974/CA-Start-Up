package com.developeramit.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devloperamit.entity.Cart;
import com.devloperamit.entity.ServicesDtls;

public class CartDaoImpl implements CartDao {

	private Connection conn;
	public  CartDaoImpl(Connection conn) {
		
		this.conn=conn;
		
		
	}
		public boolean addCart(Cart c) {
			boolean f=false;
try {
	
	String sql="insert into cart(bid,uid,servicesName,customer,price,total_price) values(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, c.getBid());
	ps.setInt(2, c.getUserId());
	ps.setString(3, c.servicesName);
	ps.setString(4, c.getCustomer());
	ps.setDouble(5,c.getPrice());
	ps.setDouble(6, c.getTotalPrice());
	
	int i=ps.executeUpdate();
	if(i==1) {
		f=true;
	}
	
} catch (Exception e) {
	e.printStackTrace();
}

		return f;
	}
		public List<Cart> getServicesByUser(int userId) {
			List<Cart> list=new ArrayList<Cart>();
			Cart c=null;
		    double totalPrice=0;
			try {
				
				String sql="select * from cart where uid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, userId);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					c=new Cart();
					c.setCid(rs.getInt(1));
					c.setBid(rs.getInt(2));
					c.setUserId(rs.getInt(3));
					c.setServicesName(rs.getString(4));
					c.setCustomer(rs.getString(5));
					c.setPrice(rs.getDouble(6));;
					
					totalPrice=totalPrice+rs.getDouble(7);
					c.setTotalPrice(totalPrice);
					
					list.add(c);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		public boolean deleteServices(int bid) {
			boolean f=false;
			
			try {
				String sql="delete from cart where bid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
                 ps.setInt(1, bid);

                 
                 int i =ps.executeUpdate();
                 if(i==1) {
                	 
                	 f=true;
                 }

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
			return f;
		}
		
		
		

		
		
		
}
