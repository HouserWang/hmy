<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> <html>
<head>
<title>ajax</title>
</head>
<body>
<%
String email = request.getParameter("email") ;
String password = request.getParameter("password") ;
System.out.println("email--->"+email); if(email != null && password != null){
if(email.equals("aja")){
out.write("<font color=red>恭喜你!此邮箱可用</font>"); }else{
out.write("<font color=red>此邮箱已被人占用</font>") ; }
}
%>
</body>
</html>