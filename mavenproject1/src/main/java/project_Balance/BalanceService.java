/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project_Balance;
import Databaseconnection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/api/balance")
public class BalanceService extends HttpServlet {

    // Method to handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Extract MSISDN (Mobile number) from the query parameters
        String msisdn = request.getParameter("msisdn");

        // Fetch balance from the database using MSISDN
        String balance = getBalanceFromDB(msisdn);

        // Set response type as plain text
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
        // Send the balance as the response
        out.print(balance);
    }

    // Helper method to fetch balance from the database
    private String getBalanceFromDB(String msisdn) {
        String balance = "0.00"; // Default balance if not found

        // Database query to fetch the balance for the given MSISDN
        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT balance FROM users WHERE msisdn = ?");
            stmt.setString(1, msisdn);
            ResultSet rs = stmt.executeQuery();

            // If record is found, return the balance value
            if (rs.next()) {
                balance = rs.getString("balance");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Return the balance (or default if not found)
        return balance;
    }
}
