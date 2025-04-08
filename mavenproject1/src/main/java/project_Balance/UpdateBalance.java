/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project_Balance;

import Databaseconnection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/update_balance")
public class UpdateBalance extends HttpServlet {

    // Method to handle POST requests (form submissions)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Extract MSISDN and balance values from the form
        String msisdn = request.getParameter("msisdn");
        String balance = request.getParameter("balance");

        // Update the balance in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("UPDATE users SET balance=? WHERE msisdn=?");
            stmt.setBigDecimal(1, new java.math.BigDecimal(balance)); // Set the new balance
            stmt.setString(2, msisdn); // Set the MSISDN
            stmt.executeUpdate(); // Execute the update query
        } catch (Exception e) {
            e.printStackTrace();
        }

        // After updating the balance, redirect the user back to the form page
        response.sendRedirect("index.html"); // The form page where user can input data
    }
}
