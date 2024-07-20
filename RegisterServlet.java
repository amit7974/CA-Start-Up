package com.developeramit.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.developeramit.DAO.UserDAOImpl;
import com.developeramit.DBConnect.DBConnect;
import com.devloperamit.entity.User;
@WebServlet("/register")
public class RegisterServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
		//	System.out.println(name+" "+email+" "+phone+" "+password+"  "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			HttpSession session=req.getSession();
			
			if(check!=null) {
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				boolean f=dao.userRegister(us);
				
				if(f) {
					//System.out.println("user Register Success...");
					session.setAttribute("succMsg","Registration Successfully...");
					resp.sendRedirect("register.jsp");
					
				}	else {
					//System.out.println("something wrong on server....");
					session.setAttribute("failedMsg","Something wrong on server...");
                    resp.sendRedirect("register.jsp");	
				}	
					
			}else{			
			session.setAttribute("failedMsg","Please check Agree & Terms Condition");
			resp.sendRedirect("register.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
