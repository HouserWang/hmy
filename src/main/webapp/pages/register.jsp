<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>

        <head>
            <base href="<%=basePath%>">
            <title>注册</title>
            <meta http-equiv="pragma" content="no-cache">
            <meta http-equiv="cache-control" content="no-cache">
            <meta http-equiv="expires" content="0">
            <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
            <meta http-equiv="description" content="This is my page">
           
            <link rel="stylesheet" type="text/css" href="css/error.css" />
        </head>
        <body>
           <jsp:include page="header.jsp"/>    
            <div class="regist" style="padding: 50px 500px;">
                <form id="form1" role="form" action="<%=path%>/addUser.do" method="post">
                    <!--<label for="name">用户名:</label>-->
                    <input id="userName" type="text" class="form-control" name="userName" style="height: 40px; margin-top: 20px;" placeholder="请输入用户名">
                    <!--<label for="name"></label>-->
                    <input id="userPassword" type="password" class="form-control" name="userPassword" style="height: 40px;margin-top: 20px;" placeholder="请输入密码">

                    <input id="confirm_password" type="password" class="form-control" name="confirm_password" style="height: 40px;margin-top: 20px;"
                        placeholder="请重复密码">

                    <div style="margin-top: 10px;margin-left: 10px;">
                        <div style="float: left;margin-bottom: 10px">性别:</div>
                        <div style="float:left;margin-left: 100px;margin-bottom: 10px">
                            男<input type="radio" name="userSex" value="男">
                        </div>
                        <div style="float: right;margin-right: 100px;margin-bottom: 10px">
                            女<input type="radio" name="userSex" value="女">
                        </div>
                    </div>
                    <input id="email" type="email" class="form-control" name="email" style="height: 40px;margin-top: 20px;" placeholder="请输入邮箱">
                    <div style="height: 80px;width: 100%;margin-top: 20px;">
                        <input type="submit" class="btn btn-primary" value="注册" style="margin:auto;width: 100%;height: 40px;padding: 10px;"></input>

                    </div>

                </form>
            </div>
  </body>
<script type="text/javascript">
$(function(){
    var validate = $("#form1").validate({
        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
            form.submit();   //提交表单
        },   
        
        rules:{
            userName:{
                required:true
            },
            email:{
                required:true,
                email:true
            },
            userPassword:{
                required:true,
                rangelength:[3,10]
            },
            confirm_password:{
                equalTo:"#userPassword"
            }                    
        },
        messages:{
            userName:{
                required:"必填"
            },
            email:{
                required:"必填",
                email:"E-Mail格式不正确"
            },
            userPassword:{
                required: "不能为空",
                rangelength: $.validator.format("密码长度最短为3位，最长10位。")
            },
            confirm_password:{
                equalTo:"两次密码输入不一致"
            }                                    
        }
                  
    });    

});
</script>
        
        

        </html>