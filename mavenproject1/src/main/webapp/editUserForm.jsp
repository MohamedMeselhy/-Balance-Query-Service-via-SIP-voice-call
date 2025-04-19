<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5); /* soft blue gradient */
            margin: 0;
            padding: 0;
        }

        .header, .footer {
            background-color: #1a202c;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        .container {
            max-width: 450px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
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
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .btn {
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            background-color: #28a745;
            color: white;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #007bff;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            margin-top: 10px;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Edit User Details</h1>
</div>

<div class="container">
    <form action="updateUser" method="POST">
        <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">

        <label for="msisdn">MSISDN (Phone):</label>
        <input type="text" id="msisdn" name="msisdn" value="<%= request.getAttribute("msisdn") %>" required pattern="\d+" inputmode="numeric">

        <label for="balance">Balance:</label>
        <input type="number" step="0.01" id="balance" name="balance" value="<%= request.getAttribute("balance") %>" required>

        <button type="submit" class="btn">✅ Update User</button>
        <a href="adminpage.jsp" class="btn btn-secondary">⬅️ Back to Dashboard</a>
    </form>
</div>

<div class="footer">
    <p>&copy; 2025 User Balance Management System</p>
</div>

</body>
</html>