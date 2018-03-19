<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" language="javascript">
	function checkform(){
	    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	    document.getElementById("to").value=document.getElementById("toAdrr").value;
	     
	     return reg.test(document.getElementById("to").value); 
		
	}
	function MathRand() 
    { 
        var Num=""; 
        for(var i=0;i<6;i++) 
        { 
           Num+=Math.floor(Math.random()*10); 
        } 
           document.getElementById("content").value=Num; 
           
    } 
</script>

<title>Insert title here</title>
</head>
<body>
<!-- 输入框输入邮箱  进行验证 -->
<input type="text" id="toAdrr" name="toAdrr" onmouseout="checkform()"/>
<form name="form1" method="post" action="mydeal.jsp" >
    <input name="to" type="text" id="to" title="收件人邮箱" size="60"  style="display:none"/><br>
    <input name="from" type="text" id="from" title="发件人邮箱" size="60" value="hmymaple524@163.com" style="display:none"/><br>
	<input name="pass" type="password" id="pass" title="发件人邮箱密码" size="60" value="hmy524" style="display:none"/><br>
	<input name="subject" type="text" id="subject" title="主题" size="60" value="verification code" style="display:none"/><br>
   <input name="content" type="text" id="content" title="邮件内容" size="60" style="display:none"/><br>
	<p>
	<input name="submit" type="submit" id="submit" value="发送邮箱" onclick="MathRand()"/>
    <!-- 生成随机数发送给邮箱 -->
</form>
</body>
</html>