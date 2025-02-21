/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Uwani Imasha
 */
@WebServlet(urlPatterns = {"/LoginServelet"})
public class LoginServelet extends HttpServlet { 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //depost method
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //accepr username and password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        //database
        try{
            //open connection
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

    /**
     * Returns a short description of the .
     *
     * @return a String containing  description
     */
   

    }}
