<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Mega City Cab</title>
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

        .add-customer-container {
            max-width: 400px;
            width: 100%;
            padding: 40px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .add-customer-container h2 {
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
    </style>
</head>

<body>
    <div class="add-customer-container">
        <h2>Add New Customer</h2>
        <form action="AddCustomerServlet" method="post">
            <!-- Customer Name field -->
            <div class="form-group">
                <label for="customerName"><i class="fas fa-user"></i> Customer Name</label>
                <input type="text" class="form-control" id="customerName" name="customerName" required>
            </div>

            <!-- Customer Email field -->
            <div class="form-group">
                <label for="email"><i class="fas fa-envelope"></i> Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <!-- Customer Phone Number field -->
            <div class="form-group">
                <label for="phone"><i class="fas fa-phone"></i> Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>

            <!-- Customer Address field -->
            <div class="form-group">
                <label for="address"><i class="fas fa-map-marker-alt"></i> Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <!-- Error message display -->
            <% String error = request.getParameter("error");
               if (error != null) { %>
                <div class="error-msg">There was an issue adding the customer. Please try again.</div>
            <% } %>

            <!-- Submit button -->
            <button type="submit" class="btn-custom">Add Customer</button>
        </form>
    </div>

    <!-- Include JavaScript for client-side validation (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
