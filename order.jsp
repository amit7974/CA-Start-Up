<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	Admin:All Orders</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h3 class="text-center">Hello Admin</h3>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col"> order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
       <th scope="col">Phone</th>
        <th scope="col">Customer</th>
        <th scope="col">Price</th>
         <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
       <td>@mdo</td>
             <td>@fat</td>
             <td>@fat</td>
       
       
      
          </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
       <td>@fat</td>
        <td>@fat</td>
           <td>@fat</td>
           <td>@fat</td>
        
  
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>@mdo</td>
      <td>@fat</td>
            <td>@fat</td>
            <td>@fat</td>
   
    </tr>
  </tbody>
</table>
<div>
<div>

<div style="margin-top:300px;"></div>
<%@include file="footer.jsp" %>
</div>


</div>
</body>
</html>