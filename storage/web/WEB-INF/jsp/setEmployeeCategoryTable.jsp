<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add" style="color: #0099CC;background: transparent;border: 2px solid #0099CC;border-radius: 6px;"> 添加 </button>
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
            url:'./findAllEmployeeCategory',
            // contentType: 'application/json',
            method: 'post',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'dictTypeCode', minWidth: 150, title: '职称代码'},
                {field: 'dictTypeName',minWidth: 150,  title: '职称属性'},
                {field: 'dictItemName',minWidth: 150, title: '职称名称'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                //原先 window.parent.layer.open({
                var index = layer.open({
                    title: '新增商品',
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    // area: ['100%', '100%'],
                    area: ['893px', '600px'],
                    content:'等待开发中'
                    // content: './supplierAdd',
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
                        url:'./',
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
                    title: '更新商品详情',
                    type: 1,
                    shade: 0.2,
                    // maxmin:true,
                    shadeClose: true,
                    // area: ['100%', '100%'],
                    area: ['893px', '600px'],
                    content:'等待开发中'
                    <%--content: '${pageContext.request.contextPath}/supplierEdit?id='+data.supplierId,--%>
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {

                    $.ajax('./', {
                        method: 'POST',
                        data: {id: data.supplierId},
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