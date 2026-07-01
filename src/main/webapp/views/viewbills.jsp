<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>View Bills</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- DataTables Bootstrap 5 -->
<link rel="stylesheet"
href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>

<style>
body{
    background:#f4f6f9;
}
.card{
    border:none;
    border-radius:12px;
    box-shadow:0 .25rem .75rem rgba(0,0,0,0.08);
}
</style>

</head>

<body>

<div class="container mt-4">

<div class="card">

<div class="card-header bg-success text-white">
    <h3 class="mb-0">View Bills</h3>
</div>

<div class="card-body">

<table id="billTable"
       class="table table-striped table-bordered"
       style="width:100%">

<thead>
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

<tbody></tbody>

</table>

</div>

</div>

</div>

<script>

let table;

$(document).ready(function(){
    loadBills();
});


// ================= LOAD DATA =================
function loadBills(){

    $.ajax({

        url: "/DmartWebApp/api/billing/all",
        type: "GET",
        dataType: "json",

        success: function(data){
            initTable(data);
        },

        error: function(){
            alert("Unable to load bills");
        }

    });

}


// ================= INIT DATATABLE =================
function initTable(data){

    // destroy old instance if exists
    if ($.fn.DataTable.isDataTable('#billTable')) {
        $('#billTable').DataTable().destroy();
    }

    $('#billTable tbody').empty();

    table = $('#billTable').DataTable({

        data: data,

        columns: [

            { data: "billId", },

            { data: "customerName" },

            { data: "mobileNumber" },

            { data: "billDate" },

            {
                data: "grandTotal",
                render: function(data){
                    return "₹ " + parseFloat(data).toFixed(2);
                }
            },

            { data: "paymentType" },

            {
                data: "billId",
                render: function(data){
                    return `
                        <button class="btn btn-primary btn-sm"
                            onclick="viewInvoice(${data})">
                            View
                        </button>
                    `;
                }
            }

        ],

        paging: true,
        searching: true,   // ✅ IMPORTANT
        ordering: true,
        info: true,
        lengthMenu: [5, 10, 25, 50],

        destroy: true

    });

}


// ================= VIEW INVOICE =================
function viewInvoice(billId){
    window.location.href = "invoice.jsp?billId=" + billId;
}

</script>

</body>
</html>