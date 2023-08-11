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

        var time = 25;

        function untime(){
            if(time > 0){
                time--;
                document.getElementById("jump").innerHTML = time;
            }
            if(time == 0){
                sessionStorage.setItem("useTime", "25");
                window.location.href = "workarea/operation/judge.do";
            }
        }

        if(sessionStorage.getItem("minute") == "14" && sessionStorage.getItem("second") == "60") {
            var minutes = parseInt(sessionStorage.getItem("minute"));
            var seconds = parseInt(sessionStorage.getItem("second"));
        }else{
            var minutes = parseInt(sessionStorage.getItem("minute"));
            var seconds = parseInt(sessionStorage.getItem("second"));
        }
        function reciprocal(){

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

            if (minutes == 0 && seconds == 0) {
                alert("本次实验已经结束");
                window.location.href = "settings/user/logout.do";
                return;
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
            window.setInterval("untime()", 1000);
            window.setInterval("reciprocal()", 1000);
        }

        if (sessionStorage.getItem("i") == null) {
            sessionStorage.setItem("i", 1);
        }

        $(function (){

            $("#YBtn").click(function (){
                var box1 = parseInt(range1.value);
                var box2 = parseInt(range2.value);
                var box3 = parseInt(range3.value);

                let opA = box1.toString(10);
                let opB = box2.toString(10);
                let opC = box3.toString(10);

                var proportion = "Ⅰ:" + opA +"%-->Ⅱ:"+ opB +"%-->Ⅲ:"+ opC + "%";

                sessionStorage.setItem("proportion", proportion);
                sessionStorage.setItem("useTime", 25 - time);

                var Fir = Math.random() * 2 - 1;
                var Sec = Math.random() * 2 - 1;
                var Thi = Math.random() * 2 - 1;

                if (sessionStorage.getItem("i") == 13){
                    sessionStorage.setItem("i", 1);
                }

                if(parseInt(sessionStorage.getItem("i")) > 1) {
                    var total = sessionStorage.getItem("value");
                    var nowValue = Math.trunc(total * box1 * 0.01 * (1 + Fir) + total * box2 * 0.01 * (1 + Sec) + total * box3 * 0.01 * (1 + Thi) + total * (1 - (box1 + box2 + box3) * 0.01));
                    var nowInvestment = nowValue - total;
                    var nowProfit = nowValue - 1000;

                    sessionStorage.setItem("value", nowValue);
                    sessionStorage.setItem("investment", nowInvestment);
                    sessionStorage.setItem("profit", nowProfit);
                }

                if (sessionStorage.getItem("i") == 1) {
                    var nowValue = Math.trunc(1000 * box1 * 0.01 * (1 + Fir) + 1000 * box2 * 0.01 * (1 + Sec) + 1000 * box3 * 0.01 * (1 + Thi) + 1000 * (1 - (box1 + box2 + box3) * 0.01));
                    var nowInvestment = nowValue - 1000;
                    var nowProfit = nowValue - 1000;

                    sessionStorage.setItem("value", nowValue);
                    sessionStorage.setItem("investment", nowInvestment);
                    sessionStorage.setItem("profit", nowProfit);
                }

                window.location.href = "workarea/operation/judge.do";
            });
        });
    </script>
</head>
<body onload="start();">
    <div style="line-height: 38px; border-bottom: 1px #b6b6b6 solid;">
        <span style="padding-left: 60px">第<b>${sessionScope.bigFrequency}</b>场&ensp;&ensp;&ensp;&ensp;&ensp;实验阶段: 第<b>${sessionScope.smallFrequency}</b>阶段</span>
    </div>

    <div class="Ptop">
        <span style="color: #1383e8; margin-left: 70px;">投资任务进度: <b>${sessionScope.smallFrequency}</b>/12</span>
        <span style="margin-right: 70px;">当前试验周期剩余时间: <b><b id="minute">15</b>:<b id="second">00</b></b></span>
    </div>

    <div class="Pmed">
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅰ</h2>
            <div style="margin-top: 30px;">拟任基金经理WQ。</div>
        </div>
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅱ</h2>
            <div style="margin-top: 30px;">拟任基金经理WQ。</div>
        </div>
        <div class="Pmede">
            <h2 style="margin: 9px 0px;">基金Ⅲ</h2>
            <div style="margin-top: 30px;">拟任基金经理WQ。</div>
        </div>
    </div>

    <div id="under">
        <div class="Pmeu" style="margin-top: 20px;">
            <p>请您拉动滑动条并作出您本轮的资产配置决策: <span>（注意您有<span id="jump">25</span>s的时间完成决策并点击确认提交）</span></p>
            <p>您当前未配置资产比例为 <span><span id="surplus">100</span>%</span></p>
        </div>

        <div class="Pund" style="margin-top: 50px;">
            <div class="Pundc">
                基金Ⅰ&ensp;<input type="range" id="range1" value="0" min="0" max="100" step="1" onchange="changeV()"><span id="span1">0</span>%
            </div>
            <div class="Pundc">
                基金Ⅱ&ensp;<input type="range" id="range2" value="0" min="0" max="100" step="1" onchange="changeV()"><span id="span2">0</span>%
            </div>
            <div class="Pundc">
                基金Ⅲ&ensp;<input type="range" id="range3" value="0" min="0" max="100" step="1" onchange="changeV()"><span id="span3">0</span>%
            </div>
        </div>

        <div style="text-align: center; line-height: 97px;">
            <button class="PBtn" id="YBtn">确认</button>
        </div>
    </div>

    <script>
        const range1 = document.getElementById('range1');
        const range2 = document.getElementById('range2');
        const range3 = document.getElementById('range3');

        function changeV() {
            const box1 = parseInt(range1.value);
            const box2 = parseInt(range2.value);
            const box3 = parseInt(range3.value);

            var surplus = 100 - box1 - box2 - box3;

            document.getElementById("surplus").innerHTML = surplus;
            if (surplus < 0) {
                document.getElementById("surplus").innerHTML = "0";
            }

            document.getElementById("span1").innerHTML = box1;
            document.getElementById("span2").innerHTML = box2;
            document.getElementById("span3").innerHTML = box3;

            if(box1 + box2 > 100){
                alert("分配超出正常范围");
                return;
            }
            if(box3 + box2 > 100){
                alert("分配超出正常范围");
                return;
            }
            if(box1 + box3 > 100){
                alert("分配超出正常范围");
                return;
            }
            if(box1 + box2 + box3 > 100){
                alert("分配超出正常范围");
                return;
            }
        }
    </script>
</body>
</html>