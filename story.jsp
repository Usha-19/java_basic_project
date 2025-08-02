<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Stories</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: #fffbe7;
            padding: 20px;
            color: #333;
            text-align: center;
        }
        h2 {
            color: #ff6600;
            font-size: 32px;
        }
        .story-box {
            background-color: #fff;
            border: 3px dashed #ffa500;
            border-radius: 12px;
            padding: 20px;
            margin: 20px auto;
            width: 70%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
        }
        .story-box h3 {
            color: #cc3300;
            font-size: 24px;
        }
        .story-box p {
            font-size: 16px;
            color: #444;
            text-align: justify;
        }
        button {
            padding: 8px 16px;
            margin: 10px;
            background-color: #66ccff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.2s ease;
        }
        button:hover {
            transform: scale(1.05);
            background-color: #3399ff;
        }
        .back-button button {
            background-color: #ff6699;
        }
        .popup {
            font-size: 20px;
            position: absolute;
            top: 10px;
            right: 10px;
            animation: pop 1.5s ease-out;
            color: red;
        }
        .reference-links {
            margin-top: 30px;
        }
        .reference-links h3 {
            color: #cc3300;
        }
        .reference-links ul {
            list-style: none;
            padding: 0;
        }
        .reference-links li {
            margin-bottom: 8px;
        }
        .reference-links a {
            color: #0077cc;
            text-decoration: none;
        }
        .reference-links a:hover {
            text-decoration: underline;
        }
        @keyframes pop {
            0% { opacity: 0; transform: scale(0); }
            50% { opacity: 1; transform: scale(1.5); }
            100% { opacity: 0; transform: scale(0); }
        }
    </style>
    <script>
        function like(btn) {
            const heart = document.createElement("div");
            heart.innerHTML = "Liking...";
            heart.className = "popup";
            btn.parentNode.appendChild(heart);
            setTimeout(() => heart.remove(), 1500);
        }

        function dislike(btn) {
            const sad = document.createElement("div");
            sad.innerHTML = "Feeling Sad...";
            sad.className = "popup";
            btn.parentNode.appendChild(sad);
            setTimeout(() => sad.remove(), 1500);
        }
    </script>
</head>
<body>

