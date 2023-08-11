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

        function Show_Hidden(obj) {
            if(obj.style.display == "block") {
                obj.style.display = 'none';
            } else {
                obj.style.display = 'block';
            }
        }

        window.onclick = function() {
            var olink = document.getElementById("link");
            var noLink = document.getElementById("noLink");
            var odiv = document.getElementById("thediv");
            var k = document.getElementById("kkk");

            Show_Hidden(odiv);
            Show_Hidden(k);
            Show_Hidden(olink);
            Show_Hidden(noLink);
            return false;
        }

        $(function (){
            $("#confirmBtn").click(function (){
                sessionStorage.setItem("viewA", "Y");
                window.location.href = "workarea/operation/layout.do";
            });

            $("#NBtn").click(function (){
                sessionStorage.setItem("viewA", "N");
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

    <div class="Pmed">
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅰ</h2>
            <div style="margin-top: 26px;">拟任基金经理WQ。</div>
        </div>
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅱ</h2>
            <div style="margin-top: 26px;">拟任基金经理WQ。</div>
        </div>
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅲ</h2>
            <div style="margin-top: 26px;">拟任基金经理WQ。</div>
        </div>
    </div>

    <div style="width: 500px; margin: 50px auto; font-size: 20px; text-align:center;">
        <div id="thediv" style="display:block; ">请您决定是否查看本轮您的个人资产组合收益情况？</div>
        <div id="kkk" style="display: none;">
            您当前的个人资产组合市值为：<b style="color: #1383e8;">963点</b>
            <div style="line-height: 26px;">
                本轮收益：<b style="color: #1383e8;">-37点</b>
            </div>
            <div style="line-height: 30px;">
                当前累计收益：<b style="color: #1383e8;">-37点</b>
            </div>
        </div>
    </div>


    <div style="text-align: center; line-height: 97px; margin-top: 97px;">
        <div id="link" style="display: block;">
            <button class="PBtn" id="YBtn" style="margin-right: 10px;">是</button>
            <button class="PBtn" id="NBtn" style="margin-left: 10px; background-color: #d8d8d8; color: #000;">否</button>
        </div>

        <div id="noLink" style="display: none;">
            <button class="PBtn" id="confirmBtn">确认</button>
        </div>
    </div>
</body>
</html>