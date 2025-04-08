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
        }

        .container {
            padding: 20px;
        }

        .header {
            background-color: #1a202c;
            color: white;
            padding: 15px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .table-auto th,
        .table-auto td {
            border: 1px solid #e2e8f0;
            padding: 8px;
            text-align: left;
        }

        .table-auto th {
            background-color: #2d3748;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.25rem;
            transition: background-color 0.3s ease, color 0.3s ease;
            cursor: pointer;
            display: inline-block;
            font-weight: bold;
            margin-bottom: 0.5rem;
            text-decoration: none;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-edit {
            background-color: #4299e1;
            color: white;
        }

        .btn-delete {
            background-color: #f56565;
            color: white;
        }

        .btn-update {
            background-color: #48bb78;
            color: white;
        }

        .dark {
            background-color: #1a202c;
            color: #fff;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        .success {
            background-color: #48bb78;
            color: white;
        }

        .error {
            background-color: #f56565;
            color: white;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>

    <%-- Display Success or Error Messages --%>
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
                tableContent.append("<td>");
                tableContent.append("<form action='editUser' method='POST' style='display: inline;'>");
                tableContent.append("<input type='hidden' name='userId' value='").append(rs.getInt("id")).append("'>");
                tableContent.append("<input type='submit' value='Edit' class='btn btn-edit'>");
                tableContent.append("</form>");
                tableContent.append("<form action='deleteUser' method='POST' style='display: inline;' onsubmit='return confirm(\"Are you sure you want to delete this user?\")'>");
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
        <table class="table-auto">
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

        <div style="margin-top: 20px;">
            <form action="addUser" method="GET">
                <input type="submit" value="Add New User" class="btn btn-update">
            </form>
        </div>

        <div style="margin-top: 20px;">
            <a href="index.html" class="btn btn-edit">Back to Home</a>
        </div>
    </div>
</body>
</html>
