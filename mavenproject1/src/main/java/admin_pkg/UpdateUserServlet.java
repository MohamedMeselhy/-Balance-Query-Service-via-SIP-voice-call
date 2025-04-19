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
@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/balance_db";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String msisdn = request.getParameter("msisdn");
        double balance = Double.parseDouble(request.getParameter("balance"));

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement stmt = conn.prepareStatement("UPDATE users SET msisdn = ?, balance = ? WHERE id = ?");
            stmt.setString(1, msisdn);
            stmt.setDouble(2, balance);
            stmt.setInt(3, userId);

            int rowsUpdated = stmt.executeUpdate();
            stmt.close();
            conn.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("adminpage.jsp?success=UserUpdated");
            } else {
                response.sendRedirect("editUserForm.jsp?error=UpdateFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editUserForm.jsp?error=DatabaseError");
        }
    }
}