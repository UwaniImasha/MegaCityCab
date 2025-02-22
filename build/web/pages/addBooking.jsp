<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mega City Cab</title>
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

        .dashboard-card {
            background-color: white;
            color: black;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
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
        
        /* Main content wrapper */
        .main-content {
            margin-left: 250px; /* Ensure sidebar remains fixed */
            width: calc(100% - 250px); /* Remaining screen space */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333333;
        }

        /* Form container */
        .form-container {
            width: 400px;
            padding: 30px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        .form-container h2 {
            color: #FFCC00;
            margin-bottom: 20px;
        }

        .btn-custom1 {
            background-color: #FFCC00;
            color: white;
            border: none;
            padding: 12px 20px;
            width: 100%;
            font-size: 16px;
            border-radius: 4px;
        }

        .btn-custom1:hover {
            background-color: #E6B800;
            color: black;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
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
        <a href="addBooking.jsp"><i class="fas fa-taxi"></i> Bookings</a>
        <a href="#"><i class="fas fa-receipt"></i> Billing</a>
        <a href="#"><i class="fas fa-car"></i> Cars & Drivers</a>
        <a href="help.jsp"><i class="fas fa-info-circle"></i> Help</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="form-container">
            <h2>Add New Booking</h2>
            <form action="AddBookingServlet" method="post">
                <!-- Order No field -->
                <div class="form-group">
                    <label for="orderNo"><i class="fas fa-receipt"></i> Order Number</label>
                    <input type="text" class="form-control" id="orderNo" name="orderNo" required>
                </div>

                <!-- Customer Name field -->
                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Customer Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <!-- Customer Address field -->
                <div class="form-group">
                    <label for="address"><i class="fas fa-map-marker-alt"></i > Address</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>

                <!-- Customer Phone Number field -->
                <div class="form-group">
                    <label for="phone"><i class="fas fa-phone"></i> Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>

                <!-- Error message display -->
                <% String error = request.getParameter("error");
                   if (error != null) { %>
                    <div class="error-msg">There was an issue adding the booking. Please try again.</div>
                <% } %>

                <!-- Submit button -->
                <button type="submit" class="btn-custom1">Add Booking</button>
            </form>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>






