<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Shopping Cart</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
body {
	background: #f5f5f5;
}

.card {
	border-radius: 12px;
}

.table th {
	text-align: center;
}

.table td {
	vertical-align: middle;
	text-align: center;
}
</style>

</head>

<body>

	<div class="container mt-4">

		<div class="card shadow">

			<div class="card-header text-white" style="background: #198754;">

				<h3>Shopping Cart</h3>

			</div>

			<div class="card-body">

				<div class="card border-0 bg-light mb-3">

    <div class="card-body">

        <h5 class="text-success mb-3">
            Customer Information
        </h5>

        <div class="row">

            <div class="col-md-2">

                <strong>Customer ID</strong><br>

                <span id="customerId"
                      class="fs-5 fw-semibold"></span>

            </div>

            <div class="col-md-5">

                <strong>Customer Name</strong><br>

                <span id="customerName"
                      class="fs-5 fw-semibold"></span>

            </div>

            <div class="col-md-5">

                <strong>Mobile Number</strong><br>

                <span id="customerMobile"
                      class="fs-5 fw-semibold"></span>

            </div>

        </div>

    </div>

</div>

				<hr>
				<!-- ===========================
        CART TABLE
============================ -->

				<div class="table-responsive">

					<table class="table table-bordered table-hover" id="cartTable">

						<thead class="table-success">

							<tr>

								<th>Cart ID</th>

								<th>Product ID</th>

								<th>Product Name</th>

								<th>Price</th>

								<th>Quantity</th>

								<th>Total</th>

								<th width="180">Actions</th>

							</tr>

						</thead>

						<tbody id="cartBody">

						</tbody>

					</table>

				</div>


				<!-- ===========================
        BILL SUMMARY
============================ -->

				<div class="row mt-4">

					<div class="col-md-7"></div>

					<div class="col-md-5">

						<table class="table table-bordered">

							<tr>

								<th>Subtotal</th>

								<td id="subTotal">₹0.00</td>

							</tr>

							<tr>

								<th>GST (5%)</th>

								<td id="gstAmount">₹0.00</td>

							</tr>

							<tr class="table-success">

								<th>Grand Total</th>

								<td id="grandTotal">₹0.00</td>

							</tr>

						</table>

					</div>

				</div>


				<!-- ===========================
        BUTTONS
============================ -->

				<div class="text-end mt-3">

					<button class="btn btn-primary" id="continueShopping">

						Continue Shopping</button>

					<button class="btn btn-success" id="generateBill">

						Generate Bill</button>

				</div>

			</div>

		</div>

	</div>

	<!-- Edit Quantity Modal -->
	<div class="modal fade" id="editCartModal" tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header bg-warning">

					<h5 class="modal-title">Edit Quantity</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>

				</div>

				<div class="modal-body">

					<input type="hidden" id="editCartId"> <input type="hidden"
						id="editPrice"> <label>Quantity</label> <input
						type="number" id="editQuantity" class="form-control" min="1">

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>

					<button type="button" class="btn btn-success" id="updateCartBtn">

						Update</button>

				</div>

			</div>

		</div>

	</div>
	<!-- Delete Cart Modal -->
	<div class="modal fade" id="deleteCartModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header bg-danger text-white">
					<h5 class="modal-title">Delete Cart Item</h5>

					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">Are you sure you want to remove this
					product?</div>

				<div class="modal-footer">

					<button class="btn btn-secondary" data-bs-dismiss="modal">
						Cancel</button>

					<button class="btn btn-danger" id="confirmDeleteCart">
						Delete</button>

				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
let deleteCartId = 0;

$(document).ready(function(){

    let params = new URLSearchParams(window.location.search);

    $("#customerId").text(
    	    params.get("customerId")
    	);

    	$("#customerName").text(
    	    params.get("customerName")
    	);

    	$("#customerMobile").text(
    	    params.get("mobile")
    	);

    loadCart();

});
/*====================================
LOAD CART
=====================================*/

function loadCart(){

let customerId = $("#customerId").text();

$.ajax({

url : "/DmartWebApp/api/cart/" + customerId,

type : "GET",

success : function(cart){

    renderCart(cart);

},

error : function(){

    alert("Unable to load cart.");

}

});

}
/*====================================
RENDER CART
=====================================*/

function renderCart(cart){

let rows = "";

let subtotal = 0;

$.each(cart,function(index,item){

subtotal += item.total;

rows += `

<tr>

    <td>${item.cartId}</td>

    <td>${item.productId}</td>

    <td>${item.productName}</td>

    <td>₹ ${item.price}</td>

    <td>${item.quantity}</td>

    <td>₹ ${item.total}</td>

    <td>

        <button
            class="btn btn-warning btn-sm"
            onclick="editCart(${item.cartId},
                              ${item.price},
                              ${item.quantity})">

            Edit

        </button>

        <button
            class="btn btn-danger btn-sm ms-2"
            onclick="deleteCart(${item.cartId})">

            Delete

        </button>

    </td>

</tr>

`;

});

$("#cartBody").html(rows);

calculateTotal(subtotal);

}
/*====================================
CALCULATE TOTAL
=====================================*/

function calculateTotal(subtotal){

let gst = subtotal * 0.05;

let grandTotal = subtotal + gst;

$("#subTotal").text("₹ " + subtotal.toFixed(2));

$("#gstAmount").text("₹ " + gst.toFixed(2));

$("#grandTotal").text("₹ " + grandTotal.toFixed(2));

}
/*====================================
EDIT CART
=====================================*/


function editCart(cartId, price, oldQty){

    $("#editCartId").val(cartId);

    $("#editPrice").val(price);

    $("#editQuantity").val(oldQty);

    new bootstrap.Modal(
        document.getElementById("editCartModal")
    ).show();

}
$("#updateCartBtn").click(function(){

    let cartId = $("#editCartId").val();

    let price = $("#editPrice").val();

    let quantity = $("#editQuantity").val();

    $.ajax({

        url:"/DmartWebApp/api/cart/"+cartId,

        type:"PUT",

        contentType:"application/json",

        data:JSON.stringify({

            price:price,

            quantity:quantity

        }),

        success:function(response){

            bootstrap.Modal
                .getInstance(document.getElementById("editCartModal"))
                .hide();

            loadCart();

            // Optional:
            showAlert(response,"success");

        },

        error:function(){

            alert("Unable To Update Cart");

        }

    });

});
/*====================================
DELETE CART ITEM
=====================================*/

function deleteCart(cartId){

    deleteCartId = cartId;

    new bootstrap.Modal(
        document.getElementById("deleteCartModal")
    ).show();

}
$(document).on("click", "#confirmDeleteCart", function () {

    $.ajax({

        url:"/DmartWebApp/api/cart/" + deleteCartId,
        type:"DELETE",

        success:function(){

            bootstrap.Modal
                .getInstance(document.getElementById("deleteCartModal"))
                .hide();

            loadCart();

        },

        error:function(){

            alert("Delete Failed");

        }

    });

});
/*====================================
CONTINUE SHOPPING
=====================================*/

$("#continueShopping").click(function(){

window.history.back();

});
/*====================================
GENERATE BILL
=====================================*/

$("#generateBill").click(function(){

	let customerId = $("#customerId").text();
	let customerName = $("#customerName").text();
	let mobile = $("#customerMobile").text();
    window.location.href =
        "billing.jsp?customerId=" + customerId +
        "&customerName=" + encodeURIComponent(customerName) +
        "&mobile=" + mobile;

});

</script>

</body>

</html>