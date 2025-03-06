<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.DriverDAO, com.megacitycab.model.Driver, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Drivers - Mega City Cab</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #333333;
            color: white;
        }
        .main-content { 
            margin: 20px; 
        }
        .header { 
            background-color: #FFCC00; 
            padding: 10px; 
            text-align: center;
            font-size: 24px; 
            font-weight: bold;
            color: black;
            border-radius: 5px;
        }
        .table-container {
            margin-top: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            color: black;
        }
        .table th, .table td {
            text-align: left;
            padding: 15px;
        }
        .table th {
            background-color: #FFCC00;
            color: black;
        }
        .table td {
            background-color: #f8f9fa;
        }
        .btn-warning, .btn-danger {
            font-size: 12px;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="header">Driver Details</div>

        <div class="container table-container">
            <h4 class="text-center">Registered Drivers</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Driver ID</th>
                        <th>Name</th>
                        <th>License Number</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            DriverDAO driverDao = new DriverDAO();
                            List<Driver> drivers = driverDao.getAllDrivers();

                            if (drivers.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center text-danger">No drivers found.</td>
                        </tr>
                    <%
                            } else {
                                for (Driver driver : drivers) {
                    %>
                        <tr>
                            <td><%= driver.getDriverId() %></td>
                            <td><%= driver.getDName() %></td>
                            <td><%= driver.getLicenseNo() %></td>
                            <td><%= driver.getContactNo() %></td>
                            <td>
                                <a href="editDriver.jsp?driverId=<%= driver.getDriverId() %>" class="btn btn-warning btn-sm">Edit</a>
                                <form action="DeleteDriverServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this driver?');">
                                    <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <%
                                }
                            }
                        } catch (Exception e) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center text-danger">Error fetching driver data.</td>
                        </tr>
                    <%
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
            <div class="text-center">
                <a href="addDrivers.jsp" class="btn btn-success">Add New Driver</a>
                <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
