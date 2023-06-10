<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页一</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="./css/public.css" media="all">
</head>
<style>
    .layui-top-box {padding:40px 20px 20px 20px;color:#fff}
    .panel {margin-bottom:17px;background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
    .panel-body {padding:15px}
    .panel-title {margin-top:0;margin-bottom:0;font-size:14px;color:inherit}
    .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
    .layui-red {color:red}
    .main_btn > p {height:40px;}
    .error .clip .shadow {height:180px;}
    .error .clip:nth-of-type(2) .shadow {width:130px;}
    .error .clip:nth-of-type(1) .shadow,.error .clip:nth-of-type(3) .shadow {width:250px;}
    .error .digit {width:150px;height:150px;line-height:150px;font-size:120px;font-weight:bold;}
    .error h2 {font-size:32px;}
    .error .msg {top:-190px;left:30%;width:80px;height:80px;line-height:80px;font-size:32px;}
    .error span.triangle {top:70%;right:0%;border-left:20px solid #535353;border-top:15px solid transparent;border-bottom:15px solid transparent;}
    .error .container-error-404 {top: 50%;margin-top: 250px;position:relative;height:250px;padding-top:40px;}
    .error .container-error-404 .clip {display:inline-block;transform:skew(-45deg);}
    .error .clip .shadow {overflow:hidden;}
    .error .clip:nth-of-type(2) .shadow {overflow:hidden;position:relative;box-shadow:inset 20px 0px 20px -15px rgba(150,150,150,0.8),20px 0px 20px -15px rgba(150,150,150,0.8);}
    .error .clip:nth-of-type(3) .shadow:after,.error .clip:nth-of-type(1) .shadow:after {content:"";position:absolute;right:-8px;bottom:0px;z-index:9999;height:100%;width:10px;background:linear-gradient(90deg,transparent,rgba(173,173,173,0.8),transparent);border-radius:50%;}
    .error .clip:nth-of-type(3) .shadow:after {left:-8px;}
    .error .digit {position:relative;top:8%;color:white;background:#1E9FFF;border-radius:50%;display:inline-block;transform:skew(45deg);}
    .error .clip:nth-of-type(2) .digit {left:-10%;}
    .error .clip:nth-of-type(1) .digit {right:-20%;}
    .error .clip:nth-of-type(3) .digit {left:-20%;}
    .error h2 {font-size:24px;color:#A2A2A2;font-weight:bold;padding-bottom:20px;}
    .error .tohome {font-size:16px;color:#07B3F9;}
    .error .msg {position:relative;z-index:9999;display:block;background:#535353;color:#A2A2A2;border-radius:50%;font-style:italic;}
    .error .triangle {position:absolute;z-index:999;transform:rotate(45deg);content:"";width:0;height:0;}
    @media(max-width:767px) {.error .clip .shadow {height:100px;}
        .error .clip:nth-of-type(2) .shadow {width:80px;}
        .error .clip:nth-of-type(1) .shadow,.error .clip:nth-of-type(3) .shadow {width:100px;}
        .error .digit {width:80px;height:80px;line-height:80px;font-size:52px;}
        .error h2 {font-size:18px;}
        .error .msg {top:-110px;left:15%;width:40px;height:40px;line-height:40px;font-size:18px;}
        .error span.triangle {top:70%;right:-3%;border-left:10px solid #535353;border-top:8px solid transparent;border-bottom:8px solid transparent;}
        .error .container-error-404 {height:150px;}
    }
</style>
<body style="background-color: white">
<div class="error">
    <div class="container-floud">
        <div style="text-align: left">
            <h2 class="h1">欢迎使用本库存管理系统</h2>
        </div>
    </div>
</div>

<div class="layuimini-container">
    <div class="layuimini-main layui-top-box">
        <div class="layui-row layui-col-space10">

            <div class="layui-col-md4">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-cyan">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-blue">实时</span>
                                <h5>系统用户统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">${employeeCount}</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> ${employeeCount}</div>
                                <small>当前总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md4">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-blue">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-cyan">实时</span>
                                <h5>本月进货订单统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">${inorderCount}</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> ${inOrderCount}</div>
                                <small>当前总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md4">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-green">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-orange">实时</span>
                                <h5>合作供货商统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">${supplierCount}</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> ${supplierCount}</div>
                                <small>当前总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="container" style="height: 500px"></div>
<script type="text/javascript" src="./js/echarts.min.js"></script>
<script src="./layui/layui.js"></script>
<script>
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};

    var option;
    option = {
        xAxis: {
            type: 'category',
            data: ['用户数', '客户数', '供货商数', '入库单数', '出库单数', '商品数']
        },
        yAxis: {
            type: 'value'
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                data: [${employeeCount}, ${customerCount}, ${supplierCount}, ${inOrderCount}, ${outOrderCount}, ${productCount}],
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }


</script>
</body>
</html>

