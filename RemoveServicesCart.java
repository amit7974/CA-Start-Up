package com.developeramit.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.developeramit.DAO.CartDaoImpl;
import com.developeramit.DBConnect.DBConnect;

@WebServlet("/remove_services")
public class RemoveServicesCart  extends HttpServlet{
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
		boolean f=dao.deleteServices(bid);
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Services Removed from Cart");
			resp.sendRedirect("checkout.jsp");
			
		}else{
			session.setAttribute("failedMsg", "Somethings wrong on server");
			resp.sendRedirect("checkout.jsp");
		}
	}
	

}
