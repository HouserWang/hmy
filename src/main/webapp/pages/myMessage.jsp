<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("userName") == null){
	response.sendRedirect("/pages/login.jsp");
}
%>

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
                <li role="presentation" class="active"><a href="<%=path%>/pages/mypost.jsp">我的帖子</a></li>
                </a></li>
                <!--<li role="presentation"><a href="#">Messages</a></li>-->
            </ul>
        </div>

        <div class="col-md-9">

            <ul class="list-group">
                <a class="list-group-item active">
                    我的留言
                </a>

              
               
                <div class="list-group-item">
                    
                </div>
 				 
            </ul>
            
   <ul class="pagination pagination-lg" style="float:right">
 
    <li><a href="#">&laquo;</a></li>
      
    <li class="active"><a href="#"> </a></li>
    
    
    <li><a href="#"> </a></li>
    
    
     <li><a href="#">&raquo;</a></li>
  
    
     <li class="active"><a href=""></a></li>
   
     
     
     
      <li></li>
     
    
   
</ul><br>

        </div>
    </div>
</div>



  </body>
</html>