<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">


<%@include file="all_component/navbar.jsp"%>
<%
int sid=Integer.parseInt(request.getParameter("sid"));
ServicesDAOImpl dao=new ServicesDAOImpl(DBConnect.getConn());
ServicesDtls s=dao.getServiceById(sid);
%>
<div class="container p-3">
<div class="row">
<div class="col-md-6 text-center p-5 border bg-white">
<img src="cards/<%=s.getPhotoName()%>"style="height:150px;width:150px"><br>
<h4 class="mt-3">Services Name: <span class="text-success"><%=s.getServicesName() %></span> </h4>
<h4>Customer Name:<span class="text-success"><%=s.getCustomer() %></span></h4>
<h4>Category:<span class="text-success"><%=s.getServicesCategory() %></span></h4>
</div>

<div class="col-md-6 text-center p-5 border bg-white">
<h2><%=s.getServicesName() %></h2>

<%
if("Old".equals(s.getServicesCategory())){
%>
<h5 class="text-primary">Contact to Seller</h5>
<h5 class="text-primary">
<i class="fa-solid fa-envelope"></i> Email
<%=s.getEmail() %></h5>
<% 
}
%>
<div class="row">
<div class="col-md-4 text-danger text-center p2-">
<i class="fa-solid fa-money-bill-1-wave fa-3x"></i>
<p>Cash On Delivery</p>
</div>
<div class="col-md-4 text-danger text-center p2-">
<i class="fa-solid fa-arrow-rotate-left fa-3x"></i>
<p>Return Available</p>
</div>
<div class="col-md-4 text-danger text-center p2-">
<i class="fa-solid fa-truck-moving fa-3x"></i>
<p>Free Shipping</p>
</div>
</div>
<%
if("Old".equals(s.getServicesCategory())){
%>
<div class="text-center p-3">
<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i>Continue Shopping</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>20000</a>
</div>

<%
}else{
%>
<div class="text-center p-3">
<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>20000</a>
</div>
<%
}
%>
<div>
</div>
</div>
</div>
</div>
</body>
</html>