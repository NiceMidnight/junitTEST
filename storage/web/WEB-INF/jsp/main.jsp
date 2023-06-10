<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>库存管理系统</title>
    <link rel="icon" type="image/jpg"  href="./images/icon.jpg"/>
    <link rel="stylesheet" href="./layui/css/layui.css">
</head>

<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">库存管理 MANAGE</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="./images/icon.jpg" class="layui-nav-img layui-anim-rotate">
                    ${Employee.employeeName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" id="myAccount">你的账户</a></dd>
                    <dd><a href="./404" target="myframe">设置</a></dd>
                    <dd><a href="./layout">退出系统</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="./welcome" target="myframe">首页</a>
                </li>
                <li class="layui-nav-item">
                    <%--如果需要默认展开添加 layui-nav-itemed--%>
                    <a class="" href="javascript:;">客户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="./supplierTable" target="myframe">供货商</a></dd>
                        <dd><a href="./productTable" target="myframe">商品列表</a></dd>
                        <dd><a href="./customerTable" target="myframe">客户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="./inOrderTable" target="myframe">入库订单表</a></dd>
                        <dd><a href="./outOrderTable" target="myframe">出库订单表</a></dd>
                        <dd><a href="./inventoryTable" target="myframe">库存查询</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计分析</a>
                    <dl class="layui-nav-child">
                        <dd><a href="./inReport" target="myframe">进货月报表</a></dd>
                        <dd><a href="./inOrderShow" target="myframe">进货月图表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="./404" target="myframe">员工管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe id="iframeMain" src="./welcome" width="100%" height="100%" align="center" scrolling="auto"
                    frameborder="0" style="filter:chroma(color=#ffffff)"  name="myframe" allowTransparency="true"></iframe>
        </div>
    </div>


</div>
<script src="./layui/layui.js"></script>
<script>
    //页面一打开就执行弹层
    layer.ready(function(){
        layer.msg('登录成功，欢迎使用该系统！');
    });

    //JS
    layui.use(['element', 'layer', 'util', 'table'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , table = layui.table
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', { icon: 0 });
            }
        });

        //监听我的账户
        $("#myAccount").click(function (){
            layer.open({
                type: 2,
                title: '你的账户',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['893px', '600px'],
                content: './myAccount'
            });
        })

    });
</script>
</body>

</html>