<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dmart Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
body {
	background: #f4f6f9;
	font-family: 'Segoe UI', sans-serif;
	padding: 25px
}

.header-card, .card-box, .table-card {
	background: #fff;
	border-radius: 15px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .08)
}

.header-card {
	padding: 25px;
	margin-bottom: 25px
}

.header-title {
	color: #198754;
	font-size: 30px;
	font-weight: 700
}

.card-box {
	padding: 20px;
	border-top: 4px solid #198754;
	height: 100%;
	transition: .2s
}

.card-box:hover {
	transform: translateY(-4px)
}

.icon-circle {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-size: 28px;
	margin-bottom: 15px
}

.green {
	background: #198754
}

.blue {
	background: #0d6efd
}

.orange {
	background: #fd7e14
}

.purple {
	background: #6f42c1
}

.stat-number {
	font-size: 34px;
	font-weight: 700
}

.table-card {
	margin-top: 25px;
	overflow: hidden
}

.card-header {
	background: #198754 !important;
	color: #fff !important;
	font-weight: 600
}

thead {
	background: #eef8f1
}

.product-card{
    border-radius:15px;
    transition:.3s;
    overflow:hidden;
    border:1px solid #e9ecef;
}

.product-card:hover{
    transform:translateY(-5px);
    box-shadow:0 8px 18px rgba(0,0,0,.12);
}

.product-card img{
    height:130px;
    width:100%;
    object-fit:contain;
    background:#f8f9fa;
    padding:12px;
}

.product-card .card-body{
    padding:15px;
}

.product-card h5{
    font-size:20px;
    font-weight:600;
    margin-bottom:5px;
}

.product-card p{
    margin-bottom:8px;
    color:#6c757d;
}

.price{
    color:#198754;
    font-size:24px;
    font-weight:bold;
}

.stock-badge{
    font-size:13px;
    padding:6px 12px;
    border-radius:20px;
}

