package com.developeramit.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.devloperamit.entity.ServicesDtls;

public class ServicesDAOImpl implements ServicesDAO{
	private Connection conn;
	
	public ServicesDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addServices(ServicesDtls s) {
		boolean f=false;
			try {
	String sql="insert into service_dtls(servicesname,customer,price,servicesCategory,status,photo,email) values(?,?,?,?,?,?,?)";			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,s.getServicesName());
			ps.setString(2,s.getCustomer());
			ps.setString(3,s.getPrice());
			ps.setString(4,s.getServicesCategory());	
			ps.setString(5,s.getStatus());
			ps.setString(6,s.getPhotoName());
			ps.setString(7,s.getEmail());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return f;
		
	}
	public List<ServicesDtls>  getAllServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s = null;
		try {
			
			String sql="select * from service_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			
			{
				
			s=new ServicesDtls();
			s.setServicesId(rs.getInt(1));
			s.setServicesName(rs.getString(2));
			s.setCustomer(rs.getString(3));
			s.setPrice(rs.getString(4));
			s.setServicesCategory(rs.getString(5));
			s.setStatus(rs.getString(6));
			s.setPhotoName(rs.getString(7));
			s.setEmail(rs.getString(8));
			list.add(s);
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ServicesDtls getServiceById(int id) {
		ServicesDtls s=null;
		try {
			String sql = "select * from service_dtls where servicesId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
			}
	}	catch (Exception e) {
		e.printStackTrace();	
	}
	return s;
	}
	public boolean updateEditServices(ServicesDtls s) {
		boolean f=false;
		try {
			String sql="update service_dtls set servicesname=?,customer=?,price=?,status=? where servicesId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,s.getServicesName());
			ps.setString(2, s.getCustomer());
			ps.setString(3,s.getPrice());
			ps.setString(4,s.getStatus());
			ps.setInt(5,s.getServicesId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean updateEditServices(int id) {
		return false;
	}
	public boolean deleteServices(int id) {
		boolean f= false;
		try {
			String sql = "delete from service_dtls where ServicesId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public List<ServicesDtls> getNewServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s = null;
		try {
			
			String sql="select * from service_dtls  where servicesCategory=? and status=? order by servicesId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int  i =1;
			while(rs.next() && i<=4)  {
				s=new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ServicesDtls> getRecentServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s=null;
		try {
			String sql="select * from service_dtls  where status=?order  by servicesId Desc";			
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs= ps.executeQuery();
			int i =1;
			while(rs.next() && i <= 4)
			{
				s= new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
				i++;
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return list;
	
	
	}
	public List<ServicesDtls> getOldServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s = null;
		try {
			
			String sql="select * from service_dtls  where servicesCategory=? and status=? order by servicesId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int  i =1;
			while(rs.next() && i<=4)  {
				s=new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<ServicesDtls> getAllRecentServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s=null;
		try {
			String sql="select * from service_dtls  where status=?order  by servicesId Desc";			
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				s= new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return list;
		
	}
	public List<ServicesDtls> getAllNewServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s = null;
		try {
			String sql="select * from service_dtls  where servicesCategory=? and status=? order by servicesId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())  {
				s=new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ServicesDtls> getAllOldServices() {
		List<ServicesDtls> list=new ArrayList<ServicesDtls>();
		ServicesDtls s = null;
		try {
			
			String sql="select * from service_dtls  where servicesCategory=? and status=? order by servicesId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())  {
				s=new ServicesDtls();
				s.setServicesId(rs.getInt(1));
				s.setServicesName(rs.getString(2));
				s.setCustomer(rs.getString(3));
				s.setPrice(rs.getString(4));
				s.setServicesCategory(rs.getString(5));
				s.setStatus(rs.getString(6));
				s.setPhotoName(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
		
	
	
	}
	
	

	
	

	
	
	
	
	
	