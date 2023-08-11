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
    <script type="text/javascript">
        var time = 60;
        function untime(){
            if(time > 0){
                time--;
                document.getElementById("jump").innerHTML = time;
            }
            if(time == 0){
                window.location.href = "workarea/operation/resolve.do";
            }
        }

        function start(){
            v = window.setInterval("untime()", 200);
            //v = window.setInterval("untime()", 1000);
        }

        if (sessionStorage.getItem("i") == null) {
            sessionStorage.setItem("i", 1);
        }

        if (parseInt(sessionStorage.getItem("i")) == 12) {
            sessionStorage.removeItem("i");
            sessionStorage.setItem("i", 0);
            sessionStorage.setItem("minute", 14);
            sessionStorage.setItem("second", 60);
        }
        if(parseInt(sessionStorage.getItem("i")) < 13) {
            var i = parseInt(sessionStorage.getItem("i")) + 1;
            sessionStorage.setItem("i", i);
        }

    </script>
</head>
<body style="" onload="start();">
    <div class="rest_bg"></div>
    <div class="jumptime">
        <span id="jump" style="line-height: 30px; color:#EA2000">60</span>s倒计时
    </div>
    <p class="timeP">请您稍作休息，耐心等待....</p>
</body>
</html>
