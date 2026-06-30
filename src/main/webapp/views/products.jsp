<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dmart Product Management</title>
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
      rel="stylesheet">
      <link rel="stylesheet"
href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>
<style>

body{
    background-color:#f4f6f9;
}

.card{

    border:none;

    border-radius:15px;

}

.card-header{

    font-weight:bold;

}

.table img{

    object-fit:cover;

}

.table td{

    vertical-align:middle;

}

.btn{

    border-radius:8px;

}


</style>

</head>
<body>





<div class="container mt-4">

    <!-- PRODUCT FORM -->

    <!-- PRODUCT FORM -->


    <!-- SEARCH -->

   <!-- SEARCH PRODUCT -->

<div class="card shadow mb-4">

    <div class="card-header bg-primary text-white">

        <h5 class="mb-0">
            <i class="bi bi-search"></i>
            Search Product
        </h5>

    </div>

    <div class="card-body">

        <div class="row g-2">

            <div class="col-md-10">

                <input
                    type="number"
                    id="searchBox"
                    class="form-control"
                    placeholder="Enter Product ID">

            </div>

            <div class="col-md-2">

                <button
                    class="btn btn-primary w-100"
                    onclick="searchProducts($('#searchBox').val())">

                    Search

                </button>

            </div>

        </div>

    </div>

</div>

    <!-- PRODUCT TABLE -->

    <div class="card shadow mt-4">

        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">

    <h5 class="mb-0">
        <i class="bi bi-box-seam"></i>
        View Products
    </h5>

    <button
    class="btn btn-success"
    data-bs-toggle="modal"
    data-bs-target="#productModal"
    onclick="clearForm()">

    <i class="bi bi-plus-circle"></i>

    Add Product

</button>

</div>

        <div class="card-body">

            <div class="table-responsive">

<table id="productTable"
class="table table-striped table-hover align-middle">

    <thead class="table-dark">

    <tr>

        <th>ID</th>

        <th>Image</th>

        <th>Product</th>

        <th>Category</th>

        <th>Price</th>

        <th>Quantity</th>

        <th>Manufacturer</th>

        <th>Expiry</th>

        <th>Status</th>

        <th>Actions</th>

    </tr>

    </thead>

    <tbody>

    </tbody>

</table>

</div>
        </div>

    </div>

</div>

<script>
let deleteProductId = 0;
let deleteModal;

$(document).ready(function(){
	let table = $("#productTable").DataTable({

	    responsive: true,

	    pageLength: 5,

	    lengthMenu: [5,10,25,50],

	    ordering: true,

	    searching: true,

	    info: true,

	    autoWidth: false

	});
	 table = $("#productTable").DataTable({

	        responsive:true,

	        pageLength:5,

	        lengthMenu:[5,10,25,50]

	    });

    loadProducts();

    $("#searchBox").keyup(function(){

        let keyword = $(this).val();

        if(keyword.trim() === ""){

            loadProducts();

        }else{

            searchProducts(keyword);
        }
    });

});


/* ===========================
   ADD/UPADTE PRODUCT
=========================== */

$("#productForm").submit(function(e){

    e.preventDefault();

    let id = $("#productId").val();

    let product = {

        productName: $("#productName").val(),
        category: $("#category").val(),
        price: parseFloat($("#price").val()),
        quantity: parseInt($("#quantity").val()),
        manufacturerName: $("#manufacturerName").val(),
        manufactureDate: $("#manufactureDate").val(),
        expiryDate: $("#expiryDate").val(),
        createdBy: parseInt($("#createdBy").val()),
        updatedBy: parseInt($("#createdBy").val())
    };

    let formData = new FormData();

    formData.append(
        "product",
        new Blob(
            [JSON.stringify(product)],
            { type: "application/json" }
        )
    );

    if($("#image")[0].files.length > 0){
        formData.append(
            "image",
            $("#image")[0].files[0]
        );
    }

    let url = "/DmartWebApp/api/products";
    let method = "POST";

    if(id != ""){
        url = "/DmartWebApp/api/products/" + id;
        method = "PUT";
    }

    $.ajax({

        url: url,

        type: method,

        data: formData,

        processData: false,

        contentType: false,

        success:function(response){

            showProductAlert(response, "success");

            $("#productForm")[0].reset();

            $("#productId").val("");

            bootstrap.Modal
            .getInstance(document.getElementById("productModal"))
            .hide();

            loadProducts();

        },

        error:function(xhr){

            console.log(xhr.responseText);

            showProductAlert("Operation Failed.", "danger");
        }

    });

});
/* ===========================
   LOAD PRODUCTS
=========================== */

