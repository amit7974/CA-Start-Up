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
<title>All New Services</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
<div class="row p-3">
<%
ServicesDAOImpl dao = new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list =dao.getAllOldServices();
for(ServicesDtls s: list){
	%>
<div class="col-md-3">
<div class="card crd-ho mt-2">
<div class="card-body text-center">
<img alt="" src="cards/<%=s.getPhotoName() %>"style="width: 85px; height: 150px" class="img-thumblin">
<p><%=s.getServicesName() %></p>
<p><%=s.getCustomer() %></p>
<p>Categories<%=s.getServicesCategory() %></p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-2">Purchase</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
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