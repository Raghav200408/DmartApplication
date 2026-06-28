<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Invoice</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f5f5f5;
}

.invoice{
    width:850px;
    margin:30px auto;
    background:white;
    padding:35px;
    border-radius:10px;
    box-shadow:0 0 15px rgba(0,0,0,.15);
}

.header{
    text-align:center;
    border-bottom:2px solid #198754;
    padding-bottom:15px;
    margin-bottom:20px;
}

.header h2{
    color:#198754;
    font-weight:bold;
}

.info td{
    padding:4px 8px;
}

.table th{
    background:#198754;
    color:white;
}

.total-table{
    width:300px;
    margin-left:auto;
}

.print-btn{
    margin-top:25px;
    text-align:center;
}

@media print{

    .print-btn{
        display:none;
    }

    body{
        background:white;
    }

    .invoice{
        box-shadow:none;
        width:100%;
        margin:0;
    }

}

</style>

</head>

<body>

<div class="invoice">

<div class="header">

<h2>DMART BILLING SYSTEM</h2>

<h5>TAX INVOICE</h5>

</div>

<table class="table table-borderless info">

<tr>

<td><b>Invoice No :</b></td>

<td id="billId"></td>

<td><b>Date :</b></td>

<td id="billDate"></td>

</tr>

<tr>

<td><b>Customer :</b></td>

<td id="customerName"></td>

<td><b>Mobile :</b></td>

<td id="mobile"></td>

</tr>

<tr>

<td><b>Payment :</b></td>

<td id="paymentType"></td>

</tr>

</table>

<hr>

<table class="table table-bordered">

<thead>

<tr>

<th>Product</th>

<th>Qty</th>

<th>Price</th>

<th>GST</th>

<th>Total</th>

</tr>

</thead>

<tbody id="invoiceItems">

</tbody>

</table>

<table class="table table-bordered total-table">

<tr>

<th>Subtotal</th>

<td id="subtotal"></td>

</tr>

<tr>

<th>GST</th>

<td id="gst"></td>

</tr>

<tr class="table-success">

<th>Grand Total</th>

<td id="grandTotal"></td>

</tr>

</table>

<div class="text-center mt-4">

<h5>Thank You! Visit Again </h5>

</div>

<div class="print-btn">

<button class="btn btn-success" onclick="printInvoice()">

 Print Invoice

</button>

</div>

</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>

$(document).ready(function(){

    const params = new URLSearchParams(window.location.search);

    const billId = params.get("billId");

    loadInvoice(billId);

});

function loadInvoice(billId){

    $.ajax({

        url:"/DmartWebApp/api/billing/invoice/" + billId,

        type:"GET",

        success:function(data){

            $("#billId").text("INV-" + String(data.billId).padStart(6,'0'));

            $("#billDate").text(data.billDate);

            $("#customerName").text(data.customerName);

            $("#mobile").text(data.mobileNumber);

            $("#paymentType").text(data.paymentType);

            $("#subtotal").text("₹ " + data.subtotal.toFixed(2));

            $("#gst").text("₹ " + data.gst.toFixed(2));

            $("#grandTotal").text("₹ " + data.grandTotal.toFixed(2));

            renderItems(data.items);

        },

        error:function(){

            alert("Unable to load invoice.");

        }

    });

}

function renderItems(items){

    let rows = "";

    $.each(items,function(i,item){

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

    $("#invoiceItems").html(rows);

}

function printInvoice() {

    window.print();

}

window.onafterprint = function () {

    // Do nothing after printing

};

</script>

</body>
</html>