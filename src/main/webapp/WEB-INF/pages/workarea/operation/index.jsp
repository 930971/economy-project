<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath %>">
    <meta charset="utf-8">
    <title>行为决策实验平台</title>
    <link rel="stylesheet" type="text/css" href="css/decision.css"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function (){
            window.open("workarea/operation/work.do", "workArea");

            $("#logoutBtn").click(function (){
                window.location.href="settings/user/logout.do";
            });
        });
    </script>
</head>
<body>
<div class="publicHeader">
    <h1>行为决策实验平台</h1>

    <div class="publicHeaderR">
        <button id="logoutBtn">退出</button>
    </div>
</div>

<div class="publicMain">
    <div class="left">
        <div>
            <ul class="list">
                <li><a href="workarea/operation/work.do" target="workArea">决策实验</a></li>
                <li><a href="workarea/information/inform.do" target="workArea">详细信息</a></li>
            </ul>
        </div>
    </div>

    <div class="right">
        <iframe class="frameBox" name="workArea"></iframe>
    </div>
</div>
</body>
</html>
