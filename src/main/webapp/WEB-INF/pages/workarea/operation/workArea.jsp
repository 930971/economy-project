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
        $(function (){
            $("#inBtn").click(function (){
                window.location.href="workarea/operation/await.do";
            });
        });
    </script>
</head>
<body style="background: #fff;">
<div class="work_bg"></div>
<div class="inDiv">
    <h2 style="line-height: 30px;">感谢您参与我们的行为决策实验！</h2>
    <h2 style="line-height: 30px;">请您等候实验员的指令再点击下方按钮进入实验。</h2>
    <button class="inBtn" id="inBtn">进入实验</button>
</div>
</body>
</html>
