<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User Balance</title>
    <style>
        /* Reset and Global Styles */
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header, .footer {
            background-color: #1a202c;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            flex: 1;
            max-width: 500px;
            background-color: white;
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
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
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn {
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            width: 100%;
            transition: 0.3s ease;
        }

        .btn-update {
            background-color: #28a745;
            color: white;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 15px;
            padding: 12px;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 6px;
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

    <form action="update_balance" method="post">
        <label for="msisdn">MSISDN (Phone Number):</label>
<input
    type="text"
    id="msisdn"
    name="msisdn"
    required
    pattern="\d+"
    inputmode="numeric"
    oninput="this.value = this.value.replace(/[^0-9]/g, '')"
    placeholder="Enter numbers only"
    />

        <label for="balance">New Balance:</label>
        <input type="text" id="balance" name="balance" required pattern="^\d+(\.\d{1,2})?$" inputmode="decimal">

        <button type="submit" class="btn btn-update">💾 Update Balance</button>
    </form>

    <a href="adminpage.jsp" class="btn-back">⬅️ Back to Dashboard</a>
</div>

<div class="footer">
    <p>&copy; 2025 Balance Management System | All Rights Reserved</p>
</div>

</body>
</html>