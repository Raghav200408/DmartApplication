<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dmart Product Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
      rel="stylesheet">

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

    <div class="card shadow">

        <div class="card-header bg-success text-white">

            <h4>Add Product</h4>

        </div>

        <div class="card-body">

            <form id="productForm"
                  enctype="multipart/form-data">

                <input type="hidden"
                       id="productId">

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Product Name
                        </label>

                        <input type="text"
                               id="productName"
                               class="form-control"
                               required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Category
                        </label>

                        <input type="text"
                               id="category"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Price
                        </label>

                        <input type="number"
                               id="price"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Quantity
                        </label>

                        <input type="number"
                               id="quantity"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Manufacturer Name
                        </label>

                        <input type="text"
                               id="manufacturerName"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Product Image
                        </label>

                        <input type="file"
                               id="image"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Manufacture Date
                        </label>

                        <input type="date"
                               id="manufactureDate"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Expiry Date
                        </label>

                        <input type="date"
                               id="expiryDate"
                               class="form-control">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Created By
                        </label>

                        <input type="number"
                               id="createdBy"
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
   ADD PRODUCT
=========================== */

$("#productForm").submit(function(e){

    e.preventDefault();

    let formData = new FormData();

    formData.append(
        "productName",
        $("#productName").val());

    formData.append(
        "category",
        $("#category").val());

    formData.append(
        "price",
        $("#price").val());

    formData.append(
        "quantity",
        $("#quantity").val());

    formData.append(
        "manufacturerName",
        $("#manufacturerName").val());

    formData.append(
        "manufactureDate",
        $("#manufactureDate").val());

    formData.append(
        "expiryDate",
        $("#expiryDate").val());

    formData.append(
        "createdBy",
        $("#createdBy").val());

    formData.append(
        "image",
        $("#image")[0].files[0]);

    $.ajax({

    	url:"/DmartWebApp/api/products",

        type:"POST",

        data:formData,

        processData:false,

        contentType:false,

        success:function(response){

            alert(response);

            $("#productForm")[0].reset();

            loadProducts();
        },

        error:function(xhr){

            console.log(xhr.responseText);

            alert("Error Status : " + xhr.status);
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

            alert("Unable To Load Products");
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

            alert("Product Not Found");

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

            <td>${p.manufactureDate}</td>

            <td>

                ${p.expiryDate}

                <br>

                ${expiryBadge}

            </td>

            <td>

                <button
                class="btn btn-warning btn-sm"
                onclick="editProduct(${p.productId})">

                Edit

                </button>

                <button
                class="btn btn-danger btn-sm ms-2"
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

    alert("Edit Clicked : " + id);

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
            $("#manufactureDate").val(p.manufactureDate);
            $("#expiryDate").val(p.expiryDate);
            $("#createdBy").val(p.createdBy);

            window.scrollTo(0,0);
        },
        error:function(xhr){

            console.log(xhr.responseText);
            alert("Error : " + xhr.status);

        }
    });

}


/* ===========================
   DELETE PRODUCT
=========================== */

function deleteProduct(id){

    if(confirm("Delete Product ?")){

        $.ajax({

            url:"/DmartWebApp/api/products/" + id,


            type:"DELETE",

            success:function(response){

                alert(response);

                loadProducts();
            }
        });
    }
}

</script>



</body>
</html>

