<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath %>">
    <meta charset="UTF-8" />
    <title>经济学行为决策平台</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $(window).keydown(function (event){
                if (event.keyCode == 13) {
                    $("#startBtn").click();
                }
            });

            $("#startBtn").click(function (){
                var startSeatNum = $.trim($("#startSeatNum").val());

                if (startSeatNum == ""){
                    alert("请填写座位号！");
                    return;
                }

                $.ajax({
                    url: 'settings/user/login.do',
                    data: {
                        seatNumber: startSeatNum
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data){
                        if (data.code == "1") {
                            window.location.href = "workarea/operation/index.do";
                        }else {
                            $("#msg").html(data.message);
                        }
                    },

                    beforeSend: function (){
                        $("#msg").text("正在验证...");
                        return true;
                    }
                });
            });
        })
    </script>
</head>
<body class="login_bg">
<div class="loginCont">
    <div class="loginHeader">
        <h1>经济学行为决策平台</h1>
        <p>Economic behavior decision-making platform</p>
    </div>
    <form id="loginForm" class="loginForm">
        <div class="inputBox">
            <input id="startSeatNum" placeholder="请输入座位号" type="text" />
        </div>

        <span id="msg" style="color: red; margin-left: 36px;"></span>

    </form>

    <div style="text-align: center;">
        <button class="GoBtn" type="button" id="startBtn">开始实验</button>
    </div>
</div>
</body>
</html>
