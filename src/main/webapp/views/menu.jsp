<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("username")==null){
    response.sendRedirect("../index.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>

html, body{
    height:100%;
    margin:0;
    overflow:hidden;
    background:#f4f6f9;
}

.navbar{
    height:75px;
    background:#198754;
}

.main-container{
    height:calc(100vh - 75px);
    overflow:hidden;
}
.row{
    height:100%;
}

.content-area{
    position:relative;
    z-index:1;
}

.sidebar{
    background:#146c43;
    height:100%;
    padding-top:20px;
    overflow-y:auto;
    margin:0;
}

.sidebar a{
    color:white;
    text-decoration:none;
    display:block;
    padding:12px;
}

.sidebar a:hover{
    background:#198754;
}

.content-area{
    height:100%;
    overflow:hidden;
    padding:0;
}

.content-frame{
    width:100%;
    height:100%;
    border:none;
    display:block;
}

.container-fluid{
    --bs-gutter-x:0;
}

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm px-0">
    <div class="container-fluid px-3">

        <span class="navbar-brand fw-bold fs-3">
             Dmart Billing And Inventory Management System
        </span>

        <div class="d-flex align-items-center">

            <span class="text-white fw-semibold me-4 fs-5">
                 Welcome, <%= session.getAttribute("username") %>
            </span>

            <a href="logout.jsp" class="btn btn-outline-light rounded-pill px-4">
                Logout
            </a>

        </div>

    </div>
</nav>

<div class="container-fluid main-container p-0">
<div class="row gx-0 gy-0 m-0">
<div class="col-2 sidebar">

<h5 class="text-white text-center"> Menu </h5>

<hr class="text-white">

<a href="home.jsp" target="contentFrame">
    <i class="fas fa-house me-2"></i> Dashboard
</a>

<a href="customer.jsp" target="contentFrame">
    <i class="fas fa-users me-2"></i> Customer Search
</a>

<a href="products.jsp" target="contentFrame">
    <i class="fas fa-box-open me-2"></i> Product Management
</a>

<a href="billing.jsp" target="contentFrame">
    <i class="fas fa-cart-shopping me-2"></i> Billing
</a>

<a href="viewbills.jsp" target="contentFrame">
    <i class="fas fa-file-invoice me-2"></i> View Bills
</a>


</div>
<div class="col-10 content-area">

    <iframe
        name="contentFrame"
        src="home.jsp"
        class="content-frame">
    </iframe>

</div>
</div>
</div>
</body>
</html>