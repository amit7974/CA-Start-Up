package com.developeramit.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.developeramit.DAO.ServicesDAOImpl;
import com.developeramit.DBConnect.DBConnect;
import com.devloperamit.entity.ServicesDtls;

@WebServlet("/editservices")
public class EditServicesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	try {
		int id=Integer.parseInt(req.getParameter("id"));
		String servicesName = req.getParameter("sname");
		String customer = req.getParameter("customer");
		String price = req.getParameter("price");
		String status = req.getParameter("status");
		
		ServicesDtls s = new ServicesDtls();
		s.setServicesId(id);
		s.setServicesName(servicesName);
		s.setCustomer(customer);
		s.setPrice(price);
		s.setStatus(status);
		ServicesDAOImpl dao=new ServicesDAOImpl(DBConnect.getConn());
		boolean f=dao.updateEditServices(s);
		
		HttpSession session=req.getSession();
		if(f)
		{
			session.setAttribute("succMsg","Services update Successfully...");
			resp.sendRedirect("admin/all_services.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server...");
			resp.sendRedirect("admin/all_services.jsp");
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	
	

}
