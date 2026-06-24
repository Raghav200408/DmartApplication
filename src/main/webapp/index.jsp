
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cashier Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-success bg-gradient min-vh-100">

<div class="container">
    <div class="row justify-content-center align-items-center vh-100">

        <div class="col-md-4">

            <div class="card border-0 shadow-lg rounded-4">

                <div class="card-header text-center bg-success text-white rounded-top-4 py-3">
                    <h3 class="mb-0">Dmart Login</h3>
                </div>

                <div class="card-body p-4">

                    <form id="loginForm">

                        <div class="text-center mb-4">
                            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                                 width="80">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                Username
                            </label>

                            <input type="text"
                                   id="username"
                                   name="username"
                                   class="form-control form-control-lg"
                                   placeholder="Enter Username">
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">
                                Password
                            </label>

                            <input type="password"
                                   id="password"
                                   name="password"
                                   class="form-control form-control-lg"
                                   placeholder="Enter Password">
                        </div>

                        <div class="d-grid">
                            <button type="button"
                                    onclick="loginUser()"
                                    class="btn btn-success btn-lg">
                                Login
                            </button>
                        </div>

                    </form>

                </div>

                <div class="card-footer text-center bg-white border-0 pb-3">
                    <small class="text-muted">
                        Dmart Inventory Management System
                    </small>
                </div>

            </div>

        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>

function loginUser() {

    var loginData = {
        username: $("#username").val(),
        password: $("#password").val()
    };

    $.ajax({

        url : "/DmartWebApp/api/login",
        type : "POST",
        contentType : "application/json",
        data : JSON.stringify(loginData),

        success : function(response) {

            if(response === "SUCCESS") {
                window.location.href = "views/menu.jsp";
            } else {
                alert("Invalid Username or Password");
            }
        },

        error : function(xhr) {

            console.log("Status : " + xhr.status);
            console.log("Response : " + xhr.responseText);

            alert("Error : " + xhr.status);
        }
    });
}

</script>

</body>
</html>
```
