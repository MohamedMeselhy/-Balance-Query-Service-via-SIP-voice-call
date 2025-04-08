<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <style>
        /* Page Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9; /* Light Gray Background */
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
            background: #007bff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .btn:hover {
            background: #0056b3;
        }

        .btn-secondary {
            background: #6c757d;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit User</h2>
        <form action="updateUser" method="POST">
            <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">

            <label>MSISDN:</label>
            <input type="text" name="msisdn" value="<%= request.getAttribute("msisdn") %>" required>

            <label>Balance:</label>
            <input type="number" step="0.01" name="balance" value="<%= request.getAttribute("balance") %>" required>

            <br>
            <button type="submit" class="btn">Update User</button>
        </form>
        
        <br>
        <a href="adminpage.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>
