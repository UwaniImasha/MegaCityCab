<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cab</title>
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

        .help-section {
            background-color: white;
            color: black;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
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
        <a href="cars.jsp"><i class="fas fa-car"></i> Add Cars</a>
        <a href="drivers.jsp"><i class="fas fa-user"></i> Add Drivers</a>
        <a href="help.jsp"><i class="fas fa-info-circle"></i> Help</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">System Usage Guidelines</div>

        <div class="container mt-4">
            <div class="help-section">
                <h2>1. Introduction</h2>
                <p>Welcome to Mega City Cab! This guide will help you navigate the system and use its features effectively.</p>

                <h2>2. Login Instructions</h2>
                <p>To login, please use your registered username and password. If you don't have an account, please contact the administrator.</p>
                <p>If you forget your password, click on "Forgot Password" on the login page to reset it.</p>

                <h2>3. Adding a New Booking</h2>
                <p>To add a new booking:</p>
                <ul>
                    <li>Go to the "Add Booking" section from the sidebar.</li>
                    <li>Enter the customer's details, including name, phone number, and destination.</li>
                    <li>Click "Submit" to save the booking.</li>
                </ul>

                <h2>4. Managing Customers</h2>
                <p>To manage customer details:</p>
                <ul>
                    <li>Go to the "Add Customer" section.</li>
                    <li>Click "Add New Customer" to enter their details.</li>
                    <li>You can edit or delete customer records as needed.</li>
                </ul>

                <h2>5. Billing</h2>
                <p>To calculate and print bills for bookings:</p>
                <ul>
                    <li>Go to the "Billing" section.</li>
                    <li>Choose a booking and the system will automatically calculate the amount.</li>
                    <li>You can apply any applicable discounts or taxes.</li>
                </ul>

                <h2>6. Logout</h2>
                <p>To logout, click the "Logout" button at the top-right of the sidebar.</p>

                <h2>7. Contact Support</h2>
                <p>If you need further assistance, please contact us:</p>
                <ul>
                    <li>Email: support@megacitycab.com</li>
                    <li>Phone: 123-456-7890</li>
                </ul>
            </div>

            <div class="text-center mt-3">
                <a href="dashboard.jsp" class="btn btn-custom">Back to Dashboard</a>
            </div>
        </div>

    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
