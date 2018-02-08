<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("adminname") == null){
response.sendRedirect(path+"/manage/admin.jsp");
return ;
}
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%--     <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'Notice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/zzsc-demo.css">
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="../../static/js/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="css/index.css" rel="stylesheet">
	<!-- <link href="css/index.css" rel="stylesheet"> -->
  </head>
  
  <body>
    <jsp:include page="header.jsp"/>
  <div class="container" style="margin-top: 80px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                           <li ><a href="manage/Notice.jsp">发布公告</a></li>
                            <li><a href="pages/create_model.jsp">创建模块</a></li>
			                <li  ><a href="pages/change-admin.jsp">资料修改</a></li>
			                <li><a href=" manage/bestpost.jsp">精华帖请求</a></li>
			                <li><a href=" manage/limit.jsp">封锁用户</a></li>
                <!--<li role="presentation"><a href="#">Messages</a></li>-->
            </ul>
        </div>

  <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        创建讨论区
                    </h3>
                </div>
                <div class="panel-body">


                    <div class="column">

						<form action="addmodel.do" method="post">
                        <div class="form-group">
                            <label for="name">板块名称</label>
                            <input type="text" class="form-control" id="name" name="modelName" width="200px" height="80px"
                                   placeholder="请输入大板块名称">
                        </div>

                         
                        <p><button type="submit" class="btn btn-primary">创建板块</button></p>
                    </div>
                         
                    
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
   
  </body>
  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  	 	$("#signupForm").validate();
  	});
  </script>
</html>