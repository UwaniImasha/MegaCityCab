<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver - Mega City Cab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #333333; font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .container { max-width: 600px; width: 100%; padding: 40px; background-color: white; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }
        h2 { text-align: center; color: #FFCC00; }
        .btn-custom { background-color: #FFCC00; color: white; border: 1px solid #FFCC00; width: 100%; }
        .btn-custom:hover { background-color: #E6B800; color: black; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Driver Details</h2>
        <%
            String driverId = request.getParameter("id");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String name = "", phone = "", carAssigned = "";

            try {
                // Database connection
                String dbURL = "jdbc:mysql://localhost:3306/megacitycab";
                String dbUser = "root";
                String dbPassword = "";
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String sql = "SELECT * FROM drivers WHERE driver_id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, driverId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    name = rs.getString("name");
                    phone = rs.getString("phone");
                    carAssigned = rs.getString("car_assigned");
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
        <form action="UpdateDriverServlet" method="POST">
            <input type="hidden" name="driverId" value="<%= driverId %>">
            <div class="mb-3">
                <label for="name" class="form-label">Driver Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= name %>" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" id="phone" name="phone" class="form-control" value="<%= phone %>" required>
            </div>
            <div class="mb-3">
                <label for="carAssigned" class="form-label">Car Assigned</label>
                <input type="text" id="carAssigned" name="carAssigned" class="form-control" value="<%= carAssigned %>" required>
            </div>
            <button type="submit" class="btn btn-custom">Update Driver</button>
        </form>
    </div>
</body>
</html>
