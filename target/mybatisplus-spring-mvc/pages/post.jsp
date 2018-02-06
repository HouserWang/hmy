<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@page import="org.springframework.context.ApplicationContext" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" autoFlush="false" buffer="1000kb" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>帖子浏览</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="css/post-detail.css" rel="stylesheet">

</head>

<body>
<div style="height:100%">

    <jsp:include page="header.jsp"/>
    <div class="container" style="border:2px;margin-top: 50px;">


        <div class="row">
            <div class="col-md-1 post-border">
            </div>
            <div class="col-md-2 post-head">
                <!--<img src="img/tm-bg-slide-1.jpg" width="80px" height="80px" class="img-responsive img-circle">-->
                <img alt="" class="img-responsive img-circle" src=""
                     style="margin:1px 1px;width: 120px;height: 120px;"/>
                <%-- <%
                String args= request.getParameter("userName");
                String uName = new String(args.getBytes("ISO-8859-1"),"UTF-8");
                %> --%>
                <span class="User-info">
                            <span class="badge" style="background: #f1c40f;margin-top: 5px">发帖者</span>
                            :<%=request.getAttribute("userName") %> <span class="badge"
                                                                          style="background: #f1c40f;margin-top: 5px"> </span>
                        </span><br/>
                <span class="User-info">
                            <span class="badge" style="background: #2ecc71;margin-top: 5px">性别</span>
                            :<%=request.getAttribute("userSex") %> <span class="badge"
                                                                         style="background: #2ecc71;margin-top: 5px"> </span>
                        </span>
            </div>
            <div class="col-md-8 post-content">

                <div class="post-title">
                    <h2 style="margin-left:20px;color:black">[<%=request.getAttribute("title") %> ] </h2>
                    <div style="margin-left:20px">

                    <span>
                     <%=request.getAttribute("content") %>
                    </span>&nbsp;&nbsp; &nbsp;&nbsp;
                        <span> 发表于:<%=request.getAttribute("postDate") %> </span>

                        <a style="float:right;margin-right: 20px;" href="<%=path%>/editpost.action?postId=">编辑</a>

                    </div>
                    <strong style=" float:right;margin-right:10px;margin-top: 10px">
                        <span class="badge" style="background: #ff6927;width: 50px;">楼主</span></strong>

                </div>
                <div style="margin: 20px">

                </div>

            </div>
            <div class="col-md-1 post-border">
            </div>


        </div>
    </div>


    <!-- 回复内容 -->

    <div class="container" style="margin-top: 150px">
        <c:if test="${!empty replies}">
        <c:forEach items="${replies}" var="reply">
        <div class="row" >
            <div class="col-md-1 reply-border">


            </div>
            <div class="col-md-2 reply-head">
                <img alt="" class="img-responsive img-circle" src=""
                     style="margin:1px 1px;width: 120px;height: 120px;margin-top: 50px;"/>

                <span class="User-info">
                        <span class="badge" style="background: #f1c40f;margin-top: 5px">姓名</span>
                        :<span class="badge" style="background: #f1c40f;margin-top: 5px"> ${reply.getUserName()}</span>
                    </span><br/>
                <span class="User-info">
                        <span class="badge" style="background: #2ecc71;margin-top: 5px">性别</span>
                        :<span class="badge" style="background: #2ecc71;margin-top: 5px">${reply.getSex()} </span>
                    </span>

            </div>

                    <div class="col-md-8 reply-content">

                        <div class="reply-time">
                            <span style="color: gray">回复于:${reply.getReplyTime()} </span>

                        </div>
                        <div style="margin: 20px;">
                            <span >
                                ${reply.getReplyContent()}
                    </span>
                        </div>

                    </div>




        </div>
        </c:forEach>
        </c:if>
    </div>
    <div></div>
    <form action="<%=path%>/topic/reply.do" method="post">
    <div style="height: 200px;margin: 70px auto; width: 800px;">
        <h4>发表回复</h4>
            <input type="hidden" name="topicId">
            <div style="margin: 5px auto;height: 100px; width: 800px">
                <textarea id="TextArea1" cols="100" rows="15" name="content" class="ckeditor"></textarea>

            </div>

    </div>
    <div style="margin:0 auto;width:200px;">
        <input type="button" class="btn btn-large btn-success" onclick="submit()" value="回复"></input>

    </div>
    </form>
    <div style="height: 20px"></div>


</div>

<script type="text/javascript">
    var url = '<%=path%>/topic/reply.do';
    function submit() {
        
    }
</script>

</body>
</html>