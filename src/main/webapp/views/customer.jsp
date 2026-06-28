<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Customer Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
	background: #f4f6f9;
}

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .08);
}

.card-header h3, .card-header h5 {
	margin: 0;
}

#registerCard {
	display: none;
}

#customerCard {
	display: none;
}

#purchaseBtn {
	display: none;
}
</style>

</head>

<body>

	<div class="container-fluid p-4">

		<div class="card shadow">

			<div class="card-header text-white" style="background:#198754;">

				<h3>Customer Management</h3>

			</div>

			<div class="card-body">
			<div id="customerAlert"
     class="alert d-none mb-3"
     role="alert">
</div>

				<div class="row">

					<div class="col-md-8">

						<label class="form-label"> Mobile Number </label> <input
    type="tel"
    class="form-control"
    id="searchMobile"
    maxlength="10"
    inputmode="numeric"
    autocomplete="off"
    placeholder="Enter 10-digit Mobile Number">

					</div>

					<div class="col-md-4 d-grid">

						<label>&nbsp;</label>

						<button class="btn btn-success" id="searchBtn">
    <i class="bi bi-search"></i> Search Customer
</button>

					</div>

				</div>

			</div>

		</div>

		<!-- CUSTOMER DETAILS -->

		<div class="card shadow mt-4" id="customerCard">

			<div class="card-header bg-success text-white">Customer Details

			</div>

			<div class="card-body">

				<input type="hidden" id="customerId">

				<div class="row">

					<div class="col-md-4">

						<label>Name</label> <input type="text" class="form-control"
							id="customerName" readonly>

					</div>

					<div class="col-md-4">

						<label>Mobile</label> <input type="text" class="form-control"
							id="customerMobile" readonly>

					</div>

				</div>

				<div class="mt-4">

					<button class="btn btn-success" id="purchaseBtn">Purchase
						Products</button>

				</div>

			</div>

		</div>

		<!-- REGISTER CUSTOMER -->

		<div class="card shadow mt-4" id="registerCard">

			<div class="card-header bg-warning">Register Customer</div>

			<div class="card-body">

				<form id="customerForm">
					<input type="hidden" id="customerId">

					<div class="row">

						<div class="col-md-6">

							<label> Customer Name </label> <input type="text" id="regName"
								class="form-control">

						</div>

						<div class="col-md-6">

							<label> Mobile Number </label> <input type="text" id="regMobile"
								class="form-control" maxlength="10">

						</div>

					</div>

					<div class="mt-3">

						<button class="btn btn-success">Register Customer</button>

						<button type="reset" class="btn btn-secondary">Clear</button>

					</div>

				</form>

			</div>

		</div>

	<!-- =====================================
        REGISTERED CUSTOMERS
====================================== -->

	<div class="card shadow mt-4">

		<div class="card-header bg-dark text-white">

			<div class="row">

				<div class="col-md-6">

					<h5 class="mb-0">Registered Customers</h5>

				</div>

				<div class="col-md-6">

					<input
    type="text"
    id="customerSearch"
    class="form-control"
    placeholder="Search Customer By Name or Mobile">

				</div>

			</div>

		</div>

		<div class="card-body p-0">

    <div class="table-responsive">

        <table class="table table-bordered table-hover table-striped mb-0"
            id="customerTable">

				<thead class="table-primary">

					<tr>

						<th>Customer ID</th>

						<th>Customer Name</th>

						<th>Mobile Number</th>

						<th width="180">Actions</th>

					</tr>

				</thead>

				<tbody>

				</tbody>

			</table>

</div>   <!-- table-responsive -->

</div>   <!-- card-body -->

</div>   <!-- Registered Customers card -->

</div>
	<!-- =====================================
        PRODUCT PURCHASE MODAL
====================================== -->

	<div class="modal fade" id="productModal" tabindex="-1">

		<div class="modal-dialog modal-xl">

			<div class="modal-content">

				<div class="modal-header bg-success text-white">

					<h5>Purchase Products</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal">

					</button>

				</div>

				<div class="modal-body">
				
				<div id="productAlert"
     class="alert d-none mb-3"
     role="alert">
