<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.megacitycab.dao.CustomerDAO, com.megacitycab.model.Customer" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer - Mega City Cab</title>
    
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
        <div class="header">Edit Customer</div>

        <div class="container form-container">
            <%
                String customerId = request.getParameter("customerId"); // customerId is a String
                Customer customer = null;

                try {
                    if (customerId != null) {
                        CustomerDAO customerDao = new CustomerDAO();
                        customer = customerDao.getCustomerById(customerId); // Pass customerId as a String
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (customer != null) {
            %>
            <form action="EditCustomerServlet" method="post">
                <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">

                <div class="mb-3">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" class="form-control" id="customerName" name="customerName" value="<%= customer.getCustomerName() %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="customerAddress" class="form-label">Customer Address</label>
                    <input type="text" class="form-control" id="customerAddress" name="customerAddress" value="<%= customer.getCustomerAddress() %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="customerPhone" class="form-label">Customer Phone</label>
                    <input type="text" class="form-control" id="customerPhone" name="customerPhone" value="<%= customer.getCustomerPhone() %>" required>
                </div>

                <button type="submit" class="btn btn-warning">Update Customer</button>
            </form>
            <% 
                } else { 
            %>
            <div class="alert alert-danger" role="alert">
                Customer not found.
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
