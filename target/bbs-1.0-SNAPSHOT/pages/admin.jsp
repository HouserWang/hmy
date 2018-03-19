<%@ page language="java" import="java.util.*,cn.itcast.pojo.Topic" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
/* if (session.getAttribute("userName") == null){
	response.sendRedirect("/pages/login.jsp");
} */
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'mypost.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>发帖数</th>
                    <th class="col-md-4" colspan="3">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pager.records}" var="user">
                    <tr>
                        <td>${user.getUserName()}</td>
                        <td>${user.getUserSex()}</td>
                        <td>${user.getEmail()}</td>
                        <td>${user.getPostCount()}</td>
                        <td>
                            <input type="button" onclick="shutdownUser(${user.getUserId()})" value="封锁">
                            <input type="button" onclick="destroyUser(${user.getUserId()})" value="注销">
                            <input type="button" onclick="toUserPosts(${user.getUserId()})" value="所有帖子">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div style="padding: 15px;">
        <div id="layuiPage"></div>
    </div>
</div>
<input type="hidden" name="total" id="total" value="${pager.total}">
<input type="hidden" name="current" id="current" value="${pager.current}">

<script type="text/javascript">
    var currPageNumber = 1;
    var currPageSize = 10;
    var total = $('#total').val();
    var current = $('#current').val();
    $(document).ready(function () {
        layui.use('laypage', function () {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'layuiPage',
                count: total,
                curr: current,
                jump: function (obj, first) {
                    currPageSize = obj.limit;
                    currPageNumber = obj.curr;
                    if (!first) {
                        jump();
                    }
                }
            })
        })
    })

    function jump() {
        var url = "<%=basePath%>" + "listUsers.do?current=" + currPageNumber + "&size=" + currPageSize;
        window.location.href = url;
    }

    function shutdownUser(userId) {
        $.ajax({
            url:"${pageContext.request.contextPath}/shutdownUser.do",
            type:"post",
            data:{ userId:userId},
            success:function(data){
                layer.alert(data.message);
                return;
            }
        });
    }
    function destroyUser(userId) {
        layer.confirm('确认删除该用户？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/destroyUser.do",
                type:"post",
                data:{ userId:userId},
                success:function(data){
                    var url = "<%=basePath%>" + "listUsers.do" ;
                    window.location.href = url;
                }
            });
        }, function(){
          return;
        });

    }
    function toUserPosts(userId) {
        var url = "<%=basePath%>" + "toUserPosts.do?userId=" + userId;
        window.location.href = url;
    }
</script>


</body>
</html>