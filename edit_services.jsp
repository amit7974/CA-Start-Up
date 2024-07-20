<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin :Add Services</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Edit Services</h4>
<%
int id=Integer.parseInt(request.getParameter("id"));
ServicesDAOImpl dao=new ServicesDAOImpl(DBConnect.getConn());
ServicesDtls s = dao.getServiceById(id);

%>
<form action="../editservices" method="post">
<input type="hidden" name="id" value="<%=s.getServicesId() %>">
  <div class="form-group">
    <label for="exampleInputEmail1">Services Name</label>
    <input name="sname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=s.getServicesName() %>" >
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Customer</label>
    <input name="customer" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=s.getCustomer() %>">
  </div>
  
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Price</label>
    <input name="price" class="form-control" value="<%=s.getPrice() %>">
  </div>
  
  
  <div class="form-group">
    <label for="inputState">Services Status</label>
    <select id="inputState" name="status"  class="form-control">
    
    
    <% if("Active".equals(s.getStatus())){%>
    
    <option value="Inactive">inactive</option>	
    <option value="Active">Active</option>
<% 
    }else{
    	%>
<% 
    }
    %>
    </select>
  </div>
  
    <button type="submit" class="btn btn-primary">Update</button>
</form>

</div>
</div>
</div>
</div>
</div>
<div>

<div style="margin-top:300px;"></div>
<%@include file="footer.jsp" %>
</div>

</body>
</html>