</div>

					<div class="row mb-3">

						<div class="col-md-8">

							<input type="number" class="form-control" id="productIdSearch"
								placeholder="Enter Product ID">

						</div>

						<div class="col-md-4">

							<button class="btn btn-success w-100" id="searchProductBtn">
    <i class="bi bi-search"></i> Search Product
</button>

						</div>

					</div>

					<table class="table table-bordered table-hover" id="productTable">

						<thead class="table-success">

							<tr>

								<th>ID</th>

								<th>Product</th>

								<th>Category</th>

								<th>Price</th>

								<th>Stock</th>

								<th>Quantity</th>

								<th>Add</th>

							</tr>

						</thead>

						<tbody>

						</tbody>

					</table>

				</div>

				<div class="modal-footer">

					<button class="btn btn-secondary" data-bs-dismiss="modal">

						Close</button>

					<button class="btn btn-success" id="viewCartBtn">View Cart

					</button>

				</div>

			</div>

		</div>

	</div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header bg-danger text-white">

                <h5 class="modal-title">
                    Delete Customer
                </h5>

                <button
                    type="button"
                    class="btn-close btn-close-white"
                    data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body" id="deleteModalBody">

    Are you sure you want to delete this customer?

</div>

            <div class="modal-footer">

                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">

                    Cancel

                </button>

                <button
                    type="button"
                    class="btn btn-danger"
                    id="confirmDelete">

                    Delete

                </button>

            </div>

        </div>

    </div>

</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
	<script>
	
	let deleteCustomerId = 0;
	
	function showAlert(message, type){

	    $("#customerAlert")
	        .removeClass("d-none alert-success alert-danger alert-warning alert-info")
	        .addClass("alert-" + type)
	        .html(message)
	        .removeClass("d-none");

	    setTimeout(function(){

	        $("#customerAlert").addClass("d-none");

	    },3000);

	}
	
	function showProductAlert(message, type){

	    $("#productAlert")
	        .removeClass("d-none alert-success alert-danger alert-warning alert-info")
	        .addClass("alert-" + type)
	        .html(message)
	        .removeClass("d-none");

	    setTimeout(function(){

	        $("#productAlert").addClass("d-none");

	    },3000);

	}

/*====================================
      LOAD ALL CUSTOMERS
=====================================*/

function loadCustomers() {

    $.ajax({

        url: "/DmartWebApp/api/customers",

        type: "GET",

        success: function (customers) {

            renderCustomerTable(customers);

        },

        error: function () {

        	showAlert("Unable to load customers.","danger");

        }

    });

}


/*====================================
      SEARCH CUSTOMER
=====================================*/

function searchCustomer(){

    let mobile = $("#searchMobile").val().trim();

    if(mobile.length != 10){

        showAlert("Please enter a valid 10-digit mobile number.","warning");
        return;

    }

    $.ajax({

        url:"/DmartWebApp/api/customers/search/" + mobile,

        type:"GET",

        success:function(customer){

            if(customer == null){

                $("#customerCard").hide();
                $("#purchaseBtn").hide();
                $("#registerCard").show();

                $("#regMobile").val(mobile);
                $("#regName").val("");

                showAlert("Customer not found. Please register.","warning");

                return;

            }

            $("#customerId").val(customer.customerId);
            $("#customerName").val(customer.customerName);
            $("#customerMobile").val(customer.mobileNumber);

            $("#customerCard").show();
            $("#purchaseBtn").show();
            $("#registerCard").hide();

        },

        error:function(){

            $("#customerCard").hide();
            $("#purchaseBtn").hide();
            $("#registerCard").show();

            $("#regMobile").val(mobile);

            showAlert("Customer not found. Please register.","warning");

        }

    });

}
$(document).ready(function () {

    loadCustomers();

    $("#searchMobile").on("input", function () {

        this.value = this.value.replace(/\D/g, "");

        if (this.value.length > 10) {
            this.value = this.value.substring(0, 10);
        }

    });

    $("#searchBtn").click(function () {
        searchCustomer();
    });

    $("#customerForm").submit(function (e) {
        e.preventDefault();
        registerCustomer();
    });

});
/*====================================
      REGISTER CUSTOMER
=====================================*/

