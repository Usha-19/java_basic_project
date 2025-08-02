<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Learn With Stories</title>
    <link rel="stylesheet" href="style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Fredoka One', cursive;
            background: linear-gradient(to right, #f8cdda, #1d2b64);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .container {
            text-align: center;
            color: white;
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 25px;
            backdrop-filter: blur(10px);
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.2);
        }

        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #fffdfd;
        }

        .btn {
            padding: 12px 25px;
            font-size: 1.2em;
            margin: 10px;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            transition: 0.3s ease;
            font-family: 'Fredoka One', cursive;
        }

        .login-btn {
            background-color: #ff6f61;
            color: white;
        }

        .register-btn {
            background-color: #6a82fb;
            color: white;
        }

        .btn:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .fun-things {
            margin-top: 30px;
            font-size: 1.2em;
            color: #f7f7f7;
            animation: popIn 2s ease-in-out infinite alternate;
        }

        @keyframes popIn {
            0% { transform: scale(1); }
            100% { transform: scale(1.05); }
        }

        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: url('https://i.postimg.cc/Bv0v5vVv/star.png') repeat;
            background-size: contain;
            animation: starsMove 60s linear infinite;
            z-index: -1;
        }

        @keyframes starsMove {
            from { background-position: 0 0; }
            to { background-position: 1000px 1000px; }
        }

    </style>
</head>
<body>
    <div class="stars"></div>

    <div class="container">
        <h1>Welcome to <br>Learn with Stories 📚✨</h1>

        <a href="login.jsp"><button class="btn login-btn">Login</button></a>
        <a href="register.jsp"><button class="btn register-btn">Register</button></a>

        <div class="fun-things">
            🌟 Read Magical Stories<br>
            🦄 Learn with Fun<br>
            🧚 Make New Friends<br>
            🐼 Collect Stars!
        </div>
    </div>
</body>
</html>
