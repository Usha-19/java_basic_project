<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Subject Stories</title>
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
    <h1>Register New User</h1>
    <form method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br>
        <input type="password" name="password" placeholder="Enter Password" required><br>
        <input type="password" name="confirm" placeholder="Confirm Password" required><br>
        <button type="submit">Register</button>
    </form>
    <div class="option-links">
        <p>Already Registered? <a href="login.jsp">Login here</a></p>
    </div>

<%
    String filePath = application.getRealPath("users.txt");
    File file = new File(filePath);
    if (!file.exists()) file.createNewFile();

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm");

    if (username != null && password != null && confirm != null) {
        if (!password.equals(confirm)) {
%>
            <p style="color:red;">Passwords do not match!</p>
<%
        } else {
            boolean exists = false;
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":");
                if (parts.length == 2 && parts[0].equals(username)) {
                    exists = true;
                    break;
                }
            }
            reader.close();

            if (exists) {
%>
                <p style="color:red;">Username already exists. Try a different one.</p>
<%
            } else {
                BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));
                writer.write(username + ":" + password);
                writer.newLine();
                writer.close();
                session.setAttribute("registered", "true");
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            }
        }
    }
%>
</body>
</html>
