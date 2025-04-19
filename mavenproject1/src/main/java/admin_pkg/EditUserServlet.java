/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author noor
 */
@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/balance_db";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Fetch user details based on 'id'
            String sql = "SELECT id, msisdn, balance FROM users WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("userId", rs.getInt("id"));
                request.setAttribute("msisdn", rs.getString("msisdn"));
                request.setAttribute("balance", rs.getDouble("balance"));
                request.getRequestDispatcher("editUserForm.jsp").forward(request, response);
            } else {
                response.sendRedirect("adminDashboard.jsp?error=UserNotFound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminpage.jsp?error=DatabaseError");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
