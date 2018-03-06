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

            <ul class="list-group">
                <div class="list-group-item active">
                    ${userName}的帖子
                </div>

                <div class="list-group-item">
                        <div class="list-group-item-heading" style="color:black">
                            <c:forEach items="${pager.records}" var="topics">

                                <a href="<%=request.getContextPath()%>/showTopicAndReply.do?topicid=${topics.getTopicId()}"
                                   class="list-group-item" style="display: inline-block;width: 94%;">
                                    <h4 class="list-group-item-heading">[${topics.getTitle()}]</h4>
                                    <p style="float: right;display: block;width: 100%;">
                                        发帖人:${topics.getUserName()}&nbsp;评论量: ${topics.getReplyCount()}&nbsp;发表日期:${topics.getPostDate()}
                                    </p>
                                </a>
                    <!--<div style="float: right;margin-right: 30px;display: inline-block;">-->
                        <!--<input type="button" onclick="deleteUser(${topics.getUserId()})" value="删除">-->
                        <button onclick="deleteUser(${topics.getUserId()})" class="btn btn-info">删除</button>
                    <!--</div>-->
                            </c:forEach>
                        </div>

                </div>
            </ul>
        </div>
    </div>
    <div style="padding: 15px;">
        <div id="layuiPage"></div>
    </div>
</div>
<input type="hidden" name="total" id="total" value="${pager.total}">
<input type="hidden" name="current" id="current" value="${pager.current}">
<input type="hidden" name="userId" id="userId" value="${userId}">

<script type="text/javascript">
    var currPageNumber = 1;
    var currPageSize = 10;
    var total = $('#total').val();
    var current = $('#current').val();
    var userId = $('#userId').val();
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
        var url = "<%=basePath%>" + "toUserPosts.do?current=" + currPageNumber + "&size=" + currPageSize + "&userId=" + userId;
        window.location.href = url;
    }

    function deleteUser(userId) {
        layer.confirm('确认删除该帖子？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                url: "${pageContext.request.contextPath}/deleteTopic.do",
                type: "post",
                data: {userId: userId},
                success: function (data) {
                    var url1 = "<%=basePath%>" + "toUserPosts.do?current=" + currPageNumber + "&size=" + currPageSize + "&userId=" + userId;
                    window.location.href = url1;
                }
            });
        });


    }
</script>


</body>
</html>