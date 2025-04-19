/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author noor
 */
@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/balance_db";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "1234";

    // Handle GET request to display the form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }

    // Handle POST request to add a new user
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msisdn = request.getParameter("msisdn");
        double balance = Double.parseDouble(request.getParameter("balance"));

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (msisdn, balance) VALUES (?, ?)");
            stmt.setString(1, msisdn);
            stmt.setDouble(2, balance);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("adminpage.jsp?success=UserAdded");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addUser.jsp?error=DatabaseError");
        }
    }
}
