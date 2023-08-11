<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath %>">
    <title>经济学行为决策平台</title>
    <link rel="stylesheet" type="text/css" href="css/decision.css"/>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(function(){

            queryInformation();

            function queryInformation(){

                $.ajax({
                    url: 'workarea/operation/queryInformation.do',
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var htmlStr = "";

                        $.each(data.operationsList, function (index, obj){
                            htmlStr += "<tr>";
                            htmlStr += "<td>"+ obj.seatNumber +"</td>";
                            htmlStr += "<td>1000</td>";
                            htmlStr += "<td>"+ obj.frequency +"</td>";
                            htmlStr += "<td>"+ obj.proportion +"</td>";
                            htmlStr += "<td>"+ obj.view +"</td>";
                            htmlStr += "<td>"+ obj.stopTime +"</td>";
                            htmlStr += "<td>"+ obj.value +"</td>";
                            htmlStr += "<td>"+ obj.investment +"</td>";
                            htmlStr += "<td>"+ obj.profit +"</td>";
                            htmlStr += "<td>"+ obj.useTime +"</td>";
                            htmlStr += "</tr>";
                        });

                        $("#tBody").html(htmlStr);
                    }
                });
            }
        });
    </script>
</head>
<body style="background: #fff;">
<table class="table" cellspacing="0" cellpadding="0">
    <thead>
        <tr class="firstTr">
            <th>座位号</th>
            <th>初始实验点数</th>
            <th>周期-轮次</th>
            <th>基金资产配置比例</th>
            <th>查看收益/走势界面</th>
            <th>停留时间</th>
            <th>资产价值</th>
            <th>投资情况</th>
            <th>收益情况</th>
            <th>耗费时间</th>
        </tr>
    </thead>
    <tbody id="tBody">

    </tbody>
</table>
</body>
</html>
