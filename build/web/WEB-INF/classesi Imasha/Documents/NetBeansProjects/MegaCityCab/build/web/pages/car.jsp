<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.CarDAO, com.megacitycab.model.Car, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cars - Mega City Cab</title>
    
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

        .action-buttons {
            display: flex;
            justify-content: space-between;
        }

        .btn-custom {
            background-color: #28b463;
            color: white;
            border: 1px solid #28b463;
            padding: 4px 12px;
            font-size: 12px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            height: 30px;
        }

        .btn-custom:hover {
            background-color: #229954;
            color: black;
            border-color: #229954;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
            border: 1px solid #e74c3c;
            padding: 4px 12px;
            font-size: 12px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            height: 30px;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b;
        }

        .text-center .btn {
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <div class="main-content">
        <div class="header">Car Details</div>

        <div class="container table-container">
            <h4 class="text-center">Registered Cars</h4>

            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Car ID</th>
                        <th>Model</th>
                        <th>Registration No</th>
                        <th>Car Type</th>
                        <th>Model Year</th>
                        <th>Fuel Type</th>
                        <th>Availability</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            CarDAO carDao = CarDAO.getInstance();
                            List<Car> cars = carDao.getAllCars();

                            if (cars.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="8" class="text-center text-danger">No cars found.</td>
                        </tr>
                    <%
                            } else {
                                for (Car car : cars) {
                    %>
                        <tr>
                            <td><%= car.getCarId() %></td>
                            <td><%= car.getModel() %></td>
                            <td><%= car.getRegistrationNo() %></td>
                            <td><%= car.getCarType() %></td>
                            <td><%= car.getModelYear() %></td>
                            <td><%= car.getFuelType() %></td>
                            <td><%= car.getAvailability() %></td>
                            <td class="action-buttons">
                                <!-- Edit Button -->
                                <a href="editCar.jsp?carId=<%= car.getCarId() %>" class="btn btn-warning btn-sm">Edit</a>
                                

                                <!-- Delete Button with Confirmation -->
                                <form action="DeleteCarServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this car?');">
                                    <input type="hidden" name="carId" value="<%= car.getCarId() %>">
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
                            <td colspan="8" class="text-center text-danger">Error fetching car data.</td>
                        </tr>
                    <%
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>

            <div class="text-center">
                <a href="addCar.jsp" class="btn btn-success">Add New Car</a>
                <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
            </div>

        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
