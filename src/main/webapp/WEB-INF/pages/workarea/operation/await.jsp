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
        var time = 10;
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
            v = window.setInterval("untime()", 1000);
            //v = window.setInterval("untime()", 100);
        }

        sessionStorage.setItem("minute", 14);
        sessionStorage.setItem("second", 60);
    </script>
</head>
<body style="background: #fff;" onload="start();">
    <div class="await_bg"></div>
    <div class="jumptime">
        <span id="jump" style="line-height: 30px; color:#EA2000">10</span>s倒计时
    </div>
    <p class="timeP">请您耐心等待10s.....</p>
</body>
</html>
