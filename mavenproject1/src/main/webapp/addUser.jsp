<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>
    <style>
        /* Page Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9; /* Light gray background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container */
        .container {
            width: 40%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Form Styling */
        form {
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Button Styling */
        .btn {
            background: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .btn:hover {
            background: #218838;
        }

        .btn-secondary {
            background: #007bff;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-secondary:hover {
            background: #0056b3;
        }

        /* Error Message Styling */
        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New User</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error">Error: <%= request.getParameter("error") %></p>
        <% } %>

        <!-- Form to Add User -->
        <form action="addUser" method="POST">
            <label for="msisdn">Phone:</label>
            <input type="text" id="msisdn" name="msisdn" required>

            <label for="balance">Balance:</label>
            <input type="number" id="balance" name="balance" step="0.01" required>

            <button type="submit" class="btn">Add User</button>
        </form>

        <br>
        <a href="adminpage.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>
