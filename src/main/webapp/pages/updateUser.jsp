
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

    <title>编辑资料</title>

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

    <%
        String oldPassword = (String) request.getSession().getAttribute("userPassword");
        request.getSession().setAttribute("oldPassword",oldPassword);
    %>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">修改个人信息</a></li>

            </ul>

        </div>

        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        修改个人信息
                    </h3>
                </div>
                <div class="panel-body">

                    <form id="form1" action="<%=path%>/updateUser.do" method="post" enctype="multipart/form-data">
                    <%--<form id="form1" action="<%=path%>/updateUser.jsp" method="post" enctype="multipart/form-data">--%>
                        <div class="form-group">
                            <a href="photo.do"><img class="avatar left" src="${imageAddr}" id="imgPreview" height="70px;"/></a>点击上传你的头像<br/>
                        </div>
                        <input type="file" id="inputfile" accept="image/*" name="imageAddr" style="height:20px;" value=""><br/>

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input id="userName" type="text" class="form-control" name="userName" id="name" width="200px" height="80px" value="${userName }"
                                   placeholder="请输入名称"> <p class="help-block"> </p>
                        </div>

                        <div class="form-group">
                            <label for="name">性 别</label><br/>
                            <input class="hide" id="userSex" type="text" class="form-control"   name="userSex" size="30" value="${userSex}" />
                            <select id="sex" style="width:90px;">
                                <option value ="男">男</option>
                                <option value ="女">女</option>
                            </select>
                            <script>
                                $("#sex").val($("#userSex").val());
                                $("#sex").bind('change',function () {
                                  $("#userSex").val($("#sex").val());
                                })
                            </script>
                        </div>


                        <%--<dl class="form-group">--%>
                            <%--<dt><label for="user_profile_blog">邮箱</label></dt>--%>
                            <%--<dd><input id="email" type="email" class="form-control" id="user_profile_blog" name="email" size="30" value="${email}" />--%>
                                <%--<p class="help-block"> </p>--%>
                            <%--</dd>--%>
                        <%--</dl>--%>

                        <dl class="form-group">
                            <dt><label for="userPassword">密码</label></dt>
                            <dd><input class="form-control" id="userPassword" name="userPassword" size="30" type="text" width="200px" value="${userPassword}"/></dd>
                        </dl>
                        <%--<dl class="form-group">
                            <dt><label for="confirm_password">重复密码</label></dt>
                            <dd><input class="form-control" id="confirm_password" name="confirm_password" size="30" type="password" width="200px" /></dd>
                        </dl>--%>
                        <input type="submit" value="保存">
                        <a href="pages/updateUser.jsp"><input type="button" value="取消"></a>
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
                userName:{
                    required:true
                },
                userPassword:{
                    rangelength:[6,20]
                },
                confirm_password:{
                    equalTo:"#userPassword"
                }
            },
            messages:{
                userName:{
                    required:"必填"
                },
                userPassword:{
                    rangelength: $.validator.format("密码最小长度:{0}, 最大长度:{1}。")
                },
                confirm_password:{
                    equalTo:"两次密码不一致"
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