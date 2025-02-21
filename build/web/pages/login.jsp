<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            background-color: #333333;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; 
        }

        .login-container {
            max-width: 400px;
            width: 100%; 
            padding: 40px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .login-container h2 {
            text-align: center;
            color: #FFCC00;
        }
        .btn-custom {
            background-color: #FFCC00;
            color: white;
            border: none;
            padding: 12px 20px;
            width: 100%;
            font-size: 16px;
            border-radius: 4px;
        }
        .btn-custom:hover {
            background-color: #E6B800;
            color: black;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .error-msg {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        .forgot-password a {
            color: #FFCC00;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h2>Login to Mega City Cab</h2>
        <form action="LoginServelet" method="post">
            <!-- Username field with icon -->
            <div class="form-group">
                <label for="username"><i class="fas fa-user"></i> Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <!-- Password field with icon -->
            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i> Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <!-- Error message display -->
            <% String error = request.getParameter("error");
               if (error != null) { %>
                <div class="error-msg">Invalid username or password. Please try again.</div>
            <% } %>
            <!-- Submit button -->
            <button type="submit" class="btn-custom">Login</button>
        </form>

        <!-- Forgot Password Link -->
        <div class="forgot-password">
            <a href="addCustomers.jsp">Forgot Password?</a>
        </div>
    </div>


    <!-- Include JavaScript for client-side validation (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
