<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Mega City Cab</title>
    
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #333333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: white;
            padding: 50px;
            width: 500px;
            border-radius: 10px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
        }
        .btn-custom {
            background-color: #FFCC00;
            color: white;
            font-size: 18px;
            padding: 12px;
        }
        .form-control {
            height: 50px;
            font-size: 18px;
        }
        h2 {
            font-size: 28px;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h2 class="text-center text-warning">Admin Login</h2>
        <form action="/MegaCityCab/LoginServlet" method="post">
            <div class="mb-4">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <% 
               String error = (String) request.getAttribute("error"); 
               if (error != null) { 
            %>
                <p class="text-danger text-center fs-5"><%= error %></p>
            <% } %>

            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>
    </div>
</body>
</html>
