<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.DriverDAO, com.megacitycab.model.Driver" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver - Mega City Cab</title>
    
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
        <div class="header">Edit Driver</div>

        <div class="container form-container">
            <%
                String driverId = request.getParameter("driverId");
                Driver driver = null;

                try {
                    if (driverId != null) {
                        DriverDAO driverDao = new DriverDAO();
                        driver = driverDao.getDriverById(driverId);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (driver != null) {
            %>
            <form action="EditDriverServlet" method="post">
                <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">

                <div class="mb-3">
                    <label for="dName" class="form-label">Driver Name</label>  
                    <input type="text" class="form-control" id="dName" name="driverName" value="<%= driver.getDName() %>" required> 
                
                <div class="mb-3">
                    <label for="licenseNo" class="form-label">Driver License</label> 
                    <input type="text" class="form-control" id="licenseNo" name="driverLicense" value="<%= driver.getLicenseNo() %>" required> 
                </div>
                
                <div class="mb-3">
                    <label for="contactNo" class="form-label">Driver Phone</label> 
                    <input type="text" class="form-control" id="contactNo" name="driverPhone" value="<%= driver.getContactNo() %>" required> 
                </div>

                <button type="submit" class="btn btn-warning">Update Driver</button>
            </form>
            <% 
                } else { 
            %>
            <div class="alert alert-danger" role="alert">
                Driver not found.
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
