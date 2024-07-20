package com.developeramit.DAO;

import java.util.List;

import com.devloperamit.entity.ServicesDtls;

public interface ServicesDAO {

	public  boolean addServices(ServicesDtls s);
	
	public List<ServicesDtls>  getAllServices();
	
	public ServicesDtls getServiceById(int id);
	
public boolean updateEditServices(int id);

public boolean updateEditServices(ServicesDtls s);
public boolean deleteServices(int id);

public List<ServicesDtls> getNewServices();

public List<ServicesDtls> getRecentServices();

public List<ServicesDtls> getOldServices();

public List<ServicesDtls> getAllRecentServices();

public List<ServicesDtls> getAllNewServices();

public List<ServicesDtls> getAllOldServices();


}
