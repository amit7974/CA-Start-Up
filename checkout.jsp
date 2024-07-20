<%@page import="com.devloperamit.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.CartDaoImpl"%>
<%@page import="com.devloperamit.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart:Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMsg}">
<div class="alert alert-success" role="alert">${succMsg}
</div>
<c:remove var="succMsg" scope="session"/>
</c:if>


<c:if test="${not empty failedMsg}">
<div class="alert alert-danger" role="alert">${failedMsg}
</div>
<c:remove var="failedMsg" scope="session"/>
</c:if>



<div class="container">
<div class="row p-2">
<div class="col-md-6">
<div class="card bg-white">
<div class="card-body">
<h3 class="text-center text-success">Your Selected Items</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Services Name</th>
      <th scope="col">Customer</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
  List<Cart> cart=dao.getServicesByUser(u.getId());
  Double totalPrice= 0.00;
  for(Cart c :cart){
	  totalPrice=c.getTotalPrice();
	%>  
	  <tr>
      <th scope="row"><%=c.getServicesName() %></th>
      <td><%=c.getCustomer() %></td>
      <td><%=c.getPrice() %></td>
      <td>
      <a href="remove_services?bid=<%=c.getBid() %>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>
<%
  }
  %>
  

<tr>
<td>Total Price</td>
<td></td>
<td></td>
<td><%=totalPrice %></td>
</tr>
  </tbody>
</table>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success"> Your Details for Order</h3>
<form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" value="">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4">
    </div>
    </div>
    
    
    
    
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone</label>
      <input type="number" class="form-control" id="inputEmail4">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4">
    </div>
    </div>
    
    
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" class="form-control" id="inputEmail4">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4">
    </div>
    </div>
    
    
    
    
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Zip code</label>
      <input type="text" class="form-control" id="inputPassword4">
    </div>
    </div>
    
    
    <div class="form-group">
    <label>Payment Mode</label>
    <select class="form-control">
    <option>--select---</option>
    <option>Cash on Delivery</option>
    </select>
    </div>
    
    <div class="text-center">
    <button class="btn btn-warning">Order Now</button>
    <a href="index.jsp"class="btn btn-success">Continue Shopping</a>
    
    </div>
    
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>