function registerCustomer() {

    let customer = {

        customerName: $("#regName").val(),

        mobileNumber: $("#regMobile").val()

    };

    let id = $("#customerId").val();

    let url = "/DmartWebApp/api/customers";
    let method = "POST";

    if(id != ""){

        url = "/DmartWebApp/api/customers/" + id;
        method = "PUT";

    }

    $.ajax({

        url: url,
        type: method,
        contentType: "application/json",
        data: JSON.stringify(customer),

        success: function(response){

            let mobile = $("#regMobile").val();

            $("#registerCard").hide();

            loadCustomers();

            // Search the newly registered customer
            $.ajax({

                url: "/DmartWebApp/api/customers/search/" + mobile,
                type: "GET",

                success:function(customer){

                    $("#customerId").val(customer.customerId);
                    $("#customerName").val(customer.customerName);
                    $("#customerMobile").val(customer.mobileNumber);

                    $("#customerCard").show();
                    $("#purchaseBtn").show();

                    $("#customerForm")[0].reset();

                    showAlert(response,"success");

                }

            });

        },

        error: function(xhr){

            if(xhr.status == 400){

                showAlert(xhr.responseText,"warning");

            }else{

                showAlert("Unable to register customer.","danger");

            }

        }

    });

}
/*====================================
RENDER CUSTOMER TABLE
=====================================*/

function renderCustomerTable(customers){

let rows="";

$.each(customers,function(index,c){

  rows += `

  <tr>

      <td>${c.customerId}</td>

      <td>${c.customerName}</td>

      <td>${c.mobileNumber}</td>

      <td>

          <button
              class="btn btn-warning btn-sm"
              onclick="editCustomer(${c.customerId})">

              Edit

          </button>

          <button
              class="btn btn-danger btn-sm ms-2"
              onclick="deleteCustomer(${c.customerId})">

              Delete

          </button>

      </td>

  </tr>

  `;

});

$("#customerTable tbody").html(rows);

}


/*====================================
EDIT CUSTOMER
=====================================*/

function editCustomer(id){

    $.ajax({

        url:"/DmartWebApp/api/customers/"+id,

        type:"GET",

        success:function(customer){

            $("#customerId").val(customer.customerId);

            $("#regName").val(customer.customerName);

            $("#regMobile").val(customer.mobileNumber);

            $("#registerCard").show();

        }

    });

}

/*====================================
DELETE CUSTOMER
=====================================*/

function deleteCustomer(id){

    deleteCustomerId = id;

    $("#deleteModalBody").html(`
        <div class="alert alert-warning mb-3">
            <strong>Confirm Deletion</strong>
        </div>

        Are you sure you want to delete this customer?
    `);

    new bootstrap.Modal(
        document.getElementById("deleteModal")
    ).show();

}

$("#confirmDelete").click(function(){

	$.ajax({
	    url: "/DmartWebApp/api/customers/" + deleteCustomerId + "?force=true",
	    type: "DELETE",

        success:function(response){

            bootstrap.Modal
                .getInstance(document.getElementById("deleteModal"))
                .hide();

            showAlert(response,"success");

            loadCustomers();

        },

        error:function(xhr){

            if(xhr.status == 409){

                $("#deleteModalBody").html(`

                    <div class="alert alert-danger">

                        <strong>Purchase History Found</strong>

                    </div>

                    This customer already has bills.

                    <br><br>

                    Deleting this customer will permanently remove:

                    <ul class="mt-2">
                        <li>Customer Details</li>
                        <li>All Bills</li>
                        <li>All Bill Items</li>
                    </ul>

                    <strong class="text-danger">
                        This action cannot be undone.
                    </strong>

                `);

                $("#confirmDelete")
                    .text("Delete Everything")
                    .removeClass("btn-danger")
                    .addClass("btn-danger")
                    .off("click")
                    .on("click", function(){

                        $.ajax({

                            url:"/DmartWebApp/api/customers/" + deleteCustomerId + "?force=true",

                            type:"DELETE",

                            success:function(response){

                                bootstrap.Modal
                                    .getInstance(document.getElementById("deleteModal"))
                                    .hide();

                                $("#confirmDelete")
                                    .text("Delete")
                                    .off("click")
                                    .on("click", arguments.callee);

                                showAlert(response,"success");

                                loadCustomers();

                            }

                        });

                    });

            }else{

                bootstrap.Modal
                    .getInstance(document.getElementById("deleteModal"))
                    .hide();

                showAlert(xhr.responseText,"warning");

            }

        }

    });

});

