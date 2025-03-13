<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculate Bill - Mega City Cab</title>
    
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
        .container {
            margin-top: 20px;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            color: black;
        }
        .form-label {
            color: black;
        }
        .btn-custom {
            background-color: #28b463;
            color: white;
            border: 1px solid #28b463;
            padding: 4px 12px;
            font-size: 12px;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #229954;
            border-color: #229954;
        }
        .text-center .btn {
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <div class="main-content">
        <div class="header">Calculate Bill</div>

        <div class="container form-container">
            <form action="/MegaCityCab/processBillServlet" method="post">
                <div class="mb-3">
                    <label for="bookingNumber" class="form-label">Booking Number</label>
                    <input type="text" class="form-control" id="bookingNumber" name="bookingNumber" value="<%= request.getParameter("bookingNumber") %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="fare" class="form-label">Fare</label>
                    <input type="text" class="form-control" id="fare" name="fare" value="<%= request.getParameter("fare") %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="discount" class="form-label">Discount</label>
                    <input type="text" class="form-control" id="discount" name="discount" value="0">

                </div>

                <div class="mb-3">
                    <label for="taxes" class="form-label">Taxes</label>
                    <input type="text" class="form-control" id="taxes" name="taxes" value="0">
                </div>

                <button type="submit" class="btn btn-custom">Submit</button>
            </form>

            <div class="text-center mt-4">
                <a href="booking.jsp" class="btn btn-primary">Back to Bookings</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
