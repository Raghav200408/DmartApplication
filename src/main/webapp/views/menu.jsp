<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body
{
    background-color:#f4f6f9;
}

.navbar
{
    background-color:#198754;
}

.sidebar
{
    height:100vh;
    background-color:#146c43;
    padding-top:20px;
}

.sidebar a
{
    color:white;
    text-decoration:none;
    display:block;
    padding:12px;
}

.sidebar a:hover
{
    background-color:#198754;
}

</style>
</head>
<body>

<nav class="navbar navbar-dark">
<div class="container-fluid">
<span class="navbar-brand mb-0 h1">

Dmart Billing And Inventory Management System

</span>
</div>
</nav>

<div class="container-fluid">
<div class="row">
<div class="col-md-2 sidebar">

<h5 class="text-white text-center"> Menu </h5>

<hr class="text-white">

<a href="home.jsp" target="contentFrame"> Dashboard </a>
<a href="customer.jsp" target="contentFrame"> Customer Search </a>
<a href="viewcustomers.jsp" target="contentFrame"> View Customers </a>
<a href="addproduct.jsp" target="contentFrame"> Add Product </a>
<a href="viewproducts.jsp" target="contentFrame"> View Products </a>
<a href="viewbills.jsp" target="contentFrame"> View Bills </a>
<a href="login.jsp"> Logout </a>

</div>
<div class="col-md-10 p-0">

<iframe
name="contentFrame"
src="home.jsp"
width="100%"
height="900px"
style="border:none;">
</iframe>

</div>
</div>
</div>
</body>
</html>