function loadProducts(){

    $.ajax({

    	   url:"/DmartWebApp/api/products",

        type:"GET",

        success:function(products){

            renderTable(products);
        },

        error:function(){

        	showProductAlert("Unable to load products.", "warning");
        }

    });

}


/* ===========================
   SEARCH PRODUCTS
=========================== */

function searchProducts(id){

    $.ajax({

        url:"/DmartWebApp/api/products/search/" + id,

        type:"GET",

        success:function(product){

            renderTable([product]);

        },

        error:function(){

        	showProductAlert("Product Not Found.", "warning");

        }

    });

}


/* ===========================
   TABLE RENDER
=========================== */

function renderTable(products){

    let rows = "";

    $.each(products,function(index,p){

        let stockBadge="";

        if(p.quantity<10){

            stockBadge=
            "<span class='badge bg-danger'>Low Stock</span>";

        }else{

            stockBadge=
            "<span class='badge bg-success'>In Stock</span>";

        }

        let expiryBadge="";

        let today=new Date();

        let expiry=new Date(p.expiryDate);

        let diff=(expiry-today)/(1000*60*60*24);

        if(diff<7){

            expiryBadge=
            "<span class='badge bg-warning text-dark'>Expiring Soon</span>";

        }else{

            expiryBadge=
            "<span class='badge bg-success'>Good</span>";

        }

        rows +=`

<tr>

<td>${p.productId}</td>

<td>

<img

src="/DmartUploads/${p.imagePath}"

width="60"

height="60"

class="rounded shadow-sm border">

</td>

<td>

<b>${p.productName}</b>

</td>

<td>

${p.category}

</td>

<td>

₹ ${p.price}

</td>

<td>

${p.quantity}

<br>

${stockBadge}

</td>

<td>

${p.manufacturerName}

</td>

<td>

${formatDate(p.expiryDate)}

<br>

${expiryBadge}

</td>

<td>

${stockBadge}

</td>

<td>

<button
class="btn btn-warning btn-sm"
onclick="editProduct(${p.productId})">

<i class="bi bi-pencil-square"></i>

</button>

<button
class="btn btn-danger btn-sm ms-2"
onclick="deleteProduct(${p.productId})">

<i class="bi bi-trash"></i>

</button>

</td>

</tr>

`;

    });

    table.clear();

    table.rows.add($(rows));

    table.draw();

}

/* ===========================
   EDIT PRODUCT
=========================== */

function editProduct(id){

    $.ajax({

        url: "/DmartWebApp/api/products/" + id,

        type: "GET",

        success: function(p){

            $("#productId").val(p.productId);

            $("#productName").val(p.productName);

            $("#category").val(p.category);

            $("#price").val(p.price);

            $("#quantity").val(p.quantity);

            $("#manufacturerName").val(p.manufacturerName);

            $("#manufactureDate").val(formatDate(p.manufactureDate));

            $("#expiryDate").val(formatDate(p.expiryDate));

            $("#createdBy").val(p.createdBy);

            $("#productModalTitle").text("Update Product");

            new bootstrap.Modal(
                document.getElementById("productModal")
            ).show();

        },

        error:function(){

            showProductAlert(
                "Unable to load product.",
                "danger"
            );

        }

    });

}


/* ===========================
   DELETE PRODUCT
=========================== */

