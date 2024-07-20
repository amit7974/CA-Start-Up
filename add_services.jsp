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
<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"/>
</c:if>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Add Services</h4>

<c:if test="${not empty succMsg }">
<h1 class="text-center text-success">${succMsg }</h1>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg }
<c:remove var="failedMsg" scope="session"/>
</c:if>


<form action="../add_services" method="post" enctype="multipart/form-data">
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
  
    <div class="form-group">
    <label for="inputState">Services Categories</label>
    <select id="inputState" name="categories"  class="form-control">
    <option selected>--select--</option>
      <option value="New">New Services</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="inputState">Services Status</label>
    <select id="inputState" name="status"  class="form-control">
    <option selected>--select--</option>
      <option value="Active">Active</option>
       <option value="Inactive">inactive</option>
    </select>
  </div>
  
  <div class="form-check">
    <label for="exampleFormControlFiled">Upload Photo</label>
    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
  </div><br>
  <button type="submit" class="btn btn-primary">Add</button>
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