.card-footer{
    background:#fff;
    border-top:1px solid #eee;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="header-card">
			<div class="row">
				<div class="col-md-8">
					<h2 id="greeting" class="header-title"></h2>
					<div class="text-muted">Welcome back! Here's today's business
						summary.</div>
				</div>
				<div class="col-md-4 text-end">
					<h5 id="currentDate"></h5>
					<h6 id="currentTime"></h6>
				</div>
			</div>
		</div>
		<div class="row g-4">
			<div class="col-lg-3 col-md-6">
				<div class="card-box">
					<div class="icon-circle green">
						<i class="bi bi-box-seam"></i>
					</div>
					<div class="stat-number" id="totalProducts">0</div>
					<div>
						<strong>Total Products</strong><br>
						<small class="text-muted">Inventory Available</small>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="card-box">
					<div class="icon-circle blue">
						<i class="bi bi-people"></i>
					</div>
					<div class="stat-number" id="totalCustomers">0</div>
					<div>
						<strong>Total Customers</strong><br>
						<small class="text-muted">Registered Customers</small>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="card-box">
					<div class="icon-circle orange">
						<i class="bi bi-receipt"></i>
					</div>
					<div class="stat-number" id="totalBills">0</div>
					<div>
						<strong>Today Bills</strong><br>
						<small class="text-muted">Bills Generated</small>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="card-box">
					<div class="icon-circle purple">
						<i class="bi bi-currency-rupee"></i>
					</div>
					<div class="stat-number" id="todayRevenue">₹0</div>
					<div>
						<strong>Today's Revenue</strong><br>
						<small class="text-muted">Sales Summary</small>
					</div>
				</div>
			</div>
		</div>
		<div class="table-card mt-5">

    <div class="card-header p-3 d-flex justify-content-between align-items-center">

        <h3>Latest Inventory</h3>
          
          
        

        <a href="products.jsp"
           class="btn btn-light btn-sm">

          
            Manage Inventory

        </a>

    </div>

    <div class="p-4">

        <div class="row" id="latestProducts"></div>

    </div>

</div>

		<div class="row g-4">
			<div class="col-lg-6">
				<div class="table-card">
					<div class="card-header p-3">Low Stock Products</div>
					<table class="table mb-0">
						<thead>
							<tr>
								<th>Product</th>
								<th>Category</th>
								<th>Stock</th>
							</tr>
						</thead>
						<tbody id="lowStockBody">
							<tr>
								<td colspan="3" class="text-center p-4 text-muted">No data.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="table-card">
					<div class="card-header p-3">Products Expiring Soon</div>
					<table class="table mb-0">
						<thead>
							<tr>
								<th>Product</th>
								<th>Expiry Date</th>
							</tr>
						</thead>
						<tbody id="expiryBody">
							<tr>
								<td colspan="2" class="text-center p-4 text-muted">No data.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

const username = "<%= session.getAttribute("username") %>";

function updateHeader(){

    const now = new Date();

    const hour = now.getHours();

    let greeting = "";

    if(hour >= 5 && hour < 12){

        greeting = " Good Morning";

    }
    else if(hour >= 12 && hour < 17){

        greeting = " Good Afternoon";

    }
    else if(hour >= 17 && hour < 21){

        greeting = " Good Evening";

    }
    else{

        greeting = "Good Night";

    }

    document.getElementById("greeting").innerHTML =
        greeting + ", " + username;

    document.getElementById("currentDate").innerHTML =
        now.toLocaleDateString("en-IN",{
            weekday:"long",
            day:"numeric",
            month:"long",
            year:"numeric"
        });

    document.getElementById("currentTime").innerHTML =
        now.toLocaleTimeString("en-IN");

}

$(document).ready(function () {

    updateHeader();

    loadDashboard();

    setInterval(updateHeader, 1000);

});

function loadDashboard(){

    $.ajax({

        url: "/DmartWebApp/api/dashboard",

        type: "GET",

        success: function(data){

            // ===========================
            // Dashboard Cards
            // ===========================

            $("#totalProducts").text(data.totalProducts);
            $("#totalCustomers").text(data.totalCustomers);
            $("#totalBills").text(data.totalBills);
            $("#todayRevenue").text("₹ " + data.todayRevenue);
            renderLatestProducts(data.latestProducts);

            
            // ===========================
            // Low Stock Products
            // ===========================

            let lowRows = "";

            if(data.lowStockProducts.length == 0){

                lowRows =
                "<tr><td colspan='3' class='text-center text-muted'>No low stock products.</td></tr>";

            }else{

                $.each(data.lowStockProducts,function(i,p){

                    lowRows +=

                    "<tr>"+

                    "<td>"+p.productName+"</td>"+

                    "<td>"+p.category+"</td>"+

                    "<td>"+p.quantity+"</td>"+

                    "</tr>";

                });

            }

            $("#lowStockBody").html(lowRows);

            // ===========================
            // Expiring Soon
            // ===========================

            let expiryRows = "";

            if(data.expiringProducts.length == 0){

                expiryRows =
                "<tr><td colspan='2' class='text-center text-muted'>No products expiring soon.</td></tr>";

            }else{

                $.each(data.expiringProducts,function(i,p){

                    expiryRows +=

                    "<tr>"+

                    "<td>"+p.productName+"</td>"+

                    "<td>"+p.expiryDate+"</td>"+

                    "</tr>";

                });

            }

            $("#expiryBody").html(expiryRows);

        },

        error:function(xhr){

            console.log(xhr.responseText);

            alert("Dashboard API Error");

        }

    });

}
function renderLatestProducts(products){

    let cards = "";

    $.each(products, function(index, p){

    	cards += `

    		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

    		    <div class="card product-card h-100">

    		        <img src="/DmartWebApp/images/${p.imagePath}"
    		             alt="${p.productName}">

    		        <div class="card-body">

    		            <h5>${p.productName}</h5>

    		            <p>${p.category}</p>

    		            <div class="price">
    		                ₹ ${p.price}
    		            </div>

    		            ${
    		                p.quantity==0 ?

    		                '<span class="badge bg-danger stock-badge">Out of Stock</span>'

    		                :

    		                p.quantity<=10 ?

    		                '<span class="badge bg-warning text-dark stock-badge">Low Stock : '+p.quantity+'</span>'

    		                :

    		                '<span class="badge bg-success stock-badge">In Stock : '+p.quantity+'</span>'
    		            }

    		        </div>

    		        <div class="card-footer">

    		            <button
    		                class="btn btn-outline-success w-100"
    		                onclick="viewProduct(${p.productId})">

    		                <i class="bi bi-eye"></i>
    		                View Product

    		            </button>

    		        </div>

    		    </div>

    		</div>

    		`;

    });

    $("#latestProducts").html(cards);

}

function viewProduct(id){

    $.ajax({

        url:"/DmartWebApp/api/products/" + id,

        type:"GET",

        success:function(p){

            $("#vId").text(p.productId);
            $("#vName").text(p.productName);
            $("#vCategory").text(p.category);
            $("#vPrice").text("₹ " + p.price);
            $("#vQty").text(p.quantity);
            $("#vManufacturer").text(p.manufacturerName);
            $("#vMfg").text(formatDate(p.manufactureDate));
            $("#vExp").text(formatDate(p.expiryDate));

            if(p.quantity<=10){

                $("#vStatus").html(
                    "<span class='badge bg-warning text-dark'>Low Stock</span>"
                );

            }else{

                $("#vStatus").html(
                    "<span class='badge bg-success'>In Stock</span>"
                );

            }

            $("#viewImage").attr(
                "src",
                "/DmartWebApp/images/" + p.imagePath
            );

            new bootstrap.Modal(
                document.getElementById("viewProductModal")
            ).show();

        }

    });

}

function formatDate(date){

    if(date==null)
        return "";

    return date[0]+"-"+
           String(date[1]).padStart(2,"0")+"-"+
           String(date[2]).padStart(2,"0");

}


</script>
<div class="modal fade"
     id="viewProductModal"
     tabindex="-1">

    <div class="modal-dialog modal-lg modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header bg-success text-white">

                <h4 class="modal-title">

                    <i class="bi bi-box-seam"></i>

                    Product Details

                </h4>

                <button
                    class="btn-close btn-close-white"
                    data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <div class="row">

                    <div class="col-md-4 text-center">

                        <img
                            id="viewImage"
                            class="img-fluid rounded border shadow"
                            style="height:240px;
                                   width:100%;
                                   object-fit:contain;">

                    </div>

                    <div class="col-md-8">

                        <table class="table table-borderless">

                            <tr>
                                <th width="180">Product ID</th>
                                <td>: <span id="vId"></span></td>
                            </tr>

                            <tr>
                                <th>Product Name</th>
                                <td>: <span id="vName"></span></td>
                            </tr>

                            <tr>
                                <th>Category</th>
                                <td>: <span id="vCategory"></span></td>
                            </tr>

                            <tr>
                                <th>Price</th>
                                <td>: <span id="vPrice"></span></td>
                            </tr>

                            <tr>
                                <th>Quantity</th>
                                <td>: <span id="vQty"></span></td>
                            </tr>

                            <tr>
                                <th>Manufacturer</th>
                                <td>: <span id="vManufacturer"></span></td>
                            </tr>

                            <tr>
                                <th>Manufacture Date</th>
                                <td>: <span id="vMfg"></span></td>
                            </tr>

                            <tr>
                                <th>Expiry Date</th>
                                <td>: <span id="vExp"></span></td>
                            </tr>

                            <tr>
                                <th>Status</th>
                                <td>: <span id="vStatus"></span></td>
                            </tr>

                        </table>

                    </div>

                </div>

            </div>

            <div class="modal-footer">

                <button
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">

                    Close

                </button>

            </div>

        </div>

    </div>

</div>
</body>
</html>
