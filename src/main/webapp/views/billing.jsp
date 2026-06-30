<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Generate Bill</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.card {
	border: none;
	border-radius: 12px;
	box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .08);
}

.card-header {
	background: #198754;
	color: white;
}


.summary-table td {
	font-size: 17px;
}

.total-row {
	background: #198754;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
</style>

</head>

<body>

	<div class="container-fluid p-4">

		<div class="card">

			<div class="card-header">

				<h3 class="mb-0">

					<i class="bi bi-receipt-cutoff"></i> Generate Bill

				</h3>

			</div>

			<div class="card-body">
				<div class="card border-0 bg-light mb-4">

    <div class="card-body">

        <h5 class="text-success mb-3">

            <i class="bi bi-person-vcard"></i>

            Customer Information

        </h5>

        <div class="row">

            <div class="col-md-3">

                <small class="text-muted">
                    Customer ID
                </small>

                <h5 id="customerId" class="fw-bold mt-1"></h5>

            </div>

            <div class="col-md-5">

                <small class="text-muted">
                    Customer Name
                </small>

                <h5 id="customerName" class="fw-bold mt-1"></h5>

            </div>

            <div class="col-md-4">

                <small class="text-muted">
                    Mobile Number
                </small>

                <h5 id="customerMobile" class="fw-bold mt-1"></h5>

            </div>

        </div>

    </div>

</div>
				<h5 class="mb-3">

					<i class="bi bi-cart3"></i> Purchased Products

				</h5>

				<div class="table-responsive">

					<table class="table table-bordered table-hover">

						<thead class="table-success">

							<tr>

								<th>Product</th>

								<th>Quantity</th>

								<th>Price</th>

								<th>GST</th>

								<th>Total</th>

							</tr>

						</thead>

						<tbody id="billTable">

							<tr>

								<td colspan="5" class="text-center">No Products</td>

							</tr>

						</tbody>

					</table>

				</div>

				<hr>

				<div class="row mt-4">

					<div class="col-md-6">

						<label class="fw-bold">Payment Method</label> <select
							class="form-select" id="paymentType">

							<option value="Cash">Cash</option>

							<option value="UPI">UPI</option>

						</select>

					</div>

					<div class="col-md-6">

						<table class="table table-bordered summary-table">

							<tr>

								<th>Subtotal</th>

								<td id="subTotal">₹0.00</td>

							</tr>

							<tr>

								<th>GST (5%)</th>

								<td id="gstAmount">₹0.00</td>

							</tr>

							<tr class="total-row">

								<th>Grand Total</th>

								<td id="grandTotal">₹0.00</td>

							</tr>

						</table>

					</div>

				</div>

				<!-- Payment Success Message -->
				<div id="successMessage"
					class="alert alert-success text-center d-none mt-4">

					<h5 class="mb-1">Payment Successful</h5>

					<p class="mb-0">Bill Generated Successfully.</p>

				</div>
				<div id="billAlert" class="alert d-none mt-3" role="alert"></div>

				<div class="text-end mt-3">

					<button class="btn btn-secondary" onclick="history.back()">
						Back</button>

					<button class="btn btn-success" id="generateBill">
						Generate Bill</button>

				</div>

				<!-- jQuery -->
				<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

				<script>
function showBillAlert(message, type){

    $("#billAlert")
        .removeClass("d-none alert-success alert-danger alert-warning alert-info")
        .addClass("alert-" + type)
        .text(message);

    setTimeout(function(){

        $("#billAlert").addClass("d-none");

    },3000);

}

$(document).ready(function () {

    const params = new URLSearchParams(window.location.search);

    const customerId = params.get("customerId");

    loadBill(customerId);

});

function loadBill(customerId){

    $.ajax({

        url : "/DmartWebApp/api/billing/" + customerId,

        type : "GET",

        success : function(data){

            $("#customerId").text(data.customerId);
            $("#customerName").text(data.customerName);
            $("#customerMobile").text(data.mobileNumber);

            renderProducts(data.items);

            $("#subTotal").text("₹ " + data.subtotal.toFixed(2));
            $("#gstAmount").text("₹ " + data.gst.toFixed(2));
            $("#grandTotal").text("₹ " + data.grandTotal.toFixed(2));

        },

        error : function(){

        	showBillAlert("Unable to load billing details.","danger");

        }

    });

}

function renderProducts(items){

    let rows = "";

    $.each(items,function(index,item){

        rows += `
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>₹ ${item.price}</td>
                <td>₹ ${item.gst}</td>
                <td>₹ ${item.total}</td>
            </tr>
        `;

    });

    $("#billTable").html(rows);

}

$("#generateBill").click(function(){

    $.ajax({

        url : "/DmartWebApp/api/billing/generate",

        type : "POST",

        data : {

            customerId : $("#customerId").text(),

            paymentType : $("#paymentType").val()

        },

        success:function(billId){

            window.location.href = "invoice.jsp?billId=" + billId;

        },

        error:function(xhr){

        	showBillAlert(xhr.responseText,"warning");

        }

    });

});

</script>

			</div>
			<!-- card-body -->

		</div>
		<!-- card -->

	</div>
	<!-- container -->

</body>
</html>