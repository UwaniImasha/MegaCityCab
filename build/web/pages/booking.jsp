<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
    <!-- Bootstrap -->
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

        .customer-container {
            max-width: 900px;
            width: 100%;
            padding: 40px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .customer-container h2 {
            text-align: center;
            color: #FFCC00;
        }

        .table th, .table td {
            text-align: left;
            padding: 15px;
        }

        .table th {
            background-color: #FFCC00;
            color: white;
        }

        .table td {
            background-color: #f8f9fa;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
        }

        /* Custom Button */
        /* Custom Button */
        .btn-custom {
            background-color: #FFCC00;
            color: white;
            border: 1px solid #FFCC00; /* Border added to create a neat outline */
            padding: 4px 12px; /* Compact padding with more horizontal space */
            font-size: 12px; /* Slightly increased font size for better readability */
            border-radius: 5px; /* More rounded corners for smooth appearance */
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            height: 30px; /* Explicit height for button consistency */
        }

        .btn-custom:hover {
            background-color: #E6B800;
            color: black;
            border-color: #E6B800; /* Change border color on hover */
        }

        /* Danger Button (Remove button) */
        .btn-danger {
            background-color: #e74c3c;
            color: white;
            border: 1px solid #e74c3c; /* Border added to create neat outline */
            padding: 4px 12px; /* Compact padding with more horizontal space */
            font-size: 12px; /* Consistent font size */
            border-radius: 5px; /* More rounded corners for smooth appearance */
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            height: 30px; /* Explicit height for button consistency */
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b; /* Change border color on hover */
        }

    </style>
</head>

<body>
    <div class="customer-container">
        <h2>Booking List</h2>
        <!-- Customers table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example customer row -->
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john.doe@example.com</td>
                    <td>+1234567890</td>
                    <td class="action-buttons">
                        <a href="editCustomer.jsp?id=1" class="btn btn-custom">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="DeleteCustomerServlet?id=1" class="btn btn-danger">
                            <i class="fas fa-trash"></i> Remove
                        </a>
                    </td>
                </tr>

                <!-- Example customer row -->
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane.smith@example.com</td>
                    <td>+9876543210</td>
                    <td class="action-buttons">
                        <a href="editCustomer.jsp?id=2" class="btn btn-custom">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="DeleteCustomerServlet?id=2" class="btn btn-danger">
                            <i class="fas fa-trash"></i> Remove
                        </a>
                    </td>
                </tr>

                <!-- Additional rows can go here -->

            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
