<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #cfd9df);
        }

        .header, .footer {
            background-color: #1a202c;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2d3748;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin: 2px;
            text-decoration: none;
        }

        .btn-edit { background-color: #4299e1; color: white; }
        .btn-delete { background-color: #f56565; color: white; }
        .btn-update { background-color: #48bb78; color: white; }

        .alert {
            padding: 12px;
            border-radius: 5px;
            margin: 10px 0;
            font-weight: bold;
            text-align: center;
        }

        .success { background-color: #48bb78; color: white; }
        .error { background-color: #f56565; color: white; }

        .action-buttons {
            display: flex;
            justify-content: center;
        }

        .footer {
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Admin Dashboard</h1>
</div>

<%
    String successMessage = request.getParameter("success");
    String errorMessage = request.getParameter("error");
    if (successMessage != null) {
%>
    <div class="alert success">✅ <%= successMessage %></div>
<%
    } else if (errorMessage != null) {
%>
    <div class="alert error">❌ <%= errorMessage %></div>
<% } %>

<%@ page import="java.sql.*" %>
<%
    String dbUrl = "jdbc:postgresql://localhost:5432/balance_db";
    String dbUser = "postgres";
    String dbPassword = "noor";

    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id, msisdn, balance FROM users");

        StringBuilder tableContent = new StringBuilder();
        while(rs.next()) {
            tableContent.append("<tr>");
            tableContent.append("<td>").append(rs.getInt("id")).append("</td>");
            tableContent.append("<td>").append(rs.getString("msisdn")).append("</td>");
            tableContent.append("<td>$").append(rs.getDouble("balance")).append("</td>");
            tableContent.append("<td class='action-buttons'>");
            tableContent.append("<form action='editUser' method='POST' style='display:inline;'>");
            tableContent.append("<input type='hidden' name='userId' value='").append(rs.getInt("id")).append("'>");
            tableContent.append("<input type='submit' value='Edit' class='btn btn-edit'>");
            tableContent.append("</form>");
            tableContent.append("<form action='deleteUser' method='POST' style='display:inline;' onsubmit='return confirm(\"Are you sure?\")'>");
            tableContent.append("<input type='hidden' name='userId' value='").append(rs.getInt("id")).append("'>");
            tableContent.append("<input type='submit' value='Delete' class='btn btn-delete'>");
            tableContent.append("</form>");
            tableContent.append("</td>");
            tableContent.append("</tr>");
        }
        pageContext.setAttribute("tableContent", tableContent.toString());

        rs.close();
        stmt.close();
        conn.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<div class="container">
    <h2>User Management</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Phone</th>
            <th>Balance</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%= pageContext.getAttribute("tableContent") %>
        </tbody>
    </table>

    <div style="text-align: center; margin-top: 20px;">
        <form action="addUser" method="GET" style="display:inline;">
            <input type="submit" value="Add New User" class="btn btn-update">
        </form>
        <a href="index.html" class="btn btn-edit">Back to Home</a>
    </div>
</div>

<div class="footer">
    <p>&copy; 2025 Balance Query System - All Rights Reserved</p>
</div>

</body>
</html>