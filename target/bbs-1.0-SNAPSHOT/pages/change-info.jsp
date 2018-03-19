 
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*,java.io.OutputStream,cn.itcast.pojo.User" pageEncoding="UTF-8"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'change-info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script src="js/jquery.min.js"></script>
	 <!-- 预览图片 -->
	<script type="text/javascript">
  function uploadHeader(){
		var fileUrl=$('#inputfile').val();
		console.log(fileUrl);
		var preview = document.getElementById('imgPreview');
		var file  = document.querySelector('input[type=file]').files[0];
		 var reader = new FileReader();
		 reader.onloadend = function () {
		  preview.src = reader.result;
		 }
		 if (file) {
		  reader.readAsDataURL(file);
		 } else {
		  preview.src = "";
		 }
	}  
	</script>

  </head>
  
  <body>
     <jsp:include page="header.jsp"/>
     
      <div class="container" style="margin-top: 30px">
    <%--<div class="row">--%>
        <%--<div class="col-xs-3">--%>
            <%--<ul class="nav nav-pills nav-stacked">--%>
                <%--<li role="presentation" class="active"><a href="#">个人信息</a></li>--%>
                <%--<li role="presentation"><a href="<%=path%>/showMyTopic.do">我的帖子</a></li>--%>
            <%--</ul>--%>

        <%--</div>--%>

        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        查看个人信息
                    </h3>
                </div>
                <div class="panel-body">
				 
				<%--<form id="form1" action="<%=path%>/updateUser.do" method="post" enctype="multipart/form-data">--%>
                    <form id="form1" action="<%=path%>/pages/updateUser.jsp" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <img class="avatar left" src="${user.imageAddr}" id="imgPreview" height="70px;"/><%--请上传你的头像<br/>--%>
                        </div>
                        <%--<input type="file" id="inputfile" accept="image/*" name="imageAddr" style="height:20px;" value=""><br/>--%>

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input id="username" type="text" class="form-control" name="userName" id="name" width="200px" height="80px" value="${user.userName }"
                                   placeholder="请输入名称" disabled="disabled"> <p class="help-block"> </p>
                        </div>

                        <div class="form-group">
                            <label for="name">性 别</label><br/>
                            <input id="userSex" type="text" class="form-control"   name="userSex" size="30" value="${user.userSex}" disabled="disabled"/>
                        </div>


                        <dl class="form-group">
                            <dt><label for="user_profile_blog">邮箱</label></dt>
                            <dd><input id="email" type="email" class="form-control" id="user_profile_blog" name="email" size="30" value="${user.email}" disabled="disabled"/>
                            <p class="help-block"> </p>
                            </dd>
                        </dl>
                        <dl class="form-group">
                            <dt><label for="user_profile_company">密码</label></dt>
                            <dd><input class="form-control" id="password" name="userPassword" size="30" type="text" width="200px" value="${user.userPassword}" disabled="disabled"/></dd>
                        </dl>
                        <%--<dl class="form-group">
                            <dt><label for="user_profile_location">重复密码</label></dt>
                            <dd><input class="form-control" id="confirm_password" name="userPassword" size="30" type="password" width="200px" /></dd>
                        </dl> --%>
                        <input type="submit" value="编辑资料">
                    </form>
                </div>
            </div>




                </div>
            </div>
        </div>
    </div>
</div>
     
     
  </body>
  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  	 	$("#form1").validate({
  	 		rules:{
                    username:{
                        required:true
                    },
                    email:{
                        required:true,
                        email:true
                    },
                    password:{
                        rangelength:[6,20]
                    },
                    confirm_password:{
                        equalTo:"#password"
                    }              
                },
                messages:{
                    username:{
                        required:"必填"
                    },
                    email:{
                        required:"必填",
                        email:"E-Mail格式不正确"
                    },
                    password:{
                        rangelength: $.validator.format("密码最小长度:{0}, 最大长度:{1}。")
                    },
                    confirm_password:{
                        equalTo:"两次密码输入不一致"
                    }                                    
                }
  	 	});
  	});
  </script>
  <style type="text/css">
  .error{
    color:red;
  }
  </style>
</html>