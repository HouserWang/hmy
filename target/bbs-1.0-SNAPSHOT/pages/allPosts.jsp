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
                    ${modelName}
                </div>

                <div class="list-group-item">
                    <a href="<%=path%>/pages/post.jsp" style="color:grey">
                        <h4 class="list-group-item-heading" style="color:black">
                            <c:forEach items="${pager.records}" var="topics">

                                <a href="<%=request.getContextPath()%>/showTopicAndReply.do?topicid=${topics.getTopicId()}"
                                   class="list-group-item" style="height: 70px;">
                                    <h4 class="list-group-item-heading">[${topics.getTitle()}]</h4>
                                    <p class=" text-right" style="float: right;margin-right: 20px;">
                                        发帖人:${topics.getUserName()}&nbsp;评论量: ${topics.getReplyCount()}&nbsp;发表日期:${topics.getPostDate()}</p>
                                        <%-- <a href="<%=path%>/editpost.do?topicId=${topics.getTopicId()}" style="float: right">编辑</a>
                                       <a href="<%=path%>/applybest.do?topicId=${topics.getTopicId()}" style="float: right">申请精华贴&nbsp;</a> --%>
                                </a>

                            </c:forEach>
                        </h4>
                    </a>

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
<input type="hidden" name="modelId" id="modelId" value="${modelId}">
<input type="hidden" name="modelType" id="modelType" value="${modelType}">

<script type="text/javascript">
    var currPageNumber = 1;
    var currPageSize = 10;
    var total = $('#total').val();
    var current = $('#current').val();
    var modelId = $('#modelId').val();

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
        var modelType = $('#modelType').val();
        var mothed = ""
        if(modelType === '1'){
            mothed = "showModelPosts";
        }else if(modelType === '2'){
            mothed = "theNewTopic";
        }else if(modelType === '3'){
            mothed = "theHotTopic";
        }

        var url = "<%=basePath%>" + mothed +"?current=" + currPageNumber + "&size=" + currPageSize + "&modelId=" + modelId;
        window.location.href = url;
    }
</script>


</body>
</html>