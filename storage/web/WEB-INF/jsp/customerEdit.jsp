<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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

    <div class="layui-form-item layui-anim-down">
        <label class="layui-form-label">客户id</label>
        <div class="layui-input-block">
            <span style="line-height: 38px;color: teal">${customer.customerId}</span>
            <input type="hidden" name="customerId" value="${customer.customerId}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">客户名称</label>
        <div class="layui-input-block">
            <input type="text" name="customerName" placeholder="请输入姓名" value="${customer.customerName}" class="layui-input" autocomplete="off" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">客户地址</label>
        <div class="layui-input-block">
            <input type="text" name="customerAddress" placeholder="请输入客户地址" value="${customer.customerAddress}" class="layui-input" autocomplete="off" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">客户电话</label>
        <div class="layui-input-block">
            <input type="text" name="customerPhone" placeholder="请输入客户电话" value="${customer.customerPhone}" class="layui-input" autocomplete="off" lay-verify="required">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">客户邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="customerEmail" placeholder="请输入客户邮箱" value="${customer.customerEmail}" class="layui-input" autocomplete="off" lay-verify="required">
        </div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>

</div>

<script src="./layui/layui.js"></script>

<script>
    layui.use(['form','laydate'], function () {
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
                    url:'./updateCustomer',
                    type:'post',
                    data:data.field,
                    success:function(data){
                        if(data.status == 'error'){
                            layer.msg('失败',{icon: 5});//失败的表情
                            o.removeClass('layui-btn-disabled');
                            return;
                        }else{
                            layer.msg('成功', {
                                icon: 6,//成功的表情
                                time: 2000, //1秒关闭（如果不配置，默认是3秒）
                                // scrollbar: false
                            }, function(){
                                layer.close(index);
                                var iframeIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(iframeIndex);

                                window.parent.location.reload();

                            });
                        }
                    },
                    error:function(e){
                        layer.msg("失败",
                            {
                                //失败的表情
                                icon: 5
                            },
                            function(){
                                location.reload();
                            });
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