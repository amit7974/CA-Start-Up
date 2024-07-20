<%@page import="java.util.List"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	Admin:All Services</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h3 class="text-center">Hello Admin</h3>
<c:if test="${not empty succMsg }">
<h1 class="text-center text-success">${succMsg }</h1>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg }
<c:remove var="failedMsg" scope="session"/>
</c:if>


<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
       <th scope="col">Image</th>
      <th scope="col">Services Name</th>
      <th scope="col">Customer</th>
      <th scope="col">Price</th>
       <th scope="col">Categories</th>
        <th scope="col">Status</th>
         <th scope="col">Action</th> 
    </tr>
  </thead>
  <tbody>
  <%
  ServicesDAOImpl dao = new ServicesDAOImpl(DBConnect.getConn());
  List<ServicesDtls> list = dao.getAllServices();
  for(ServicesDtls s: list){
	 %>
    <tr>
      <td><%=s.getServicesId() %></td>
      <td><img src="../cards/<%=s.getPhotoName()%>"
      style="width: 50px; height:50Px;"></td>
      <td><%=s.getServicesName()%></td>
      <td><%=s.getCustomer()%></td>
       <td><%=s.getPrice()%></td>
       <td><%=s.getServicesCategory()%></td>
      <td><%=s.getStatus()%></td>
       <td>
      <a href="edit_services.jsp?id=<%=s.getServicesId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
      <a href="../delete?id=<%=s.getServicesId() %>" class="btn btn-sm btn-danger">Delete</a>
     </tr>
     
 <%
      
  }
     
      %>
  </tbody>
</table>
<div>

<div style="margin-top:300px;"></div>
<%@include file="footer.jsp" %>
</div>

</body>
</html>