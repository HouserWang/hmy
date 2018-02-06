 
<%@ page language="java" import="java.util.*,cn.itcast.pojo.Model" pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("userName") == null){
response.sendRedirect(path+"/login.do");
return ;
}
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>头部公共区</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 </head>
<body>

 <jsp:include page="header.jsp"/>
 <table class="tb" cellspacing="0" cellpadding="3">
  <form method="post" action="addNotice.do?">
     
    <tr>
            <th>信息发布来源：</th>
            <td>
            <input type="text" name="noticeMan">
            </td>
    </tr>
     <tr>
            <th>公告内容</th>
            <td>
            <textarea type="text" class="" name="Notice" id="ckeditor" onKeyDown="gbcount(this.form.content,this.form.total,this.form.used,this.form.remain);" onKeyUp="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);"></textarea>
                   <input disabled maxLength="2" name="total" size="1" value="10000" class="inputtext" type="hidden"><!--可用总字数 -->
                   <input disabled maxLength="2" name="used" size="1" value="0" class="inputtext" type="hidden"><!-- 已用字数 -->                         
                                             剩余字数:<input disabled maxLength="2" name="remain" size="1" value="10000" class="inputtext">
            </td>
    </tr>
        
   <tr>
            <th></th>
            <td>
               	<input type="submit" value="发布"/>
            </td>
  </tr>
  </form>
 </table>
    
        


</body>
	 
</html>