function deleteProduct(id){

    deleteProductId = id;

    deleteModal = bootstrap.Modal.getOrCreateInstance(
        document.getElementById("deleteProductModal")
    );

    deleteModal.show();
}
$(document).on("click", "#confirmDeleteProduct", function () {

    $.ajax({

        url:"/DmartWebApp/api/products/" + deleteProductId,

        type:"DELETE",

        success:function(response){

            deleteModal.hide();

            showProductAlert(response,"success");

            loadProducts();

        },

        error:function(xhr){

            deleteModal.hide();

            if(xhr.status == 409){

                showProductAlert(
                    xhr.responseText,
                    "warning"
                );

            }else{

                showProductAlert(
                    "Unable to delete product.",
                    "danger"
                );

            }

        }

    });

});
function formatDate(date){

    if(date==null)
        return "";

    return date[0]+"-"+
    String(date[1]).padStart(2,"0")+"-"+
    String(date[2]).padStart(2,"0");
}
function clearForm(){

    $("#productForm")[0].reset();

    $("#productId").val("");

    $("#productModalTitle").text("Add Product");

}
function showProductAlert(message, type){

    $("#productAlert")
        .removeClass("d-none alert-success alert-danger alert-warning alert-info")
        .addClass("alert-" + type)
        .text(message)
        .removeClass("d-none");

    setTimeout(function(){

        $("#productAlert").addClass("d-none");

    },3000);

}

</script>
<!-- ADD / EDIT PRODUCT MODAL -->

<div class="modal fade"
     id="productModal"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-lg modal-dialog-scrollable">

        <div class="modal-content">

            <div class="modal-header bg-success text-white">

                <h5 class="modal-title" id="productModalTitle">

                    Add Product

                </h5>

                <button
                    type="button"
                    class="btn-close btn-close-white"
                    data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <!-- Product Form Starts -->

                <form id="productForm"
                      enctype="multipart/form-data">

                    <input type="hidden"
                           id="productId">

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Product Name

                            </label>

                            <input
                                type="text"
                                id="productName"
                                class="form-control"
                                required>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Category

                            </label>

                            <input
                                type="text"
                                id="category"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Price

                            </label>

                            <input
                                type="number"
                                id="price"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Quantity

                            </label>

                            <input
                                type="number"
                                id="quantity"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Manufacturer

                            </label>

                            <input
                                type="text"
                                id="manufacturerName"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Product Image

                            </label>

                            <input
                                type="file"
                                id="image"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Manufacture Date

                            </label>

                            <input
                                type="date"
                                id="manufactureDate"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Expiry Date

                            </label>

                            <input
                                type="date"
                                id="expiryDate"
                                class="form-control">

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Created By

                            </label>

                            <input
                                type="number"
                                id="createdBy"
                                class="form-control">

                        </div>

                    </div>

                </form>

            </div>

            <div class="modal-footer">

                <button
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">

                    Cancel

                </button>

                <button
                    class="btn btn-success"
                    onclick="$('#productForm').submit();">

                    Save Product

                </button>

            </div>

        </div>

    </div>

</div>

<!-- DELETE PRODUCT MODAL -->

<div class="modal fade"
     id="deleteProductModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header bg-danger text-white">

                <h5 class="modal-title">

                    Delete Product

                </h5>

               <button type="button"
        class="btn-close btn-close-white"
        data-bs-dismiss="modal"
        aria-label="Close">
</button>

            </div>

            <div class="modal-body">

                <div class="alert alert-warning mb-3">

                    <strong>Confirm Deletion</strong>

                </div>

                Are you sure you want to delete this product?

            </div>

            <div class="modal-footer">

               <button type="button"
        class="btn btn-secondary"
        data-bs-dismiss="modal">
    Cancel
</button>

                <button type="button"
        class="btn btn-danger"
        id="confirmDeleteProduct">
    Delete
</button>

            </div>

        </div>

    </div>

</div>


</body>
</html>