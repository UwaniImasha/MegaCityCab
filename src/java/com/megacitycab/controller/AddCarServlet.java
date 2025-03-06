package com.megacitycab.controller;

import com.megacitycab.dao.CarDAO;
import com.megacitycab.model.Car;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCarServlet")
public class AddCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String carId = request.getParameter("carId");
        String model = request.getParameter("model");
        String registrationNo = request.getParameter("registrationNo");
        String carType = request.getParameter("carType");
        String modelYearStr = request.getParameter("modelYear");
        String fuelType = request.getParameter("fuelType");
        String availability = request.getParameter("availability");

        // Log input data for debugging
        System.out.println("Received car data:");
        System.out.println("Car ID: " + carId);
        System.out.println("Model: " + model);
        System.out.println("Registration No: " + registrationNo);
        System.out.println("Car Type: " + carType);
        System.out.println("Model Year: " + modelYearStr);
        System.out.println("Fuel Type: " + fuelType);
        System.out.println("Availability: " + availability);

        // Input validation
        if (carId == null || model == null || registrationNo == null || carType == null ||
            modelYearStr == null || fuelType == null || availability == null ||
            carId.isEmpty() || model.isEmpty() || registrationNo.isEmpty() || carType.isEmpty() ||
            modelYearStr.isEmpty() || fuelType.isEmpty() || availability.isEmpty()) {
            response.sendRedirect("addCar.jsp?error=All fields are required!");
            return;
        }

        // Validate modelYear as an integer
        int modelYear;
        try {
            modelYear = Integer.parseInt(modelYearStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("addCar.jsp?error=Invalid model year format.");
            return;
        }

        try {
            // Create a new car object
            Car car = new Car(carId, model, registrationNo, carType, modelYear, fuelType, availability);

            // Create a DAO instance to interact with the database
            CarDAO carDao = new CarDAO();

            // Try to add the car
            boolean success = carDao.addCar(car);

            // Redirect to car.jsp after successful addition
            if (success) {
                response.sendRedirect("pages/car.jsp?success=true");
            } else {
                response.sendRedirect("addCar.jsp?error=Failed to add car.");
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the operation
            e.printStackTrace();
            response.sendRedirect("addCar.jsp?error=" + e.getMessage());
        }
    }
}
