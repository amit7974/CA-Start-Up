<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sell:services</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj }">

<c:redirect url="login.jsp"/>
</c:if>


<%@include file="all_component/navbar.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div  class="card-body">
<h5 class="text-center text-primary p-1">Sell Old Services</h5>

<c:if test="${not empty succMsg }">
<h1 class="text-center text-success">${succMsg }</h1>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg }
<c:remove var="failedMsg" scope="session"/>
</c:if>

<form action="add_old_services" method="post" enctype="multipart/form-data">
<input type="hidden" value="${userobj.email}" name="user">


  <div class="form-group">
    <label for="exampleInputEmail1">Services Name</label>
    <input name="sname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Customer</label>
    <input name="customer" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
 
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Price</label>
    <input name="price" class="form-control">
  </div>
  
        
  <div class="form-check">
    <label for="exampleFormControlFiled">Upload Photo</label>
    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
  </div><br>
  <button type="submit" class="btn btn-primary">Sell</button>
</form>
</div>
</div>
</div>
</div>
</body>
</html>