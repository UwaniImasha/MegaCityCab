<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Summary - Mega City Cab</title>
    
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
        .table th, .table td {
            font-size: 18px;
        }
        /* Hide print button when printing */
        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>

<body>

    <div class="main-content">
        <div class="header">Bill Summary</div>

        <div class="container form-container">
            <h4 class="text-center">Final Bill Details</h4>

            <table class="table table-bordered">
                <tr>
                    <th>Booking Number</th>
                    <td><%= request.getAttribute("bookingNumber") %></td>
                </tr>
                <tr>
                    <th>Original Fare</th>
                    <td>Rs. <%= request.getAttribute("originalFare") %></td>
                </tr>
                <tr>
                    <th>Discount Amount</th>
                    <td>- Rs. <%= request.getAttribute("discountAmount") %></td>
                </tr>
                <tr>
                    <th>Tax Amount</th>
                    <td>+ Rs. <%= request.getAttribute("taxAmount") %></td>
                </tr>
                <tr>
                    <th><b>Final Bill</b></th>
                    <td><b>Rs. <%= request.getAttribute("finalBill") %></b></td>
                </tr>
            </table>

            <!-- Buttons -->
            <div class="text-center mt-4 no-print">
                <button onclick="window.print()" class="btn btn-success">Print Bill</button>
                <a href="pages/booking.jsp" class="btn btn-primary">Back to Bookings</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
