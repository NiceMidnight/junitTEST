<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" type="image/jpg"  href="./images/icon.jpg"/>
    <title>后台登录界面</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" media="all">
    <style>
        html,
        body {
            /* 初始化页面父对象，默认是0 */
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        body {
            /* 添加页面背景颜色 */
            background-color: #284f95
        }

        body::after {
            content: '';
            background-repeat: no-repeat;
            background-size: cover;
            /* 添加滤镜，加入高斯模糊 */
            filter: blur(3px);
            /* 考虑不同浏览器兼容性 */
            -webkit-filter: blur(3px);
            -moz-filter: blur(3px);
            -o-filter: blur(3px);
            -ms-filter: blur(3px);
            /* 添加绝对定位 */
            /* 下面操作实现垂直居中布局 */
            /* 采用position加margin：auto */
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            /* 置底 */
            z-index: -1;
        }

        /* 外层容器样式 */
        .layui-container {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background-image: url("../../images/bg.jpg");
            /* 居中的第三种方法，flex布局  移动端首选 */
            /* display: flex;
            align-items: center;
            justify-content: center */
        }

        /* 背景层样式 */
        .admin-login-background {
            width: 360px;
            height: 380px;
            /* 下面操作就是为了居中显示 */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* 标题容器样式 */
        .logo-title {
            text-align: center;
            /* 字体间距 */
            letter-spacing: 2px;
            /* 上下 14px */
            padding: 14px 0;
        }

        .logo-title h1 {
            /* color: #1E9FFF; */
            color: #747d8c;
            font-size: 25px;
            /* font-weight 属性设置文本的粗细。font-weight 属性设置文本的粗细。700 等价于 bold */
            font-weight: bold;
        }

        /* 表单容器样式 */
        .login-form {
            background-color: #fff;
            border: 1px solid #fff;
            border-radius: 3px;
            padding: 14px 20px;
            box-shadow: 0 0 8px #eeeeee;
        }

        /* 表单内元素item样式 */
        .login-form .layui-form-item {
            position: relative;
        }

        .login-form .layui-form-item label {
            position: absolute;
            left: 1px;
            top: 1px;
            width: 38px;
            line-height: 36px;
            text-align: center;
            color: #d2d2d2;
        }

        .login-form .layui-form-item input {
            padding-left: 36px;
        }

        .my-span i{
            color: greenyellow;
            display: inline-block;
            position: absolute;
            line-height: 38px;
            left: 10px;
            letter-spacing: 3px;
        }
    </style>
</head>

<body>
<!-- 外层容器 -->
<div class="layui-container">
    <!-- 背景层 -->
    <div class="admin-login-background">
        <!-- 表单容器 -->
        <div class="layui-from login-form">
            <!-- layui表单 -->
            <form class="layui-form" action="./toLogin" method="post">
                <!-- 标题容器 -->
                <div class="layui-form-item logo-title">
                    <h1>库存管理后台登录</h1>
                </div>
                <!-- 操作员ID输入框容器 -->
                <div class="layui-form-item">
                    <%-- <label class="layui-icon layui-icon-username" for="employeeId"></label>--%>
                    <input type="text" name="employeeId" lay-verify="required|userName" placeholder="员工ID"
                           autocomplete="off" class="layui-input" value="1">
                </div>
                <!-- 用户密码输入框容器 -->
                <div class="layui-form-item">
                    <!--<label class="layui-icon layui-icon-password" for="employeePassword"></label> -->
                    <input type="password" name="employeePassword" lay-verify="required|pass" placeholder="密码"
                           autocomplete="off" class="layui-input" value="123">
                </div>
                <!-- 记住密码 -->
                <div class="layui-form-item">
                    <%--   <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" title="记住密码">--%>

                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-radius layui-btn-fluid layui-font-18" lay-submit lay-filter="login">
                        登 录</button>
                </div>
            </form>
        </div>

    </div>
</div>
</div>
</body>

</html>
<script src="../../js/jquery-3.4.1.min.js"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/jquery.particleground.min.js"></script>
<script>

    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;

        //根据后台存储的消息，提示错误信息
        if(${not empty msg}){
            layer.msg('${msg}');
            window.location = '../index.jsp';
        }

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.id == '') {
                layer.msg('id不能为空');
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.role == '') {
                layer.msg('账户类型不能为空');
                return false;
            }

            // layer.msg('登录成功', function () {
            //     window.location = '../index.jsp';
            // });

            return true;
        });
    });
</script>