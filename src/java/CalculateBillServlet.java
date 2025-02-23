import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DecimalFormat;

@WebServlet("/calculateBillServlet") // URL pattern directly in the annotation
public class CalculateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your logic for bill calculation
        String bookingNumber = request.getParameter("bookingNumber");
        double distance = Double.parseDouble(request.getParameter("distance"));
        double taxPercentage = Double.parseDouble(request.getParameter("tax"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        // Calculate total bill
        double baseFare = distance * 10; // Sample fare per km
        double tax = (taxPercentage / 100) * baseFare;
        double totalBill = baseFare + tax - discount;

        // Format the result
        DecimalFormat df = new DecimalFormat("###.##");

        // Set the result as request attributes
        request.setAttribute("bookingNumber", bookingNumber);
        request.setAttribute("baseFare", df.format(baseFare));
        request.setAttribute("tax", df.format(tax));
        request.setAttribute("discount", df.format(discount));
        request.setAttribute("totalBill", df.format(totalBill));

        // Forward to the result page
        RequestDispatcher dispatcher = request.getRequestDispatcher("billingResult.jsp");
        dispatcher.forward(request, response);
    }
}
