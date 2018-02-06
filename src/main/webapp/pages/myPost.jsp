<%@ page language="java" import="java.util.*,cn.itcast.pojo.Topic" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=path%>/pages/change-info.jsp">资料修改</a></li>
                <li role="presentation" class="active"><a href="<%=path%>/showMyTopic.do">我的帖子</a></li>
                <li role="presentation"><a href="<%=path%>/pages/records.jsp">申请记录</a></li>
                <!--<li role="presentation"><a href="#">Messages</a></li>-->
            </ul>
        </div>

        <div class="col-md-9">

            <ul class="list-group">
                <a class="list-group-item active">我的帖子 </a>
                <div class="list-group-item">
                    <a href="<%=path%>/pages/post.jsp" style="color:grey">
                        <h4 class="list-group-item-heading" style="color:black">
                        <c:forEach items="${mytopicList}" var="topics" >
                  
                         <a href="<%=request.getContextPath()%>/showTopicAndReply.do?topicid=${topics.getTopicId()}" class="list-group-item" style="height: 70px;">
                         <h4 class="list-group-item-heading">[${topics.getTitle()}]</h4>
                         <p class=" text-right" style="float: right;margin-right: 20px;">发帖人:&nbsp;评论量: ${topics.getReplyCount()}&nbsp;发表日期:${topics.getPostDate()}</p>
                          <%-- <a href="<%=path%>/editpost.do?topicId=${topics.getTopicId()}" style="float: right">编辑</a>
                         <a href="<%=path%>/applybest.do?topicId=${topics.getTopicId()}" style="float: right">申请精华贴&nbsp;</a> --%>
                         </a>
                         
                      </c:forEach>
                      </h4>
                    </a>
                     
                </div>
 		   </ul>
            
    <ul class="pagination pagination-lg" style="float:right">
    <li><a href="#">&laquo;</a></li>
    <li class="active"><a href="#"> </a></li>
    <li><a href="#"> </a></li>
    <li><a href="#">&raquo;</a></li>
    <li class="active"><a href=""></a></li>
    
    
   
</ul><br>

        </div>
    </div>
</div>
 
                           
<div align="center">
    <a href="${pageContext.request.contextPath}/action_topic_fenye?offset=1">首页</a> 
    <!-- 判断是不是首页 不是则显示上一页-->
    <c:if test="${currpage==1}">
                                                         上一页&nbsp;
    </c:if>
    <c:if test="${currpage>1}">
                <a href="${pageContext.request.contextPath}/action_topic_fenye?offset=${currpage*5-10}">上一页</a>&nbsp;
    </c:if> 
     <c:if test="${currpage==4}">
                                                         下一页&nbsp;
    </c:if>
    <c:if test="${currpage<4}">
                <a href="${pageContext.request.contextPath}/action_topic_fenye?offset=${currpage*5+1}">下一页</a>&nbsp;
    </c:if> 
    <a href="${pageContext.request.contextPath}/action_topic_fenye?offset=15">尾页</a>    
    <!--四舍五入进一 -->
    <%--  <fmt:formatNumber type="number" value="  ${5/6} " maxFractionDigits="0"></fmt:formatNumber> --%>
             第${currpage} 页/共 <fmt:formatNumber type="number" value="  ${(allrow+4-(allrow+4)%5)/5} "></fmt:formatNumber>页   
    <form action="dept!getAllDeptByPage.action" method="post" id="form">  
                                                      跳转到<input type="text" name="pageInfo.pagenum" id="goPage" size="1"/>页  
    <input type="button" value="go" id="go"/>  
    </form>  
</div>  




  </body>
</html>