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
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/balance_db";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "1234";

    // Handle POST request for deleting a user
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = conn.prepareStatement("DELETE FROM users WHERE id = ?");
            stmt.setInt(1, userId);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            // Redirect to admin page after successful deletion
            response.sendRedirect("adminpage.jsp?success=UserDeleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminpage.jsp?error=DatabaseError");
        }
    }
}
