<%@ page language="java" import="java.util.*,cn.itcast.pojo.User" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>头部公共区</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="js/layui/css/layui.css" rel="stylesheet">
    <link href="js/layer/theme/default/layer.css" rel="stylesheet">

    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script src='js/layer/layer.js' type="text/javascript"></script>
    <script src='js/layui/layui.js' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".dropdown-toggle").dropdown('toggle');
        });
    </script>
</head>

<body>


<nav class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="<%=path%>/allIndex.do">湖北经济学院BBS论坛</a>
    </div>

    <div>
        <ul class="nav navbar-nav">
            <li><a href="<%=path%>/allIndex.do">首页</a></li>

            <li><a href="<%=request.getContextPath() %>/showmodel.do">模块分类</a></li>
            <li><a href="<%=request.getContextPath() %>/theNewTopic.do">论坛新帖</a></li>
            <li><a href="<%=request.getContextPath() %>/theHotTopic.do">精华帖</a></li>
        </ul>
    </div>
    <%
        String username = (String) session.getAttribute("userName");
        String role = (String) session.getAttribute("role2");
        if (username == null) {
    %>
    <ul class="nav navbar-nav navbar-right User">
        <li><a href="<%=request.getContextPath()%>/login.do">登录</a></li>
        <li><a href="<%=request.getContextPath()%>/success.do">注册</a></li>
    </ul>
    <p class="navbar-text navbar-right">尊敬的游客，您好！</p>
    <%
        }
        if (username != null && role.endsWith("2")) {
    %>

    <ul class="nav navbar-nav navbar-right User">
        <li class="dropdown">
            <img class="dropdown-toggle img-circle" data-toggle="dropdown" src="${imageAddr}"
                 style="width:49px;height:49px;"/>
            <b class="caret"></b>

            <ul class="dropdown-menu">
                <li><a href="<%=path%>/toUpdateUser.do">个人信息</a></li>
                <li><a href="<%=path+"/showMyTopic.do"%>">我的帖子</a></li>
                <li><a href="<%=request.getContextPath()%>/toNewPost.do">我要发帖</a></li>
                <li class="divider"></li>
                <li><a href="<%=request.getContextPath()%>/exit.do">退出登陆</a></li>
            </ul>
        </li>
    </ul>
    <p class="navbar-text navbar-right">亲爱的 ${userName}，欢迎回来！</p>

    <% }
        if (username != null && role.endsWith("1")) {
    %>

    <ul class="nav navbar-nav navbar-right User">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                ${userName} <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
                <li><a href="<%=path+"/showMyTopic.do"%>">我的帖子</a></li>
                <li><a href="<%=request.getContextPath()%>/toNewPost.do">我要发帖</a></li>
                <li><a href="<%=path%>/pages/addNotice.jsp">发布公告</a></li>
                <li><a href="<%=path%>/pages/create_model.jsp">创建模块</a></li>
                <li><a href="<%=path%>/toUpdateUser.do">个人信息</a></li>
                <li><a href="<%=path%>/listUsers.do">用户管理</a></li>
                <li class="divider"></li>
                <li><a href="<%=path+"/exit.do"%>">退出登陆</a></li>
            </ul>
        </li>
    </ul>
    <p class="navbar-text navbar-right">尊敬的${userName}您好！</p>
    <%}%>

    <form id="searchForm" class="navbar-form navbar-right" role="search"
          action="<%=request.getContextPath()%>/search.do">
      <!--  <input class="input-group">-->
        <input type="text" class="form-control" name="content" placeholder="search">
        <input type="submit" onclick="doSubmit()" value="搜索" class="btn"><span class="glyphicon glyphicon-search"
                                                        aria-hidden="true"></span></input>
    </form>
</nav>
<script type="text/javascript">
    function doSubmit() {
        $("#searchForm").submit();
    }
</script>
</body>
</html>