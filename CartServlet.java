package com.developeramit.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.developeramit.DAO.CartDaoImpl;
import com.developeramit.DAO.ServicesDAOImpl;
import com.developeramit.DBConnect.DBConnect;
import com.devloperamit.entity.Cart;
import com.devloperamit.entity.ServicesDtls;

@WebServlet("/cart")
public class CartServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			ServicesDAOImpl dao=new ServicesDAOImpl(DBConnect.getConn());
			ServicesDtls s=dao.getServiceById(bid);
			
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setServicesName(s.getServicesName());
			c.setCustomer(s.getCustomer());
			c.setPrice(Double.parseDouble(s.getPrice()));
			c.setTotalPrice(Double.parseDouble(s.getPrice()));
			
			CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			
			if(f) {
				
				session.setAttribute("addCart","Services Added to  cart");
				resp.sendRedirect("all_new_services.jsp");
			}else {
					
				session.setAttribute("failed","Somethings Wrong on Server");
				resp.sendRedirect("all_new_services.jsp");

				}
				
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
			}
	

}
