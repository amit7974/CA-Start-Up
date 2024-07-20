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

@WebServlet("/delete")
public class ServicesDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int  id=Integer.parseInt(req.getParameter("id"));
			
			ServicesDAOImpl dao=new ServicesDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteServices(id);
			
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg","Services Delete Successfully...");
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
