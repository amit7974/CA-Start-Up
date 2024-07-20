<%@page import="com.devloperamit.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAStartUp</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img{
background: url("img/ca.jpg");
height:60vh;
width: 100%;
background-size: cover;
background-repeat: no-repeat;
}
.crd-ho:hover{
background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
<% 
User u=(User)session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid back-img">
<h2 class="text-center text-danger"><b>Apply Provident Fund Registration Online</b></h2>
</div>
<!--  RecentServices -->
<div class="container"style="background-color: #f7f7f7;">
<h3 class="text-center">Recent Services</h3>
<div class="row p-3">
<%
ServicesDAOImpl dao2=new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list2=dao2.getRecentServices();
for(ServicesDtls s:list2){%>
<div class="col-md-2">	
<div class="card crd-ho mt-2">
<div class="card-body text-center">
<img alt="" src="cards/<%=s.getPhotoName()%>"style="width: 160px; height: 150px" class="img-thumblin">
<p><%=s.getServicesName() %>
<p><%=s.getCustomer() %></p>
<p>

<%
if(s.getServicesCategory().equals("old")){
%>
Categories:<%=s.getServicesCategory()%></p>
<div class="row">
<a href="view_services.jsp?sid=<%= s.getServicesId() %>" class="btn btn-success btn-sm ml-2">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<%
}else{
	%>
Categories:<%=s.getServicesCategory()%></p>
<div class="row">

<% 
if(u == null) {
%>

<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
<%

}else{ 
%>
<a href="cart?bid=<%=s.getServicesId()%>&&uid=<%=u.getId() %>"class="btn btn-danger btn-sm ml-2">Add Cart</a>
<%
}
%>
<a href="view_services.jsp?sid=<%= s.getServicesId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
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
<a href="all_recent_services.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

<!--  End recent  services -->




<!-- new services -->
<hr>
<div class="container">
<h3 class="text-center">New Services</h3>
<div class="row p-3">
<%
ServicesDAOImpl dao = new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list =dao.getNewServices();
for(ServicesDtls s: list){
	%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="cards/<%=s.getPhotoName() %>"style="width: 150px; height: 200px" class="img-thumblin">
<p><%=s.getServicesName() %></p>
<p><%=s.getCustomer() %></p>
<p>Categories<%=s.getServicesCategory() %></p>
<div class="row">
<% 
if(u == null) {
%>

<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
<%

}else{ 
%>
<a href="cart?bid=<%=s.getServicesId()%>&&uid=<%=u.getId() %>"class="btn btn-danger btn-sm ml-2">Add Cart</a>
<%
}
%>
<a href="view_services.jsp?sid=<%=s.getServicesId() %>"
 class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>
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
<a href="all_recent_services.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
<!-- END RECENT SERVICES -->
<hr>

<!-- start old services -->

<div class="container"style="background-color: #f7f7f7;">
<h3 class="text-center">Old Services</h3>
<div class="row p-3">
<%
ServicesDAOImpl dao3 = new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list3 = dao3.getOldServices();
for(ServicesDtls s:list3){
%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="cards/<%=s.getPhotoName() %>" style="width: 150px; height: 200px" class="img-thumblin">
<p><%=s.getServicesName() %></p>
<p><%=s.getCustomer() %></p>
<p><%=s.getServicesCategory() %></p>
<div class="row">
<a href="view_services.jsp?sid=<%= s.getServicesId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=s.getPrice() %></a>
</div>
</div>
</div>
</div>
</div>
<%
}
%>
<!--end old services-->
<%@include file="all_component/footer.jsp"%>
</div>

</body>
</html>