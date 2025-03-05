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
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center text-white">Mega City Cab</h3>
        <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="addCustomers.jsp"><i class="fas fa-user-plus"></i> Add Customer</a>
        <a href="addBooking.jsp"><i class="fas fa-taxi"></i> Bookings</a>
        <a href="calculateBill.jsp"><i class="fas fa-receipt"></i> Billing</a>
        <a href="addCar.jsp"><i class="fas fa-car"></i> Add Cars</a>
        <a href="addDrivers.jsp"><i class="fas fa-user"></i> Add Drivers</a>
        <a href="help.jsp"><i class="fas fa-info-circle"></i> Help</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">Welcome to Mega City Cab Management</div>

    <div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div class="dashboard-card">
                <i class="fas fa-users fa-3x"></i>
                <h4>Customers</h4>
                <p>Manage customer details</p>
                <a href="customers.jsp" class="btn btn-custom">View</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="dashboard-card">
                <i class="fas fa-taxi fa-3x"></i>
                <h4>Bookings</h4>
                <p>View and manage bookings</p>
                <a href="booking.jsp" class="btn btn-custom">View</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="dashboard-card">
                <i class="fas fa-receipt fa-3x"></i>
                <h4>Billing</h4>
                <p>Calculate and print bills</p>
                <a href="calculateBill.jsp" class="btn btn-custom">View</a>
            </div>
        </div>
    </div>
    
        
        <div class="row justify-content-center mt-4">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="fas fa-car fa-3x"></i>
                    <h4>Cars</h4>
                    <p>Manage car details</p>
                    <a href="car.jsp" class="btn btn-custom">View</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="fas fa-user fa-3x"></i>
                    <h4>Drivers</h4>
                    <p>Manage driver details</p>
                    <a href="editDriver.jsp" class="btn btn-custom">View</a>
                </div>
            </div>
        </div>
    </div>



    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