/*====================================
SEARCH CUSTOMER TABLE
=====================================*/

$("#customerSearch").keyup(function(){

let value=$(this).val().toLowerCase();

$("#customerTable tbody tr").filter(function(){

  $(this).toggle(

      $(this).text().toLowerCase().indexOf(value)>-1

  );

});

});


/*====================================
PURCHASE PRODUCTS
=====================================*/

$("#purchaseBtn").click(function(){

let modal = new bootstrap.Modal(

  document.getElementById("productModal")

);

modal.show();

$("#productIdSearch").val("");

$("#productTable tbody").html("");

});


/*====================================
SEARCH PRODUCT BY ID
=====================================*/

$("#searchProductBtn").click(function(){

let id = $("#productIdSearch").val();

if(id==""){

	showProductAlert("Please enter Product ID.","warning");

  return;

}

$.ajax({

  url:"/DmartWebApp/api/products/search/"+id,

  type:"GET",

  success:function(product){

      renderProduct(product);

  },

  error:function(){

	  showProductAlert("Product Not Found.","danger");

  }

});

});
/*====================================
RENDER PRODUCT
=====================================*/

function renderProduct(product){

let rows = `

<tr>

  <td>${product.productId}</td>

  <td>${product.productName}</td>

  <td>${product.category}</td>

  <td>₹ ${product.price}</td>

  <td>${product.quantity}</td>

  <td>

      <input
          type="number"
          class="form-control"
          id="qty${product.productId}"
          value="1"
          min="1"
          max="${product.quantity}">

  </td>

  <td>

  <button
  class="btn btn-success btn-sm"
  onclick="addToCart(${product.productId},${product.price},${product.quantity})">

  Add To Cart

</button>

  </td>

</tr>

`;

$("#productTable tbody").html(rows);

}


/*====================================
ADD TO CART
=====================================*/

function addToCart(productId, price, stock){

    let quantity = parseInt($("#qty"+productId).val());

    if(quantity<=0){

    	showProductAlert("Enter a valid quantity.","warning");

        return;

    }

    if(quantity>stock){

    	showProductAlert("Only "+stock+" items available.","warning");

        return;

    }

    let customerId=$("#customerId").val();

    $.ajax({

        url:"/DmartWebApp/api/cart",

        type:"POST",

        contentType:"application/json",

        data:JSON.stringify({

            customerId:customerId,

            productId:productId,

            quantity:quantity,

            price:price,

            total:price*quantity

        }),

        success:function(response){

        	showProductAlert(response,"success");

            $("#qty"+productId).val(1);

        },

        error:function(){

        	showProductAlert("Unable to add product.","danger");

        }

    });

}
/*====================================
VIEW CART
=====================================*/

$("#viewCartBtn").click(function(){

    let customerId=$("#customerId").val();

    let customerName=$("#customerName").val();

    let mobile=$("#customerMobile").val();

    window.location.href=

    "cart.jsp?customerId="

    +customerId

    +"&customerName="

    +encodeURIComponent(customerName)

    +"&mobile="

    +mobile;

});

/*====================================
CLOSE MODAL
=====================================*/

$("#productModal").on("hidden.bs.modal",function(){

$("#productIdSearch").val("");

$("#productTable tbody").html("");

});


/*====================================
RESET PRODUCT SEARCH
=====================================*/

$("#productIdSearch").keypress(function(e){

if(e.which==13){

  $("#searchProductBtn").click();

}

});


</script>
</body>

</html>