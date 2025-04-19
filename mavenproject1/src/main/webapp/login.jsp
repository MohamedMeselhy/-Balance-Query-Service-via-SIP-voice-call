<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* Reset & Basic Styling */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #1a202c;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 24px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        footer {
            background-color: #1a202c;
            color: white;
            text-align: center;
            padding: 15px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 350px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            background: #28a745;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #218838;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        @media (max-height: 600px) {
            footer {
                position: static;
            }
        }
    </style>
</head>
<body>

<header>
    Admin Login Panel
</header>

<main>
    <div class="login-box">
        <h2>Login</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error">❌ Invalid username or password</p>
        <% } %>

        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit" class="btn">Login</button>
        </form>
    </div>
</main>

<footer>
    &copy; 2025 Balance Query Service. All rights reserved.
</footer>

</body>
</html>