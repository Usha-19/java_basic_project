<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Learn With Stories</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fredoka&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Fredoka', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffffcc;
            padding: 50px;
            border-radius: 25px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 90%;
            max-width: 500px;
            border: 4px dashed #ffa500;
        }

        h1 {
            color: #ff6600;
            font-size: 36px;
            margin-bottom: 25px;
        }

        .btn {
            padding: 12px 30px;
            font-size: 18px;
            margin: 10px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
            color: white;
        }

        .login-btn {
            background-color: #66ccff;
        }

        .register-btn {
            background-color: #ff6699;
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .info-box {
            margin-top: 30px;
            background-color: #fff8dc;
            padding: 20px;
            border-radius: 15px;
            border: 2px solid #ffa500;
            font-size: 16px;
            color: #444;
            text-align: justify;
        }

        .cute-character {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 3px solid #ffa500;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="images/kid-avatar.jpeg" alt="Cute Character" class="cute-character">

        <h1>Welcome to Learn With Stories</h1>

        <a href="login.jsp"><button class="btn login-btn">Login</button></a>
        <a href="register.jsp"><button class="btn register-btn">Register</button></a>

        <div class="info-box">
            Discover a magical world of subjects where each story teaches you Math, Science, History, and more in the most fun way! Write notes, chat with your assistant, and become a star learner.
        </div>
    </div>

</body>
</html>
