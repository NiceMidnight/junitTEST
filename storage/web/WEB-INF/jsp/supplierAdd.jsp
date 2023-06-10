<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body style="background-color: white">
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">供货商名称</label>
        <div class="layui-input-block">
            <input type="text" name="supplierName" lay-verify="required" lay-reqtext="供货商名称不能为空" placeholder="请输入供货商名称" value="" class="layui-input" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">供货商地址</label>
        <div class="layui-input-block">
            <input type="text" name="supplierAddress" placeholder="供货商地址"  class="layui-input" autocomplete="off" lay-verify="required|">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="supplierPhone" placeholder="手机号"  class="layui-input" autocomplete="off" lay-verify="required|phone">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认添加</button>
        </div>
    </div>
</div>
<script src="./layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate,
            $ = layui.$;


        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
                $.ajax({
                    url:'./addSupplier',
                    type:'post',
                    data:data.field,

                    success:function(data){
                        if(data.status == 'error'){
                            layer.msg(JSON.parse(data).msg,{icon: 5});//失败的表情
                            o.removeClass('layui-btn-disabled');
                            layer.open({
                                title: '提示信息'
                                ,content: '出错了'
                            });
                            return;
                        }else{
                            layer.msg(JSON.parse(data).msg, {
                                icon: 6,//成功的表情
                                time: 2000 //1秒关闭（如果不配置，默认是3秒）
                            }, function(){
                                //关闭弹出层
                                layer.close(index);
                                let iframeIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(iframeIndex);
                                window.location.reload();
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

            return false;
        });

    });
</script>
</body>
</html>