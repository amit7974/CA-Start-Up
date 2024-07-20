package com.developeramit.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.developeramit.DAO.ServicesDAOImpl;
import com.developeramit.DBConnect.DBConnect;
import com.devloperamit.entity.ServicesDtls;

@WebServlet("/add_services")
@MultipartConfig
public class ServicesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String servicesName = req.getParameter("sname");
			String customer = req.getParameter("customer");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			ServicesDtls s = new ServicesDtls(servicesName, customer, price, categories, status, fileName, "admin");

			ServicesDAOImpl dao = new ServicesDAOImpl(DBConnect.getConn());

			boolean f = dao.addServices(s);
			HttpSession session = req.getSession();

			if (f) {
				String path = getServletContext().getRealPath("") + "services";
				File file = new File(path);
				part .write(path + 	File.separator + fileName);
				
				session.setAttribute("succMsg", "Services Add Successfully");
				resp.sendRedirect("admin/add_services.jsp");

			} else {

				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/add_services.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}
