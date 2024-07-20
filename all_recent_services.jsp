<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Services</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
<div class="row p-3">
<%
ServicesDAOImpl dao2=new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list2=dao2.getAllRecentServices();
for(ServicesDtls s:list2){%>
<div class="col-md-2">	
<div class="card crd-ho mt-2">
<div class="card-body text-center">
<img alt="" src="cards/<%=s.getPhotoName()%>"style="width: 150px; height: 200px" class="img-thumblin">
<p><%=s.getServicesName() %>
<p><%=s.getCustomer() %></p>
<p>
<%
if(s.getServicesCategory().equals("old")){
%>
Categories:<%=s.getServicesCategory()%></p>
<div class="row">
Categories:<%=s.getServicesCategory() %></p>
<a href="" class="btn btn-success btn-sm ml-2">Add Cart<i class="fa-solid fa-cart-plus"></i> </a>
<a href="" class="btn btn-success btn-sm ml-2">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<%
}else{
	%>
Categories:<%=s.getServicesCategory()%></p>
<div class="row">
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %></a>
</div>
<%
}
%>
</div>
</div>
</div>
</div>
</div>
<%
}
%>
<div class="text-center mt-1">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</body>
</html>