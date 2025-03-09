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
        
        .sidebar h3 {
            color: #FFFFFF;
            text-align: center;
            font-weight: bold;
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
        <a href="addBooking.jsp"><i class="fas fa-taxi"></i> Add Bookings</a>
        <a href="booking.jsp"><i class="fas fa-receipt"></i> Billing</a>
        <a href="addCar.jsp"><i class="fas fa-car"></i> Add Cars</a>
        <a href="addDrivers.jsp"><i class="fas fa-user"></i> Add Drivers</a>
        <a href="help.jsp"><i class="fas fa-info-circle"></i> Help</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">Add New Booking</div>
        <div class="container mt-4">
            <div class="manage-card">
                <h4>Booking Details</h4>
                <form action="/MegaCityCab/addBookingServlet" method="post">
                    <!-- Booking Number -->
                    <div class="mb-3">
                        <label for="bookingNumber" class="form-label"><i class="fas fa-receipt"></i> Booking Number</label>
                        <input type="text" class="form-control" id="bookingNumber" name="bookingNumber" required>
                    </div>

                    <!-- Customer ID -->
                    <div class="mb-3">
                        <label for="customerId" class="form-label"><i class="fas fa-user"></i> Customer ID</label>
                        <input type="text" class="form-control" id="customerId" name="customerId" required>
                    </div>

                    <!-- Driver ID -->
                    <div class="mb-3">
                        <label for="driverId" class="form-label"><i class="fas fa-id-badge"></i> Driver ID</label>
                        <input type="text" class="form-control" id="driverId" name="driverId" required>
                    </div>

                    <!-- Car ID -->
                    <div class="mb-3">
                        <label for="carId" class="form-label"><i class="fas fa-car"></i> Car ID</label>
                        <input type="text" class="form-control" id="carId" name="carId" required>
                    </div>

                    <!-- Phone -->
                    <div class="mb-3">
                        <label for="phone" class="form-label"><i class="fas fa-phone"></i> Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>

                    <!-- Pickup Location -->
                    <div class="mb-3">
                        <label for="pickupLocation" class="form-label"><i class="fas fa-map-marker-alt"></i> Pickup Location</label>
                        <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>
                    </div>

                    <!-- Destination -->
                    <div class="mb-3">
                        <label for="destination" class="form-label"><i class="fas fa-map-marked-alt"></i> Destination</label>
                        <input type="text" class="form-control" id="destination" name="destination" required>
                    </div>

                    <!-- Date & Time -->
                    <div class="mb-3">
                        <label for="dateTime" class="form-label"><i class="fas fa-clock"></i> Date & Time</label>
                        <input type="datetime-local" class="form-control" id="dateTime" name="dateTime" required>
                    </div>

                    <!-- Fare -->
                    <div class="mb-3">
                        <label for="fare" class="form-label"><i class="fas fa-dollar-sign"></i> Fare</label>
                        <input type="text" class="form-control" id="fare" name="fare" required>
                    </div>

                    <!-- Success Message -->
                    <% 
                    String success = request.getParameter("success");
                    if ("true".equals(success)) { 
                    %>
                    <div class="alert alert-success text-center">Booking added successfully!</div>
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
