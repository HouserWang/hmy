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
out.write("<font color=red>��ϲ��!���������</font>"); }else{
out.write("<font color=red>�������ѱ���ռ��</font>") ; }
}
%>
</body>
</html>