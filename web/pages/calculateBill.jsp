<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - Mega City Cab</title>
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

        /* Billing Card Styling */
        .billing-card {
            background-color: #ffffff; /* White background for billing card */
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
        <div class="header">Billing Information</div>

        <div class="container mt-4">
            <div class="billing-card">
                <h4>Calculate Total Bill</h4>
                <form action="calculateBillServlet" method="post">
                    <div class="mb-3">
                        <label for="bookingNumber" class="form-label">Booking Number</label>
                        <input type="text" class="form-control" id="bookingNumber" name="bookingNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="distance" class="form-label">Distance (in km)</label>
                        <input type="number" class="form-control" id="distance" name="distance" required>
                    </div>
                    <div class="mb-3">
                        <label for="tax" class="form-label">Tax Percentage</label>
                        <input type="number" class="form-control" id="tax" name="tax" required>
                    </div>
                    <div class="mb-3">
                        <label for="discount" class="form-label">Discount (if any)</label>
                        <input type="number" class="form-control" id="discount" name="discount" value="0">
                    </div>
                    <button type="submit" class="btn btn-custom">Calculate Bill</button>
                </form>
            </div>
        </div>

    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
