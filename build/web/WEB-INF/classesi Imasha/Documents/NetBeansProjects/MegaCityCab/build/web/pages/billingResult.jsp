<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Result - Mega City Cab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #333; color: white;">

    <div class="container mt-4">
        <h4>Billing Summary</h4>
        <div class="card p-4">
            <h5>Booking Number: ${bookingNumber}</h5>
            <p><strong>Base Fare:</strong> $${baseFare}</p>
            <p><strong>Tax:</strong> $${tax}</p>
            <p><strong>Discount:</strong> $${discount}</p>
            <p><strong>Total Bill:</strong> $${totalBill}</p>
        </div>

        <a href="dashboard.jsp" class="btn btn-primary mt-3">Go to Dashboard</a>
    </div>

</body>
</html>
