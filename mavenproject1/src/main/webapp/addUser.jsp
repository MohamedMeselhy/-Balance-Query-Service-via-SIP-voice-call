<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #ffffff);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header, .footer {
            background-color: #1a202c;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 500px;
            margin: auto;
            margin-top: 40px;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        .btn {
            padding: 12px;
            font-size: 16px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #007bff;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }

        .footer {
            margin-top: auto;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Balance Query System</h1>
</div>

<div class="container">
    <h2>Add New User</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error">❌ Error: <%= request.getParameter("error") %></p>
    <% } %>

    <form action="addUser" method="POST">
        <label for="msisdn">Phone:</label>
        <input placeholder="please enter only number" type="number" id="msisdn" name="msisdn" required pattern="\d+" inputmode="numeric">


        <label for="balance">Balance:</label>
        <input type="number" id="balance" name="balance" step="0.01" required>

        <button type="submit" class="btn">Add User</button>
    </form>

    <a href="adminpage.jsp" class="btn btn-secondary" style="margin-top: 15px;">Back to Dashboard</a>
</div>

<div class="footer">
    <p>&copy; 2025 Balance Query System - All Rights Reserved</p>
</div>

</body>
</html>