<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Choose Subject</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(to right, #fffbe7, #ffefd5);
            text-align: center;
            padding: 40px;
            overflow-x: hidden;
        }
        .logout {
            position: absolute;
            top: 20px;
            right: 30px;
        }
        .logout button {
            padding: 10px 20px;
            background-color: #ff6699;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 14px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
        }
        .logout button:hover {
            background-color: #ff3366;
        }
        .welcome-section {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }
        .welcome-text {
            font-size: 24px;
            color: #ff3366;
            font-weight: bold;
        }
        .avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 3px solid #ffa500;
            background-color: #fff;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
        }
        h2.section-title {
            color: #ff6600;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .subject-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        .subject-buttons button {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 16px;
            background-color: #66ccff;
            color: white;
            cursor: pointer;
            box-shadow: 4px 4px 12px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
            min-width: 130px;
        }
        .subject-buttons button:hover {
            background-color: #3399ff;
            transform: scale(1.05);
        }
        .tool-section {
            margin-top: 60px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 30px;
            flex-wrap: wrap;
        }
        .calculator, .notes, .chatbot {
            flex: 1 1 280px;
            max-width: 320px;
            background: #fff;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: justify;
        }
        .calculator h2, .notes h2, .chatbot h2 {
            color: #ff6600;
            font-size: 22px;
            margin-bottom: 10px;
            text-align: center;
        }
        .calculator input, .notes textarea, .chatbot input {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        .calculator button, .notes button, .chatbot button {
            padding: 8px 18px;
            background-color: #66ccff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px auto;
            font-size: 14px;
            display: block;
        }
        .calculator button:hover, .notes button:hover, .chatbot button:hover {
            background-color: #3399ff;
        }
        .chat-window {
            height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
            text-align: justify;
        }
        .chat-window p {
            margin: 5px 0;
            font-size: 13px;
        }
    </style>
    <script>
        function calculate() {
            try {
                const result = eval(document.getElementById("calcInput").value);
                document.getElementById("calcResult").value = result;
            } catch {
                alert("Oops! Please enter a valid math expression.");
            }
        }

        function saveNote() {
            const note = document.getElementById("noteText").value;
            localStorage.setItem("kidNote", note);
            alert("Your note is saved!");
        }

        function loadNote() {
            const savedNote = localStorage.getItem("kidNote");
            if (savedNote) document.getElementById("noteText").value = savedNote;
        }

        function sendChat() {
            const input = document.getElementById("chatInput").value;
            const windowDiv = document.getElementById("chatWindow");

            if (!input.trim()) return;

            const userMsg = document.createElement("p");
            userMsg.innerText = "You: " + input;
            windowDiv.appendChild(userMsg);

            let response = "That's interesting! Let's learn more about it together.";
            if (input.toLowerCase().includes("math")) response = "Try clicking the Math button above to read fun stories about numbers!";
            else if (input.toLowerCase().includes("note")) response = "Use the Notes section to jot down anything you like!";
            else if (input.toLowerCase().includes("story")) response = "Choose a subject and click to read an exciting story!";
            else if (input.toLowerCase().includes("calculate") || input.match(/[0-9\+\-\*\/]/)) response = "Use the Calculator box to solve equations easily.";

            const botMsg = document.createElement("p");
            botMsg.innerText = "Bot: " + response;
            windowDiv.appendChild(botMsg);

            document.getElementById("chatInput").value = "";
            windowDiv.scrollTop = windowDiv.scrollHeight;
        }
    </script>
</head>
<body onload="loadNote()">

    <form action="login.jsp" method="get" class="logout">
        <button type="submit">Logout</button>
    </form>

    <div class="welcome-section">
        <img src="images/kid-avatar.jpeg" alt="Avatar" class="avatar">
        <div class="welcome-text">
            <span class="sparkle">HI!</span>
            <% String username = (String) session.getAttribute("username"); if (username != null) { %>
                Welcome, <%= username %>!
            <% } else { %>
                Welcome, Guest!
            <% } %>
        </div>
    </div>

    <h2 class="section-title">Choose Your Favorite Subject!</h2>

    <form action="story.jsp" method="get" class="subject-buttons">
        <button type="submit" name="subject" value="Math">Math</button>
        <button type="submit" name="subject" value="Science">Science</button>
        <button type="submit" name="subject" value="History">History</button>
        <button type="submit" name="subject" value="English">English</button>
        <button type="submit" name="subject" value="Geography">Geography</button>
    </form>

    <div class="tool-section">
        <div class="calculator">
            <h2>Calculator</h2>
            <input type="text" id="calcInput" placeholder="Type 3+2 or 6*7" />
            <button onclick="calculate()">Calculate</button>
            <input type="text" id="calcResult" placeholder="Result" readonly />
        </div>

        <div class="notes">
            <h2>Notes</h2>
            <textarea id="noteText" rows="6" placeholder="Write your notes here..."></textarea>
            <button onclick="saveNote()">Save Note</button>
        </div>

        <div class="chatbot">
            <h2>Chatbot</h2>
            <div class="chat-window" id="chatWindow"></div>
            <input type="text" id="chatInput" placeholder="Ask me something..." />
            <button onclick="sendChat()">Send</button>
        </div>
    </div>

</body>
</html>
