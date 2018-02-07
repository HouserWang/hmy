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


        <div class="row" style="border:1px solid  #d0cfcf;width: 1000px;margin: 0 auto;">

            <div class="col-md-2 post-head" style="background: #eff4fb;height:187px;border-right:1px solid  #d0cfcf;">
                <!--<img src="img/tm-bg-slide-1.jpg" width="80px" height="80px" class="img-responsive img-circle">-->
                <img alt="" class="img-responsive img-circle" src=""
                     style="margin:1px 1px;width: 120px;height: 120px;margin: 10px auto 6px;"/>
                <%-- <%
                String args= request.getParameter("userName");
                String uName = new String(args.getBytes("ISO-8859-1"),"UTF-8");
                %> --%>
                <span class="User-info">
                    <span class="badge" style="background: #f1c40f;margin: 3px auto">发帖者</span>
                    :<span class="badge" style="background: #f1c40f;margin: 3px auto"><%=request.getAttribute("userName") %></span>
                </span><br/>
                <span class="User-info">
                    <span class="badge" style="background: #2ecc71;margin: 3px auto">性别</span>
                    :<span class="badge" style="background: #2ecc71;margin: 3px auto"><%=request.getAttribute("userSex") %></span>
                </span>
            </div>

            <div class="col-md-10 post-content" style="height:187px;padding: 0;">

                <div class="post-title"style="padding: 20px; height:150px;border-bottom: 1px solid #d0cfcf;">
                    <h3 style="margin:0;color:black">[<%=request.getAttribute("title") %> ] </h3>
                    <div>
                        <span>
                         <%=request.getAttribute("content") %>
                        </span>&nbsp;&nbsp; &nbsp;&nbsp;
                    </div>
                </div>

                <div class="reply-time" style="position: absolute;width:100%;left: 0; bottom: 7px;padding-left: 20px;">
                    <div style="float: right;margin-right: 14px;" >
                       赞&nbsp;&nbsp;<img src="image/zan.png" alt="..." style="width:24px;" >
                    </div>
                    <span style="color: gray;"> 发表于:<%=request.getAttribute("postDate") %> </span>
                </div>

                <strong style=" position: absolute;right: 10px;top: 10px;">
                        <span class="badge" style="background: #ff6927;width: 50px;">楼主</span>
                </strong>
            </div>


        </div>
    </div>


    <!-- 回复内容 -->

    <div class="container" style="margin: 0 auto">
        <c:if test="${!empty replies}">
        <c:forEach items="${replies}" var="reply">
        <div class="row" style="border:1px solid  #d0cfcf;width: 1000px;margin: 20px auto;" >

                <div class="col-md-2 reply-head" style="background: #eff4fb;border-right:1px solid  #d0cfcf;">
                    <img alt="" class="img-responsive img-circle" src=""
                         style="margin:1px 1px;width: 120px;height: 120px;margin: 10px auto 6px;"/>
                    <div style="margin: 3px 7px">
                        <span class="User-info">
                                <span class="badge" style="background: #f1c40f;margin: 3px auto">姓名</span>
                                :<span class="badge" style="background: #f1c40f;margin: 3px auto"> ${reply.getUserName()}</span>
                        </span><br/>
                        <span class="User-info">
                                <span class="badge" style="background: #2ecc71;margin: 3px auto">性别</span>
                                :<span class="badge" style="background: #2ecc71;margin: 3px auto">${reply.getSex()} </span>
                        </span>
                    </div>

                </div>

                <div class="col-md-10 reply-content" style="height:187px;padding: 0;" >
                    <div style="padding: 20px; height:153px;border-bottom: 1px solid #d0cfcf;">
                        <span >
                            ${reply.getReplyContent()}
                        </span>
                    </div>
                    <div class="reply-time" style="position: absolute;left: 20px; bottom: 7px;">
                        <span style="color: gray;">回复于:${reply.getReplyTime()} </span>
                    </div>
                </div>

        </div>
        </c:forEach>
        </c:if>
    </div>

    <form action="<%=path%>/topic/reply.do" method="post" id="form">
    <div style="margin: 0 auto 80px; width: 1000px;">
        <h4>发表回复</h4>
        <input type="hidden" name="topicId">
        <div style="position:relative;margin: 5px auto;">
            <textarea id="TextArea1" cols="140" rows="10" name="content" class="ckeditor"></textarea>
            <div style="position: absolute;right: 10px;bottom: 10px;">
                <input type="button" class="btn btn-large btn-success" onclick="submit()" value="回复"></input>

            </div>
        </div>

    </div>

    </form>
    <div style="height: 20px"></div>


</div>

<script type="text/javascript">
    function submit() {
        $.ajax({
            url:"${pageContext.request.contextPath}/topic/reply.do",
            type:"post",
            data:$("#form").serialize(),
            success:function(data){
                if(data.flag == 0){
                    layer.alert(data.Message);
                    return;
                }
                if(data.flag == 1){
                    history.go(0);
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