<%
    String subject = request.getParameter("subject");

    Map<String, List<String>> storiesMap = new HashMap<>();
    Map<String, List<String>> referencesMap = new HashMap<>();

    storiesMap.put("Math", Arrays.asList(
        "Once upon a time in the town of Numberville, a little boy named Timmy discovered a magical ruler. Every time he measured something, it would come to life. One day, he measured a triangle, and it started to talk! The triangle needed help finding its angles because it was lost in a maze of numbers. Timmy, with his magical ruler, guided the triangle past addition alley, subtraction street, and multiplication mountains. They reached the Geometry Garden, where each shape had a story. Timmy solved puzzles to help the triangle become part of a pyramid palace. He learned that math wasn't just about numbers—it was about seeing the world differently. That night, he went to bed smiling, dreaming of fractions and formulas.",
        "In a hidden valley surrounded by chalkboard cliffs, numbers and symbols lived in peace. One day, the Equals Sign vanished, and everything became chaotic. Equations couldn’t be solved, and no one knew what was right or wrong. A brave girl named Mia, known for her puzzle-solving skills, ventured into the Land of Algebra. She teamed up with Function Fox and Variable Vicky to restore balance. They crossed the River of Ratios, climbed the Slope Hills, and battled the Negative Number Storm. Finally, they reached the Castle of Calculus, where the Equals Sign was trapped inside a paradox. Mia solved it with logic and heart. The kingdom was saved, and math harmony was restored."
    ));

    storiesMap.put("Science", Arrays.asList(
        "Lena loved gazing at the stars from her rooftop. One evening, a comet blinked at her! It sent a message: 'Visit Galaxy 9 for the science fair of the universe!' Using her telescope and imagination, Lena built a spaceship using magnets, vinegar fuel, and balloon boosters. She zoomed past Mars, learned about gravity from Saturn’s rings, and collected meteor samples. At Galaxy 9, aliens showcased magnetic fields, photosynthesis light shows, and volcano cupcakes. Lena's project on renewable energy won first prize. She came back to Earth with space dust in her pockets and science glowing in her heart.",
        "In a forest untouched by time, there lived creatures made entirely of molecules. Young Leo, a scientist-in-training, discovered them while testing water in a hidden pond. The creatures taught him how proteins dance, atoms bond, and DNA tells life’s story. Each step in the forest led to a new experiment. One day, the pond dried up. Leo used his knowledge to re-balance pH levels and restore life. The molecular creatures cheered, and Leo wrote everything in his journal. He published a kids’ science book called 'The Living Lab', inspiring thousands."
    ));

    storiesMap.put("History", Arrays.asList(
        "In the kingdom of Arthalia, young Prince Kian found an old scroll hidden behind a stone in the castle wall. It told of a warrior queen who united warring tribes with kindness and knowledge. Intrigued, Kian journeyed to ancient libraries, deciphered scripts, and followed the queen’s footsteps. He learned that history was more than kings and battles—it was people, choices, and courage. He brought those lessons back, built a school for all children, and placed the queen’s scroll in the town’s museum. Visitors read it with wonder, feeling the power of untold stories.",
        "A time machine stood hidden beneath Grandpa’s barn. Sarah, a curious 10-year-old, found it and accidentally zipped to 1857. She landed during the First War of Independence in India. She met children who resisted quietly—hiding messages, distracting soldiers, and helping refugees. Sarah kept a diary of all she saw. Back in her time, she shared it during History Week. Her story taught classmates how kids, too, shaped the world, one brave act at a time."
    ));

    storiesMap.put("English", Arrays.asList(
        "Tommy hated reading, until one night, his bookshelf began to whisper. 'Come closer,' it said. The books opened, and letters floated into the air, forming a glowing path. Tommy followed it into a land where grammar elves fixed broken sentences, and spelling bees buzzed important words. He met a wise wizard named Wordly who gave him a magic pen. Whatever he wrote came alive! Tommy wrote poems, stories, and even new worlds. When he returned, he wasn’t just a reader—he was a storyteller, sharing adventures with his class every week.",
        "In Litertown, words were currency. The more you knew, the richer you were. Ella, a shy girl, had a tiny purse of words. But she found an old journal at school that taught her new words daily. With each word, her world grew. She described the stars, emotions, and dreams with clarity. Soon, she was chosen as the Word Ambassador. She taught others to read, love stories, and express feelings. Litertown shined, and Ella knew that words held the power to change lives."
    ));

    storiesMap.put("Geography", Arrays.asList(
        "Ravi had a map with magical pins. Each pin, when placed, transported him to a different country. First, he pinned Kenya, and boom—he was among zebras in the savannah. Then he visited Japan’s cherry blossoms, and finally, Iceland’s icy geysers. In each place, he learned about cultures, climates, and landforms. At school, he shared his adventures through drawings, food samples, and music. Everyone was amazed. His teacher called him 'The Young Explorer', and his map became a school treasure.",
        "A river near Lila’s village began to vanish. Lila was curious and brave. She followed its dry bed, recording soil patterns and climate signs. Her notes led to discovering a blocked source caused by careless construction. Lila gathered villagers and explained with maps and models. Together, they cleaned the path and built eco-safe systems. The river returned. Lila’s project won national praise, and she became an ambassador for Earth education."
    ));

    referencesMap.put("Math", Arrays.asList(
        "https://www.khanacademy.org/math",
        "https://www.coolmath4kids.com/"
    ));

    referencesMap.put("Science", Arrays.asList(
        "https://www.sciencekids.co.nz/",
        "https://kids.nationalgeographic.com/science"
    ));

    referencesMap.put("History", Arrays.asList(
        "https://www.ducksters.com/history/",
        "https://www.historyforkids.net/"
    ));

    referencesMap.put("English", Arrays.asList(
        "https://www.abcya.com/",
        "https://www.funenglishgames.com/"
    ));

    referencesMap.put("Geography", Arrays.asList(
        "https://www.kids-world-travel-guide.com/geography-for-kids.html",
        "https://www.natgeokids.com/uk/category/discover/geography/"
    ));

    if (storiesMap.containsKey(subject)) {
%>
    <h2><%= subject %> Stories</h2>
    <%
        List<String> stories = storiesMap.get(subject);
        for (String story : stories) {
    %>
        <div class="story-box">
            <h3>Story</h3>
            <p><%= story %></p>
            <button onclick="like(this)">Like</button>
            <button onclick="dislike(this)">Dislike</button>
        </div>
    <%
        }
    %>
    <div class="reference-links">
        <h3>Helpful Links</h3>
        <ul>
        <%
            List<String> refs = referencesMap.get(subject);
            for (String ref : refs) {
        %>
            <li><a href="<%= ref %>" target="_blank"><%= ref %></a></li>
        <%
            }
        %>
        </ul>
    </div>
<%
    } else {
%>
    <h3>No subject selected.</h3>
<%
    }
%>

<div class="back-button">
    <a href="home.jsp"><button>Go Back</button></a>
</div>

</body>
</html>
