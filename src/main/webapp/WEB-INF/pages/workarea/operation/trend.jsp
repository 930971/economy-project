<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath %>">
    <meta charset="UTF-8" />
    <title>经济学行为决策平台</title>
    <link rel="stylesheet" type="text/css" href="css/decision.css"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap.min.js"></script>
    <script type="text/javascript">
        function reciprocal(){

            var minutes = parseInt(sessionStorage.getItem("minute"));
            var seconds = parseInt(sessionStorage.getItem("second"));

            document.getElementById("minute").innerHTML = minutes;
            document.getElementById("second").innerHTML = seconds;

            if(seconds > 0){
                seconds--;
                document.getElementById("second").innerHTML = seconds;
                sessionStorage.setItem("second", seconds);
                sessionStorage.setItem("minute", minutes);
            }

            if (seconds < 10) {
                seconds--;
                document.getElementById("second").innerHTML = "0" + seconds;
                sessionStorage.setItem("second", seconds);
                sessionStorage.setItem("minute", minutes);
            }

            if (seconds == 0) {
                minutes--;
                seconds = 60;
                document.getElementById("minute").innerHTML = minutes;
                sessionStorage.setItem("second", seconds);
                sessionStorage.setItem("minute", minutes);
            }
        }

        function start(){
            window.setInterval("reciprocal()", 1000);
        }

        $(function (){
            $("#NBtn").click(function (){
                window.location.href = "workarea/operation/layout.do";
            });
        });
    </script>
</head>
<body onload="start();">
    <div style="line-height: 39px; border-bottom: 1px #b6b6b6 solid;">
        <span style="padding-left: 60px;">第<b>${sessionScope.bigFrequency}</b>场&ensp;&ensp;&ensp;&ensp;&ensp;实验阶段: 第<b>${sessionScope.smallFrequency}</b>阶段</span>
    </div>

    <div class="Ptop">
        <span style="color: #1383e8; margin-left: 70px;">投资任务进度: <b>${sessionScope.smallFrequency}</b>/12</span>
        <span style="margin-right: 70px;">当前试验周期剩余时间: <b><b id="minute">15</b>:<b id="second">00</b></b></span>
    </div>

    <div style="margin-top: 30px; height: 50px; line-height: 50px;">
        <span style="font-size: 16px; margin-left: 97px;">您选择查看当前<b style="color: red;">基金Ⅱ</b>的价格走势：</span>
    </div>

    <div class="a" style="text-align: center; margin-top: 30px;">
        <img src="img/pic.png" width="997" height="360"/>
    </div>

    <div style="text-align: center; line-height: 97px; margin-top: 37px;">
        <button class="PBtn" id="NBtn">返回</button>
    </div>
</body>
</html>
