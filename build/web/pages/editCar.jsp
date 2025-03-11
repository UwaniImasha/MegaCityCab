<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.CarDAO, com.megacitycab.model.Car" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car - Mega City Cab</title>

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
        .form-container {
            margin-top: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            color: black;
        }
    </style>
</head>

<body>

    <div class="main-content">
        <div class="header">Edit Car</div>

        <div class="container form-container">
            <%
                String carId = request.getParameter("carId"); 
                Car car = null;

                try {
                    if (carId != null) {
                        CarDAO carDao = CarDAO.getInstance();
                        car = carDao.getCarById(carId); 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (car != null) {
            %>
            <form action="EditCarServlet" method="post">
                <input type="hidden" name="carId" value="<%= car.getCarId() %>">

                <div class="mb-3">
                    <label for="model" class="form-label">Car Model</label>
                    <input type="text" class="form-control" id="model" name="model" value="<%= car.getModel() %>" required>
                </div>

                <div class="mb-3">
                    <label for="registrationNo" class="form-label">Registration Number</label>
                    <input type="text" class="form-control" id="registrationNo" name="registrationNo" value="<%= car.getRegistrationNo() %>" required>
                </div>

                <!-- Car Type Dropdown -->
                <div class="mb-3">
                    <label for="carType" class="form-label">Car Type</label>
                    <select class="form-control" id="carType" name="carType" required>
                        <option value="Sedan" <%= "Sedan".equals(car.getCarType()) ? "selected" : "" %>>Sedan</option>
                        <option value="SUV" <%= "SUV".equals(car.getCarType()) ? "selected" : "" %>>SUV</option>
                        <option value="Hatchback" <%= "Hatchback".equals(car.getCarType()) ? "selected" : "" %>>Hatchback</option>
                        <option value="Van" <%= "Van".equals(car.getCarType()) ? "selected" : "" %>>Van</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="modelYear" class="form-label">Model Year</label>
                    <input type="text" class="form-control" id="modelYear" name="modelYear" value="<%= car.getModelYear() %>" required>
                </div>

                <!-- Fuel Type Dropdown -->
                <div class="mb-3">
                    <label for="fuelType" class="form-label">Fuel Type</label>
                    <select class="form-control" id="fuelType" name="fuelType" required>
                        <option value="Petrol" <%= "Petrol".equals(car.getFuelType()) ? "selected" : "" %>>Petrol</option>
                        <option value="Diesel" <%= "Diesel".equals(car.getFuelType()) ? "selected" : "" %>>Diesel</option>
                        <option value="Electric" <%= "Electric".equals(car.getFuelType()) ? "selected" : "" %>>Electric</option>
                        <option value="Hybrid" <%= "Hybrid".equals(car.getFuelType()) ? "selected" : "" %>>Hybrid</option>
                    </select>
                </div>

                <!-- Availability Dropdown -->
                <div class="mb-3">
                    <label for="availability" class="form-label">Availability</label>
                    <select class="form-control" id="availability" name="availability" required>
                        <option value="Available" <%= "Available".equals(car.getAvailability()) ? "selected" : "" %>>Available</option>
                        <option value="Unavailable" <%= "Unavailable".equals(car.getAvailability()) ? "selected" : "" %>>Unavailable</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-warning">Update Car</button>
            </form>
            <% 
                } else { 
            %>
            <div class="alert alert-danger" role="alert">
                Car not found.
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
