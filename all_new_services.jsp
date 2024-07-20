<%@page import="com.devloperamit.entity.User"%>
<%@page import="com.devloperamit.entity.ServicesDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.developeramit.DBConnect.DBConnect"%>
<%@page import="com.developeramit.DAO.ServicesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Services</title>
<%@include file="all_component/allCss.jsp"%>
<style>      
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */

</style>
</head>
<body>
<% 
User u=(User)session.getAttribute("userobj");
%>
<c:if test="${not  empty addCart}">
<div id="toast"> ${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope="session"/>
</c:if>

<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">
<div class="row p-3">
<%
ServicesDAOImpl dao = new ServicesDAOImpl(DBConnect.getConn());
List<ServicesDtls> list =dao.getAllNewServices();
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