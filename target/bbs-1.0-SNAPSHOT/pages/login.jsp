<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta author="hemeiyi">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/register-login.css">
    <link rel="stylesheet" type="text/css" href="css/error.css">
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src='js/input_validate.js'></script>
    <script src='js/background.js' type="text/javascript"></script>
    <script src='js/layer/layer.js' type="text/javascript"></script>

</head>
<body>

<div id="box"></div>
<div class="cent-box">
    <div class="cent-box-header">
        <h1 class="main-title hide">湖北经济学院bbs论坛</h1>
        <h2 class="sub-title">love life</h2>
    </div>
    <%
        String role1 = request.getParameter("role");
        session.setAttribute("role2", role1);
    %>
    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="${pageContext.request.contextPath}/login.do" class="active">登录</a>
                <a href="${pageContext.request.contextPath}/success.do">注册</a>
                <div class="slide-bar"></div>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/loginsuccess.do" id="form1">
            <div class="login form">
                <div class="group">
                    <div class="group-ipt email">
                        <input type="text" name="email" id="email" class="ipt" placeholder="邮箱地址" required>
                    </div>
                    <div class="group-ipt password">
                        <input type="password" name="userPassword" id="userPassword" class="ipt" placeholder="输入您的登录密码"
                               required>
                    </div>
                </div>
            </div>


            <div class="button">
                <button type="button" class="login-btn register-btn" id="button" onclick="commit()">登录</button>
            </div>

            <div class="remember clearfix">
                <label class="remember-me"><span class="icon"><span class="zt"></span></span>
                    <input type="checkbox"
                           name="remember-me"
                           id="remember-me"
                           class="remember-mecheck"
                           checked>记住我</label>
                <label class="forgot-password">
                    <a href="emailLogin.do">忘记密码？</a>
                </label>
            </div>
        </form>
    </div>
</div>

<div class="footer">
    <p>湖北经济学院bbs论坛</p>
    <p>Designed By hemeiyi 2017</p>
</div>
<script type="text/javascript">
    function commit() {
        $.ajax({
            url:"${pageContext.request.contextPath}/login",
            type:"post",
            data:$("#form1").serialize(),
            success:function(data){
                if(data.flag == 0){
                    layer.alert(data.message);
                    return;
                }
                if(data.flag == 1){
                    window.location.href="${pageContext.request.contextPath}/allIndex.do";
                }
            },
            error:function(e){
                alert(e.flag);
            }
        });
    }
</script>

</body>
</html>