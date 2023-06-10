<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<style>
    .btn {
        /* 文字颜色 */
        color: #0099CC;
        background: transparent;
        border: 2px solid #0099CC;
        border-radius: 6px;
        /* 字母转大写 */
        border: none;
        color: white;
        padding: 16px 32px;
        text-align: center;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        -webkit-transition-duration: 0.4s; /* Safari */
        transition-duration: 0.4s;
        cursor: pointer;
        text-decoration: none;
        text-transform: uppercase;
    }
    .btn1 {
        background-color: white;
        color: black;
        border: 2px solid #008CBA;
    }
    /* 悬停样式 */
    .btn1:hover {
        background-color: #008CBA;
        color: white;
    }
</style>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="./css/public.css" media="all">
</head>
<body style="background-color: white">
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">客户ID</label>
                            <div class="layui-input-inline">
                                <input type="text" name="customerId" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">客户姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="customerName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">客户手机号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="customerPhone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"  style="color: #0099CC;background: transparent;border: 2px solid #0099CC;border-radius: 6px;"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete" style="color: #FFFF00;background-color: purple;border: 2px solid #0099CC;border-radius: 6px;"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit" style="color: #0099CC;background: transparent;border: 2px solid #0099CC;border-radius: 6px;">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete" style="color: #FFFF00;background-color: purple;border: 2px solid #0099CC;border-radius: 6px;">删除</a>
        </script>

    </div>
</div>

<script src="./layui/layui.js"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        //渲染表格
        table.render({
            elem: '#currentTableId',
            url:'./findAllCustomer',
            // contentType: 'application/json',
            method: 'post',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'customerId', width: 100, title: '客户id', sort: true,align:"center"},
                {field: 'customerName', minWidth: 150, title: '客户名称'},
                {field: 'customerAddress',minWidth: 150,  title: '客户地址'},
                {field: 'customerPhone',minWidth: 100,  title: '手机号'},
                {field: 'customerEmail',minWidth: 100,  title: '邮箱'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            });

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    searchParams:JSON.stringify(data.field)
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '新增客户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    // area: ['100%', '100%'],
                    area: ['893px', '600px'],
                    content: './customerAdd',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data),{
                    title:'批量删除客户'
                },function(){
                    $.ajax({
                        url:'./deleteCustomers',
                        type:'post',
                        data:{
                            data:JSON.stringify(data)
                        },
                        success:function(data){
                            if(JSON.parse(data).status == 'error'){
                                layer.msg(JSON.parse(data).msg,{icon: 5});//失败的表情
                                return;
                            }else{
                                layer.msg(JSON.parse(data).msg, {
                                    icon: 6,//成功的表情
                                    time: 2000 //1秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    layer.close(index);
                                    //刷新当前窗口
                                    window.location.reload();
                                    // var iframeIndex = parent.layer.getFrameIndex(window.name);
                                    // parent.layer.close(iframeIndex);
                                    // window.parent.location.reload();
                                });
                            }
                        },
                        error:function(e){
                            layer.msg("失败",
                                {icon: 5},
                                function(){
                                    location.reload();
                                });//失败的表情
                            console.log(e);
                        },

                    });

                });
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = window.parent.layer.open({
                    title: '更新客户详情',
                    type: 2,
                    shade: 0.2,
                    // maxmin:true,
                    shadeClose: true,
                    // area: ['100%', '100%'],
                    area: ['893px', '600px'],
                    content: '${pageContext.request.contextPath}/customerEdit?id='+data.customerId,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax('./deleteCustomer', {
                        method: 'POST',
                        data: {id: data.customerId},
                        success:function (data) {
                            console.log(data);
                            if(data.status == 'error'){
                                layer.msg(JSON.parse(data).msg,{icon: 5});//失败的表情
                                o.removeClass('layui-btn-disabled');
                                return;
                            }else{
                                layer.msg(JSON.parse(data).msg, {
                                    icon: 6,//成功的表情
                                    time: 2000 //1秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    //成功，执行前端表格删除
                                    obj.del();
                                    layer.close(index);
                                    // var iframeIndex = parent.layer.getFrameIndex(window.name);
                                    // parent.layer.close(iframeIndex);
                                    // window.parent.location.reload();
                                });
                            }
                        },
                        error:function (err) {
                            alert(err);
                        }
                    })
                });
            }
        });
    });
</script>

</body>
</html>