<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Subject Stories</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(to right, #fff8dc, #ffe4e1);
            padding: 40px;
            text-align: center;
        }
        h1 {
            color: #ff6600;
            font-size: 36px;
            margin-bottom: 30px;
        }
        form {
            display: inline-block;
            padding: 30px;
            background: #fff;
            border: 3px dashed #ffa500;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin: 10px 0;
            width: 250px;
            border: 2px solid #ffa500;
            border-radius: 6px;
            font-size: 16px;
        }
        button {
            padding: 10px 25px;
            font-size: 16px;
            background-color: #ff9900;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #e68000;
        }
        .option-links {
            margin-top: 20px;
        }
        .option-links a {
            text-decoration: none;
            color: #0066cc;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Login to Subject Stories</h1>
    <form method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br>
        <input type="password" name="password" placeholder="Enter Password" required><br>
        <button type="submit">Login</button>
    </form>
    <div class="option-links">
        <p>New User? <a href="register.jsp">Register here</a></p>
    </div>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        String filePath = application.getRealPath("users.txt");
        File file = new File(filePath);
        boolean valid = false;

        if (file.exists()) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":");
                if (parts.length == 2 && parts[0].equals(username) && parts[1].equals(password)) {
                    valid = true;
                    break;
                }
            }
            reader.close();
        }

        if (valid) {
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
%>
            <p style="color:red;">Invalid username or password.</p>
<%
        }
    }
%>
</body>
</html>
