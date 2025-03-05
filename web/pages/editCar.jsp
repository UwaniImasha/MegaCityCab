<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car - Mega City Cab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background-color: #333333; 
            font-family: 'Arial', sans-serif; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        }
        .container { 
            max-width: 600px;
            width: 100%; 
            padding: 40px; 
            background-color: white; 
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); 
            border-radius: 8px; 
        }
        h2 { 
            text-align: center; 
            color: #FFCC00; 
        }
        .btn-custom { 
            background-color: #FFCC00; 
            color: white; 
            border: 1px solid #FFCC00; 
            width: 100%; 
        }
        .btn-custom:hover { 
            background-color: #E6B800; 
            color: black; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Car Details</h2>
        <%
            String carId = request.getParameter("id");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String model = "", plate = "", status = "";

            try {
                // Database connection
                String dbURL = "jdbc:mysql://localhost:3306/megacitycab";
                String dbUser = "root";
                String dbPassword = "";
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String sql = "SELECT * FROM cars WHERE car_id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, carId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    model = rs.getString("model");
                    plate = rs.getString("plate_number");
                    status = rs.getString("status");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <form action="UpdateCarServlet" method="POST">
            <input type="hidden" name="carId" value="<%= carId %>">
            <div class="mb-3">
                <label for="model" class="form-label">Car Model</label>
                <input type="text" id="model" name="model" class="form-control" value="<%= model %>" required>
            </div>
            <div class="mb-3">
                <label for="plate" class="form-label">Plate Number</label>
                <input type="text" id="plate" name="plate" class="form-control" value="<%= plate %>" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select id="status" name="status" class="form-control">
                    <option value="Available" <%= status.equals("Available") ? "selected" : "" %>>Available</option>
                    <option value="Unavailable" <%= status.equals("Unavailable") ? "selected" : "" %>>Unavailable</option>
                </select>
            </div>
            <button type="submit" class="btn btn-custom">Update Car</button>
        </form>
    </div>
</body>
</html>
