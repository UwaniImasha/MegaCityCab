<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car - Mega City Cab</title>
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body { 
            background-color: #333; 
            color: white; 
            font-family: Arial, sans-serif; 
        }
        .sidebar { 
            height: 100vh; 
            width: 250px; 
            position: fixed; 
            top: 0; 
            left: 0; 
            background-color: #222; 
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
        }
        .form-container { 
            background-color: white; 
            color: black; 
            padding: 20px; 
            border-radius: 8px; 
        }
        .btn-custom { 
            background-color: #FFCC00; 
            color: black; 
            width: 100%; 
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
        <div class="header">Add New Car</div>
        <div class="container mt-4">
            <div class="form-container">
                <h4>Car Details</h4>
                <form action="addCarServlet" method="post">
                    <div class="mb-3">
                        <label for="carId" class="form-label">Car ID</label>
                        <input type="text" class="form-control" id="carId" name="carId" required>
                    </div>
                    <div class="mb-3">
                        <label for="model" class="form-label">Model</label>
                        <input type="text" class="form-control" id="model" name="model" required>
                    </div>
                    <div class="mb-3">
                        <label for="registration" class="form-label">Registration No</label>
                        <input type="text" class="form-control" id="registration" name="registration" required>
                    </div>
                    <div class="mb-3">
                        <label for="availability" class="form-label">Availability</label>
                        <select class="form-control" id="availability" name="availability">
                            <option value="Available">Available</option>
                            <option value="Not Available">Not Available</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-custom">Add Car</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
