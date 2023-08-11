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

    var minutes = parseInt(sessionStorage.getItem("minute"));
    var seconds = parseInt(sessionStorage.getItem("second"));

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
      $("#checkBtn1").click(function (){
        sessionStorage.setItem("viewB", "Y");
        window.location.href = "workarea/operation/trend.do";
      });

      $("#checkBtn2").click(function (){
        sessionStorage.setItem("viewB", "Y");
        window.location.href = "workarea/operation/trend.do";
      });

      $("#checkBtn3").click(function (){
        sessionStorage.setItem("viewB", "Y");
        window.location.href = "workarea/operation/trend.do";
      });


      $("#NBtn").click(function (){
        if (sessionStorage.getItem("viewB") != "Y") {
          sessionStorage.setItem("viewB", "N");
        }

        var frequency = $("#Frequency").val(); // 轮次
        var proportion = sessionStorage.getItem("proportion"); // 本轮配置比例
        var value = sessionStorage.getItem("value") + "点"; // 本轮资产价值
        var view = sessionStorage.getItem("viewA") + "/" + sessionStorage.getItem("viewB"); // 是否查看界面
        if (sessionStorage.getItem("viewA") == "N" && sessionStorage.getItem("viewB") == "N") {
          var stopTime = "0秒"; // 停留时间
        } else {
          var stopTime = (Math.floor(Math.random() * 3) + 2) + "秒"; // 停留时间
        }
        var investment = sessionStorage.getItem("investment") + "点"; // 投资情况
        var profit = sessionStorage.getItem("profit") + "点"; // 收益情况
        var useTime = sessionStorage.getItem("useTime") + "秒"; // 耗费时间

        $.ajax({
          url: 'workarea/operation/createInformation.do',
          data:{
            frequency: frequency,
            proportion: proportion,
            value: value,
            view: view,
            stopTime: stopTime,
            investment: investment,
            profit: profit,
            useTime: useTime,
          },
          type: 'post',
          dataType: 'json',
          success: function (data) {
            window.location.href="workarea/operation/rest.do";
          }

        });

        if (sessionStorage.getItem("i") < 14){

        }

        sessionStorage.removeItem("viewA");
        sessionStorage.removeItem("viewB");
        sessionStorage.removeItem("useTime");
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
    <span style="margin-right: 70px;">当前试验周期剩余时间: <b><b id="minute">14</b>:<b id="second">22</b></b></span>
  </div>

  <div class="Pmed">
    <div class="Pmede">
      <h2 style="margin: 9px 0px;">基金Ⅰ</h2>
      <div style="margin-top: 26px;">拟任基金经理WQ。</div>
      <button id="checkBtn1" style="height: 25px; width: 75px; margin-top: 26px; border: 0px; border-radius: 5px; background-color: #1383e8; color: #fff;">查看</button>
    </div>
    <div class="Pmede">
      <h2 style="margin: 9px 0px;">基金Ⅱ</h2>
      <div style="margin-top: 26px;">拟任基金经理WQ。</div>
      <button id="checkBtn2" style="height: 25px; width: 75px; margin-top: 26px; border: 0px; border-radius: 5px; background-color: #1383e8; color: #fff;">查看</button>
    </div>
    <div class="Pmede">
      <h2 style="margin: 9px 0px;">基金Ⅲ</h2>
      <div style="margin-top: 26px;">拟任基金经理WQ。</div>
      <button id="checkBtn3" style="height: 25px; width: 75px; margin-top: 26px; border: 0px; border-radius: 5px; background-color: #1383e8; color: #fff;">查看</button>
    </div>
  </div>

  <div style="width: 650px; margin: 50px auto; font-size: 20px; text-align:center;">
    <div id="thediv">请您决定是否查看本轮市场价格走势？</div>
  </div>

  <div style="text-align: center; line-height: 97px; margin-top: 97px;">
      <button class="PBtn" id="NBtn">不查看</button>
  </div>

  <input type="hidden" value="${sessionScope.bigFrequency}-${sessionScope.smallFrequency}" id="Frequency"/>
</body>
</html>
