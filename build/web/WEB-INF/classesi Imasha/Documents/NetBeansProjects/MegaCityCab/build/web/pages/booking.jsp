<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.BookingDAO, com.megacitycab.model.Booking, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
    
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

        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
            width: auto;
            min-width: 200px;
        }
    </style>
</head>

<body>

    <div class="main-content">
        <div class="header">Booking Details</div>

        <!-- Success Alert Message -->
        <%
            String success = request.getParameter("success");
            if ("true".equals(success)) {
        %>
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                Booking added successfully!
            </div>
        <%
            }
        %>

        <div class="container table-container">
            <h4 class="text-center">Booking Information</h4>

            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Booking Number</th>
                        <th>Customer ID</th>
                        <th>Driver ID</th>
                        <th>Car ID</th>
                        <th>Pickup Location</th>
                        <th>Destination</th>
                        <th>Date & Time</th>
                        <th>Fare</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            BookingDAO bookingDao = BookingDAO.getInstance();
                            List<Booking> bookings = bookingDao.getAllBookings();

                            if (bookings.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="9" class="text-center text-danger">No bookings found.</td>
                        </tr>
                    <%
                            } else {
                                for (Booking booking : bookings) {
                    %>
                        <tr>
                            <td><%= booking.getBookingNumber() %></td>
                            <td><%= booking.getCustomerId() %></td>
                            <td><%= booking.getDriverId() %></td>
                            <td><%= booking.getCarId() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getDestination() %></td>
                            <td><%= booking.getDateTime() %></td>
                            <td><%= booking.getFare() %></td>
                            <td class="action-buttons">
                                <!-- Edit Button -->
                                <a href="editBooking.jsp?bookingNumber=<%= booking.getBookingNumber() %>" class="btn btn-warning btn-sm">Edit</a>
                                
                                <!-- Delete Button with Confirmation -->
                                <form action="DeleteBookingServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this booking?');">
                                    <input type="hidden" name="bookingNumber" value="<%= booking.getBookingNumber() %>">
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
                            <td colspan="9" class="text-center text-danger">Error fetching booking data.</td>
                        </tr>
                    <%
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>

            <div class="text-center">
                <a href="addBooking.jsp" class="btn btn-success">Add New Booking</a>
                <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
            </div>

        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // auto dismiss success alert after 2 seconds
        setTimeout(function() {
            var alert = document.getElementById('successAlert');
            if (alert) {
                alert.classList.remove('show');
            }
        }, 2000); // 2 seconds
    </script>

</body>
</html>
