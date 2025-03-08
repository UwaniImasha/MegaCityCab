<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.BookingDAO, com.megacitycab.model.Booking" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking - Mega City Cab</title>
    
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
        <div class="header">Edit Booking</div>

        <div class="container form-container">
            <%
                String bookingNumber = request.getParameter("bookingNumber"); // bookingNumber is a String
                Booking booking = null;

                try {
                    if (bookingNumber != null) {
                        BookingDAO bookingDao = new BookingDAO();
                        booking = bookingDao.getBookingByBookingNumber(bookingNumber); // Pass bookingNumber as a String
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (booking != null) {
            %>
            <form action="EditBookingServlet" method="post">
                <input type="hidden" name="bookingNumber" value="<%= booking.getBookingNumber() %>">

                <div class="mb-3">
                    <label for="customerId" class="form-label">Customer ID</label>
                    <input type="text" class="form-control" id="customerId" name="customerId" value="<%= booking.getCustomerId() %>" required>
                </div>

                <div class="mb-3">
                    <label for="driverId" class="form-label">Driver ID</label>
                    <input type="text" class="form-control" id="driverId" name="driverId" value="<%= booking.getDriverId() %>" required>
                </div>

                <div class="mb-3">
                    <label for="carId" class="form-label">Car ID</label>
                    <input type="text" class="form-control" id="carId" name="carId" value="<%= booking.getCarId() %>" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<%= booking.getPhone() %>" required>
                </div>

                <div class="mb-3">
                    <label for="pickupLocation" class="form-label">Pickup Location</label>
                    <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" value="<%= booking.getPickupLocation() %>" required>
                </div>

                <div class="mb-3">
                    <label for="destination" class="form-label">Destination</label>
                    <input type="text" class="form-control" id="destination" name="destination" value="<%= booking.getDestination() %>" required>
                </div>

                <div class="mb-3">
                    <label for="dateTime" class="form-label">Date & Time</label>
                    <input type="text" class="form-control" id="dateTime" name="dateTime" value="<%= booking.getDateTime() %>" required>
                </div>

                <div class="mb-3">
                    <label for="fare" class="form-label">Fare</label>
                    <input type="text" class="form-control" id="fare" name="fare" value="<%= booking.getFare() %>" required>
                </div>

                <button type="submit" class="btn btn-warning">Update Booking</button>
            </form>
            <% 
                } else { 
            %>
            <div class="alert alert-danger" role="alert">
                Booking not found.
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
