<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 2. 27.
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <script>
        $('document').ready(function () {
            // $("#sendMassage").on("click", function () {
            //     var userMessage = $("#userInput").val();
            //     $.ajax({
            //         url: "/chatBot/api",
            //         type: "POST",
            //         data: JSON.stringify({userMessage: userMessage}),
            //         dataType: "application/json",
            //         success: function (data) {
            //             var chatLog = $("#chatLog");
            //             chatLog.append("<p><strong>User:</strong> " + userMessage + "</p>");
            //             chatLog.append("<p><strong>ChatGPT:</strong> " + data + "</p>");
            //             $("#userInput").val("");
            //         }
            //         , error: function (err) {
            //             console.error("Error:", err);
            //         }
            //     });
            // });

            $("#sendMassage").on("click", sendMessage);

            async function sendMessage() {
                const userInput = $("#userInput");
                const userMessage = userInput.val();
                const chatLog = $("#chatLog");
                const response = await fetch("/chatBot/api", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({userMessage: userMessage})
                });
                console.log(response);
                const botResponse = await response.text();
                console.log(botResponse);
                chatLog.append("<p><strong>사용자: </strong>"+userInput.val()+"</p>");
                chatLog.append("<p><strong>챗봇: </strong>"+botResponse+"</p>");
                userInput.val("");

                //스크롤 하단 이동
                chatLog.scrollTop(chatLog[0].scrollHeight);
            }

        });
    </script>
    <link rel="stylesheet" href="/css/chatBot.css"/>
</head>
<body>
<div id="chatLog"></div>
<div id="sendBox">
    <input type="text" id="userInput" placeholder="입력하세요" />
    <button id="sendMassage">보내기</button>
</div>
</body>
</html>
