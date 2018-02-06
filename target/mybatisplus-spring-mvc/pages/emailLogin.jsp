<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<meta charset="utf-8">
	<title>忘记密码——邮箱获取验证码登录</title>
	<meta author="hemeiyi">
	<link rel="stylesheet" type="text/css" href="css/register-login.css">
	<link rel="stylesheet" type="text/css" href="css/error.css">
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src='js/layer/layer.js' type="text/javascript"></script>
	<script src='js/email_check.js' type="text/javascript"></script>
</head>

<body>
<div id="box"></div>
<div class="cent-box register-box">
	<div class="cent-box-header">
		<h1 class="main-title hide">湖北经济学院bbs论坛</h1>
		<h2 class="sub-title">love life</h2>
	</div>

	<div class="cont-main clearfix">
    <form id="form1" method="post" action="jsps/mydeal.jsp" >
       <div class="login form">
		  <div class="group">
				<div class="group-ipt email">
					 <input name="to" type="text" id="to" title="收件人邮箱" class="ipt" size="60" placeholder="请输入邮箱地址"/>
                     <input name="from" type="text" id="from" title="发件人邮箱" size="60" value="hmymaple524@163.com" style="display:none"/>
	                 <input name="pass" type="password" id="pass" title="发件人邮箱密码" size="60" value="hmy524" style="display:none"/>
	                 <input name="subject" type="text" id="subject" title="主题" size="60" value="verification code" style="display:none"/>
                     <input name="content" type="text" id="content" title="邮件内容" size="60" style="display:none"/><br>
	                  
				</div>
			</div>
		</div>
		<button type="submit" style="position: relative;right: -300px;top: -22px;" onclick="MathRand()">获取验证码</button>
    </form>
    <div class="login form">
	   <div class="group">
        <div class="group-ipt email">
	        <input name="code" type="text" id="code"  placeholder="请输入验证码" onclick="MathRand()"/>
		</div>
		<div>
			<button type="submit" class="login-btn register-btn" id="button" onclick="checkCode()">登录</button>
		</div>
	  </div>
    </div>
   </div>
   <div class="footer">
	<p>湖北经济学院bbs论坛</p>
	<p>Designed By hemeiyi  2017</p>
   </div>
 </div>
</body>
</html>