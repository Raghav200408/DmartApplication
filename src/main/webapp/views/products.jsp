<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dmart Product Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>

body{
    background-color:#f4f6f9;
}

.card{
    border:none;
}

.table img{
    border-radius:8px;
}

</style>

</head>
<body>





<div class="container mt-4">

    <!-- PRODUCT FORM -->

    <!-- PRODUCT FORM -->

<div class="card shadow">

    <div class="card-header bg-success text-white">
        <h4>Add Product</h4>
    </div>

    <div class="card-body">

        <div id="productAlert"
             class="alert d-none mb-3"
             role="alert">
        </div>

        <form id="productForm" enctype="multipart/form-data">

            <input type="hidden" id="productId">

            <div class="row">

                <div class="col-md-6 mb-3">
                    <label class="form-label">Product Name</label>
                    <input type="text"
                           id="productName"
                           class="form-control"
                           name="productName"
                           required>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Category</label>
                    <input type="text"
                           id="category"
                           name="category"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Price</label>
                    <input type="number"
       id="price"
       name="price"
       class="form-control">

                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Quantity</label>
                    <input type="number"
                           id="quantity"
                            name="quantity"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Manufacturer Name</label>
                    <input type="text"
                           id="manufacturerName"
                           name="manufacturerName"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Product Image</label>
                    <input type="file"
                           id="image"
                            name="image"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Manufacture Date</label>
                    <input type="date"
                           id="manufactureDate"
                              name="manufactureDate"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Expiry Date</label>
                    <input type="date"
                           id="expiryDate"
                            name="expiryDate"
                           class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Created By</label>
                    <input type="number"
                           id="createdBy"
                              name="createdBy"
                           class="form-control">
                </div>

            </div>

            <button type="submit"
                    class="btn btn-success">
                Save Product
            </button>

            <button type="reset"
                    class="btn btn-secondary">
                Clear
            </button>

        </form>

    </div>

</div>

    <!-- SEARCH -->

    <div class="card shadow mt-4">

        <div class="card-body">

            <div class="row">

                <div class="col-md-4">
               <input type="number"
                 id="searchBox"
                  class="form-control"
                   placeholder="Enter Product ID">
                </div>

            </div>

        </div>

    </div>

    <!-- PRODUCT TABLE -->

    <div class="card shadow mt-4">

        <div class="card-header bg-dark text-white">

            <h4>Product List</h4>

        </div>

        <div class="card-body">

            <table
              class="table table-bordered table-hover table-striped"
              id="productTable">

                <thead class="table-primary">

                <tr>

                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Manufacturer</th>
                    <th>MFG Date</th>
                    <th>EXP Date</th>
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

<script>
let deleteProductId = 0;
let deleteModal;

$(document).ready(function(){

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

        let stockBadge = "";

        if(p.quantity < 10){

            stockBadge =
            "<span class='badge bg-danger'>Low Stock</span>";

        }else{

            stockBadge =
            "<span class='badge bg-success'>Available</span>";
        }


        let expiryBadge = "";

        let today =
            new Date();

        let expiry =
            new Date(p.expiryDate);

        let diff =
            (expiry - today)
            /(1000*60*60*24);

        if(diff < 7){

            expiryBadge =
            "<span class='badge bg-warning text-dark'>Expiring Soon</span>";
        }

        rows += `
        	<tr>

        	<td>${p.productId}</td>

        	<td>${p.productName}</td>

        	<td>${p.category}</td>

        	<td>${p.price}</td>

        	<td>
        	${p.quantity}
        	<br>
        	${stockBadge}
        	</td>

        	<td>${p.manufacturerName}</td>

        	<td>${formatDate(p.manufactureDate)}</td>

        	<td>${formatDate(p.expiryDate)}</td>

        	<td>
        	${stockBadge}
        	</td>

        	<td>

        	<button class="btn btn-warning btn-sm"
        	onclick="editProduct(${p.productId})">

        	Edit

        	</button>

        	<button class="btn btn-danger btn-sm ms-2"
        	onclick="deleteProduct(${p.productId})">

        	Delete

        	</button>

        	</td>

        	</tr>
        	`;
    });

    $("#productTable tbody")
    .html(rows);
}


/* ===========================
   EDIT PRODUCT
=========================== */

function editProduct(id){

   

    $.ajax({
        url:"/DmartWebApp/api/products/" + id,
        type:"GET",
        success:function(p){

            $("#productId").val(p.productId);
            $("#productName").val(p.productName);
            $("#category").val(p.category);
            $("#price").val(p.price);
            $("#quantity").val(p.quantity);
            $("#manufacturerName").val(p.manufacturerName);
            $("#manufactureDate").val(
            		formatDate(p.manufactureDate));
            $("#expiryDate").val(
            		formatDate(p.expiryDate));
            $("#createdBy").val(p.createdBy);

            window.scrollTo(0,0);
        },
        error:function(xhr){

            console.log(xhr.responseText);
            showProductAlert("Unable to load product.", "danger");

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