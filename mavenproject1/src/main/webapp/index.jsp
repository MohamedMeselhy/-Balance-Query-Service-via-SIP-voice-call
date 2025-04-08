<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User Balance</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }

        .container {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #1a202c;
            color: white;
            padding: 15px;
            text-align: center;
            margin-bottom: 20px;
        }

        h2 {
            text-align: center;
            color: #2d3748;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #4a5568;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            width: 100%;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-update {
            background-color: #48bb78;
            color: white;
        }

        .btn-update:hover {
            background-color: #38a169;
        }

        .btn-back {
            background-color: #4299e1;
            color: white;
            margin-top: 10px;
            display: block;
            text-align: center;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-back:hover {
            background-color: #3182ce;
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
        <h1>Update User Balance</h1>
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

    <div class="container">
        <h2>Enter Details</h2>

        <!-- Form to update the balance -->
        <form action="update_balance" method="post">
            <label for="msisdn">MSISDN (Phone Number):</label>
            <input type="text" id="msisdn" name="msisdn" required>

            <label for="balance">New Balance:</label>
            <input type="text" id="balance" name="balance" required>

            <button type="submit" class="btn btn-update">Update Balance</button>
        </form>

        <a href="adminpage.jsp" class="btn-back">Back to Dashboard</a>
    </div>
</body>
</html>
