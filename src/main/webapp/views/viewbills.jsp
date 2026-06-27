<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>View Bills</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>

<body class="bg-light">

<div class="container mt-4">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>View Bills</h3>

</div>

<div class="card-body">

<div class="row mb-3">

<div class="col-md-6">

<input type="text"
       id="search"
       class="form-control"
       placeholder="Search Bill ID">

</div>

<div class="col-md-2">

<button class="btn btn-success"
        onclick="searchBills()">

Search

</button>

</div>

</div>

<table class="table table-bordered table-hover">

<thead class="table-success">

<tr>

<th>Bill ID</th>

<th>Customer</th>

<th>Mobile</th>

<th>Date</th>

<th>Amount</th>

<th>Payment</th>

<th>Action</th>

</tr>

</thead>

<tbody id="billTable">

</tbody>

</table>

</div>

</div>

</div>

<script>

$(document).ready(function(){

    loadBills();

});

function loadBills(){

    $.ajax({

        url:"/DmartWebApp/api/billing/all",

        type:"GET",

        success:function(data){

            renderBills(data);

        },

        error:function(){

            alert("Unable to load bills.");

        }

    });

}

function renderBills(data){

    let rows="";

    $.each(data,function(i,bill){

        rows+=`

        <tr>

            <td>${bill.billId}</td>

            <td>${bill.customerName}</td>

            <td>${bill.mobileNumber}</td>

            <td>${bill.billDate}</td>

            <td>₹ ${bill.grandTotal}</td>

            <td>${bill.paymentType}</td>

            <td>

                <button class="btn btn-primary btn-sm"

                    onclick="viewInvoice(${bill.billId})">

                    View

                </button>

            </td>

        </tr>

        `;

    });

    $("#billTable").html(rows);

}

function viewInvoice(billId){

    window.location.href="invoice.jsp?billId="+billId;

}

function searchBills() {

    let billId = $("#search").val().trim();

    if (billId == "") {

        loadBills();

        return;

    }

    $("#billTable tr").each(function () {

        let currentBillId = $(this).find("td:first").text().trim();

        if (currentBillId === billId) {

            $(this).show();

        } else {

            $(this).hide();

        }

    });

}

</script>

</body>

</html>