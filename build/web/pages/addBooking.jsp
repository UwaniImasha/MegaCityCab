<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Booking - Mega City Cab</title>
    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-color: #333333;
            color: white;
            font-family: 'Arial', sans-serif;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #222222;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #FFCC00;
            color: black;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            background-color: #FFCC00;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: black;
            border-radius: 5px;
        }

        .manage-card {
            background-color: white;
            color: black;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-custom {
            background-color: #FFCC00;
            color: black;
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

        .form-container label {
            color: black;
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

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center text-white">Mega City Cab</h3>
        <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="addCustomers.jsp"><i class="fas fa-user-plus"></i> Add Customer</a>
        <a href="addBooking.jsp" class="active"><i class="fas fa-taxi"></i> Bookings</a>
        <a href="calculateBill.jsp"><i class="fas fa-receipt"></i> Billing</a>
        <a href="cardriverinfo.jsp"><i class="fas fa-car"></i> Cars & Drivers</a>
        <a href="help.jsp"><i class="fas fa-info-circle"></i> Help</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">Add New Booking</div>
        <div class="container mt-4">
            <div class="manage-card">
                <h4>Booking Details</h4>
                <form action="addBookingServlet" method="post">
                    <!-- Order Number -->
                    <div class="mb-3">
                        <label for="orderNo" class="form-label"><i class="fas fa-receipt"></i> Order Number</label>
                        <input type="text" class="form-control" id="orderNo" name="orderNo" required>
                    </div>

                    <!-- Customer Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label"><i class="fas fa-user"></i> Customer Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <!-- Customer Address -->
                    <div class="mb-3">
                        <label for="address" class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>

                    <!-- Customer Phone Number -->
                    <div class="mb-3">
                        <label for="phone" class="form-label"><i class="fas fa-phone"></i> Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>

                    <!-- Error Message -->
                    <% String error = request.getParameter("error");
                       if (error != null) { %>
                        <div class="error-msg">There was an issue adding the booking. Please try again.</div>
                    <% } %>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-custom">Add Booking</button>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
