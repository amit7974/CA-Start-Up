 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<div class="container-fluid" style="height:10px; background-color: #303f9f"></div>
<div class="container-fluid p-3 bg-light">
<div class="row">
<div class="col-md-3 text-success">
<h1>
<i class="fa-solid fa-person-walking-luggage"></i>CAStartUp

</h1>
</div>
<div class="col-md-6">
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>


<c:if test="${not empty userobj}">
<div class="col-md-3">
<a href="login.jsp" class="btn btn-success">
<i class="fa-solid fa-right-to-bracket"></i> 
${userobj.name}</a>


<a href="logout" class="btn btn-success">
<i class="fas fa-sign-in-alt">Logout</i> 
</a>
 </div>
</c:if>



<c:if test="${empty userobj}">
<div class="col-md-3">
<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>

<a href="login.jsp"class="btn btn-success">
 <i class="fa-solid fa-user-plus"></i>Login</a>
 <a href="register.jsp"class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Register</a>
 
</div>
</c:if>
</div>
</div>






<!-- 
<div class="col-md-3">
<a href="login.jsp"class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
 <a href="register.jsp"class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i>Register</a>
</div>

</div>
</div>
-->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="navbar-brand" href="index.jsp">Home</a>
        
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="all_recent_services.jsp"><i class="fa-solid fa-id-card"></i>Recent Services</a>
      </li>
      
            <li class="nav-item active">
        <a class="nav-link" href="all_new_services.jsp"> <i class="fa-brands fa-servicestack"></i>New Services</a>
      </li>
      
            <li class="nav-item active">
        <a class="nav-link" href="all_old_services.jsp"><i class="fa-solid fa-tag"></i>Old Services</a>
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="blog.jsp"><i class="fa-solid fa-blog"></i>Blog</a>
      </li>
      
       
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <button class="btn btn-light my-2 my-sm-0" type="submit"><a href="setting.jsp"> <i class="fa-solid fa-gear"></i>Setting</button></a>
      <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-phone-volume"></i>Contact</button>
    </form>
  </div>
</nav>