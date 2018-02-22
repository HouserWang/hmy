<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
<!--  <div style="position:fixed;top:23px;">woshi</div>固定位置在顶端 -->
<!--  <form name="form1" action="pages/error.jsp">
<select name="sel" size="1" onChange="submit()">
<option value="yi">1111</option>
<option value="er">2222</option>
<option value="san">3333</option>
</select>
</form> -->
<%
  if(request.getAttribute("T_flag")==null)
  {
  response.sendRedirect(basePath+"allIndex.do");
    
   }
 
   %>
  </body>
</html>
