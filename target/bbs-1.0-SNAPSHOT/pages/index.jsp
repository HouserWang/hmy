<%@page import="java.util.Set,java.*,java.util.*,cn.itcast.pojo.Model"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <title>首页</title> 
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
</head>

<body>

 <jsp:include page="header.jsp"/>
 
   <div class="container User-info">
     
    <div class="row">
        <div class="col-xs-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="image/1.jpg" alt="..." style="width:100%;height:320px;">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/2.jpg" alt="..." style="width:100%;height:320px;">
                        <div class="carousel-caption">
                        </div>
                    </div>

                    <div class="item">
                        <img src="image/3.jpg" alt="..." style="width:100%;height:320px;">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    
	<div class="row" style="margin-top: 30px;">
		<div class="col-sm-9">
		    <ul class="list-group">
	                <div class="list-group-item active">板块分类</div>
	        </ul>
		      <%List modellist=(List<Model>)request.getAttribute("modelList"); %>
		      <div  class="row">
		      	<c:forEach items="${modelList}" var="item" >
		           <div class="col-sm-3" style="margin-bottom:10px;">
		             <button class="btn btn-default"  value="${item.getModelId()}" onclick="toModelTopics(this)">${item.getModelName()}&nbsp;&nbsp;</button>
		            </div>
		        </c:forEach>
		     </div>
	     </div>
	     
	             <div class="col-md-3">
            <ul class="list-group">
                <div class="list-group-item active">论坛公告</div>
                <div class="list-group-item">
                   <marquee style="color:#414141;font-size:12px;line-height:17px;"
                      direction="up" height="90" scrollamount="1" scrolldelay="100"
                     onMouseOver="this.scrollDelay=500" onMouseOut="this.scrollDelay=1" width="100%">
                       <c:forEach items="${noticeList}" var="Notice" >
                          <%--<a href="<%=request.getContextPath()%>/shownotice.do?topicid=${topics.getTopicId()}" class="list-group-item" style="height: 70px;">--%>
                            <p class=" text-right" style="float: right;margin-right: 20px;">公告:${Notice.getNotice()}</p>
                          <%--</a>--%>
			           </c:forEach>                                                           
                   </marquee>    
                </div>
            </ul>
               <a href="<%=request.getContextPath()%>/toNewPost.do" ><button type="button" class="btn btn-primary" style="width: 200px;height:50px;margin-left: 30px">我要发帖</button></a>
          </div>
    </div>
   
    <div class="row" >
        <div class="col-md-9">

            <ul class="list-group">
                <div class="list-group-item active">
                    论坛新帖
                    <%--<a href="<%=request.getContextPath() %>/more.action?type=-1&&page=1" style="float: right;color: white">更多>></a>--%>
                    <!--<p style="float: right"></p>-->
                </div>
         
                <c:forEach items="${topiclist}" var="topics" >
                  
                    <a href="<%=request.getContextPath()%>/showTopicAndReply.do?topicid=${topics.getTopicId()}" class="list-group-item" style="height: 70px;">
                     <h4 class="list-group-item-heading">[${topics.getTitle()}]</h4>
                        <span class="badge">新</span>
                        <p class=" text-right" style="float: right;margin-right: 20px;">发帖人:&nbsp;评论量: ${topics.getReplyCount()}&nbsp;发表日期:${topics.getPostDate()}</p>
                        
                   </a>
			</c:forEach>
            </ul>

        </div>

      	</div>

      <%--   <div class="row">
            <div class="col-md-9">
                <ul class="list-group">
                    <div class="list-group-item active">
                        精华帖
                        <a href="<%=request.getContextPath() %>/more.action?type=-2&&page=1" style="float: right;color: white">更多>></a>
                    </div>
                     <%
				   
				  	List<Post> posts = postBiz.getBestPosts(1,6);
				  	for (Post post:posts){
				   %>
                    <a href="<%=request.getContextPath()%>/pages/post.jsp?postId=<%=post.getId()%>&&page=1" class="list-group-item">
                        <h4 class="list-group-item-heading">[<%=post.getSubForum().getMainForum().getTitle()%>]</h4>
                            <%=post.getTitle() %><span class="badge">热</span>
                        <p class="text-right" style="float: right;margin-right: 20px">浏览量:<%=post.getViewNum()%>&nbsp;评论量:<%=post.getReplyNum()%>&nbsp;发表日期:<%=post.getTime()%></p>
                    </a>
                    
                     <%} %>
                </ul>
            </div>

            
    </div> --%>
     
        

    
   </div>
 </div>


 
 <div  style="margin-top: 80px;background-color: rgba(0,0,0,0.8);height: 100px;color: darkgray;width: 100%">
    <div style="width: 400px;padding-top: 35px;padding-left:40px;padding-right: 40px;margin:auto;">
        湖北经济学院bbs论坛
    </div>
</div>

 <script type="text/javascript">
     function toModelTopics(that) {
         var modelId = $(that).attr("value");
         var modelName = $(that).html();
         window.location.href="<%=request.getContextPath()%>/showModelPosts.do?modelId="+modelId+"&modelName="+modelName;

     }
 </script>
</body>
</html>