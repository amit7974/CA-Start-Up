<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User:Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Add Address</h3>
<form action="">    
<div class="form-row">
<div class="form-group col-md-6">

								<label for="exampleInputEmail1">Address</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="text">
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputPassword1">Landmark</label> <input
									type="TEXT" class="form-control" id="exampleInputPassword1"
									required="required" name="text">
							</div>
							
</div>





							
 <div class="form-row">
 

<div class="form-group col-md-4">
								<label for="exampleInputPassword1">City</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="text">
							</div>


<div class="form-group col-md-4">
								<label for="exampleInputPassword1">State</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="text">
							</div>
							
							
							<div class="form-group col-md-4">
								<label for="exampleInputPassword1">Pin code</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="text">
							</div>
							</div>
							
							<div class="text-center">
							
							<button class="btn btn-warning text-white">Add Address</button>
							
							</div>
							
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>