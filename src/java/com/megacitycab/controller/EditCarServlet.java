package com.megacitycab.controller;

import com.megacitycab.dao.CarDAO;
import com.megacitycab.model.Car;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/pages/EditCarServlet")
public class EditCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId = request.getParameter("carId");
        String model = request.getParameter("model");
        String registrationNo = request.getParameter("registrationNo");
        String carType = request.getParameter("carType");
        String modelYearStr = request.getParameter("modelYear");
        String fuelType = request.getParameter("fuelType");
        String availability = request.getParameter("availability"); // Now handled as a String

        // Validate inputs
        if (carId == null || model == null || registrationNo == null || carType == null ||
            modelYearStr == null || fuelType == null || availability == null ||
            carId.isEmpty() || model.isEmpty() || registrationNo.isEmpty() || carType.isEmpty() ||
            modelYearStr.isEmpty() || fuelType.isEmpty() || availability.isEmpty()) {
            response.sendRedirect("editCar.jsp?carId=" + carId + "&error=All fields are required!");
            return;
        }

        // Convert modelYear to int
        int modelYear;
        try {
            modelYear = Integer.parseInt(modelYearStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("editCar.jsp?carId=" + carId + "&error=Invalid model year format.");
            return;
        }

        try {
            // Create Car object
            Car car = new Car(carId, model, registrationNo, carType, modelYear, fuelType, availability);

            // Update in the database
            CarDAO carDao = new CarDAO();
            boolean isUpdated = carDao.updateCar(car);

            // Redirect based on update success or failure
            if (isUpdated) {
                response.sendRedirect("car.jsp?carId=" + carId + "&success=true");
            } else {
                response.sendRedirect("editCar.jsp?carId=" + carId + "&error=Failed to update car.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editCar.jsp?carId=" + carId + "&error=" + e.getMessage());
        }
    }
}
