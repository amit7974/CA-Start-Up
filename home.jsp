<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admine:Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover {
text-decoration: none;
color: black;
	
}
</style>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>


<div class="container">
<div class="row p-5">
<div class="col-md-3">
<a href="add_services.jsp">
<div class="card">
<div class="card-body">
<i class="fa-solid fa-plus fa-3x text-primary"></i>
<br>
<h4>Add Services</h4>
----------
</div>
</div>
</a>
</div>


<div class="col-md-3">
<a href="all_services.jsp">
<div class="card">
<div class="card-body">

<i class="fa-solid fa-briefcase fa-3x text-danger"></i>
<br>
<h4>All Services</h4>
----------
</div>
</div>
</a>
</div>

<div class="col-md-3">
<a href="order.jsp">
<div class="card">
<div class="card-body">

<i class="fa-solid fa-box-open  fa-3x text-warning"></i>
<br>
<h4>Order</h4>
----------
</div>
</div>
</a>
</div>
<div class="col-md-3">
<a data-toggle="modal" data-target="#exampleModal">
<div class="card">
<div class="card-body text-center">
<i class="fas fa-sign-out-alt fa-3x text-primary"></i> 
<br>
<h4>logout</h4>
----------
</div>
</div>
</a>
</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
      <h4>Do You want logout </h4>
      <div class=" text-center">
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
        .</div>..
        </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<div style="margin-top:300px;"></div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>