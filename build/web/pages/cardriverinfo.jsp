<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars & Drivers - Mega City Cab</title>
    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
    <style>
        /* General Body Styling */
        html, body {
            height: 100%;
            margin: 0;
            background-color: #333333; /* Dark background for the whole page */
            color: white; /* White text color */
            font-family: 'Arial', sans-serif;
        }

        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #222222; /* Dark sidebar */
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
            background-color: #FFCC00; /* Orange on hover */
            color: black;
        }

        .sidebar a.active {
            background-color: #FFCC00; /* Active link highlight */
            color: black;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        /* Header Styling */
        .header {
            background-color: #FFCC00; /* Orange background for header */
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: black;
            border-radius: 5px;
        }

        /* Manage Car & Driver Card Styling */
        .manage-card {
            background-color: #ffffff; /* White background for the card */
            color: black; /* Black text inside card */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 20px;
        }

        .btn-custom {
            background-color: #FFCC00; /* Orange background for buttons */
            color: black;
            border: none;
            padding: 12px 20px;
            width: 100%;
            font-size: 16px;
            border-radius: 4px;
        }

        .btn-custom:hover {
            background-color: #E6B800; /* Darker orange on hover */
            color: black;
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center text-white">Mega City Cab</h3>
        <a href="dashboard.jsp" class="<%= (request.getRequestURI().endsWith("dashboard.jsp")) ? "active" : "" %>">
            <i class="fas fa-home"></i> Dashboard
        </a>
        <a href="addCustomers.jsp" class="<%= (request.getRequestURI().endsWith("addCustomers.jsp")) ? "active" : "" %>">
            <i class="fas fa-user-plus"></i> Add Customer
        </a>
        <a href="addBooking.jsp" class="<%= (request.getRequestURI().endsWith("addBooking.jsp")) ? "active" : "" %>">
            <i class="fas fa-taxi"></i> Bookings
        </a>
        <a href="calculateBill.jsp" class="<%= (request.getRequestURI().endsWith("calculateBill.jsp")) ? "active" : "" %>">
            <i class="fas fa-receipt"></i> Billing
        </a>
        <a href="cardriverinfo.jsp" class="<%= (request.getRequestURI().endsWith("carsDrivers.jsp")) ? "active" : "" %>">
            <i class="fas fa-car"></i> Cars & Drivers
        </a>
        <a href="help.jsp" class="<%= (request.getRequestURI().endsWith("help.jsp")) ? "active" : "" %>">
            <i class="fas fa-info-circle"></i> Help
        </a>
        <a href="logout.jsp" class="<%= (request.getRequestURI().endsWith("logout.jsp")) ? "active" : "" %>">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">Manage Car & Driver Information</div>

        <div class="container mt-4">
            <div class="manage-card">
                <h4>Car & Driver Details</h4>
                <form action="manageCarsAndDriversServlet" method="post">
                    <div class="mb-3">
                        <label for="carModel" class="form-label">Car Model</label>
                        <input type="text" class="form-control" id="carModel" name="carModel" required>
                    </div>
                    <div class="mb-3">
                        <label for="driverName" class="form-label">Driver Name</label>
                        <input type="text" class="form-control" id="driverName" name="driverName" required>
                    </div>
                    <div class="mb-3">
                        <label for="licenseNumber" class="form-label">Driver License Number</label>
                        <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="carRegistration" class="form-label">Car Registration Number</label>
                        <input type="text" class="form-control" id="carRegistration" name="carRegistration" required>
                    </div>
                    <button type="submit" class="btn btn-custom">Add Car & Driver</button>
                </form>
            </div>
        </div>

    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
