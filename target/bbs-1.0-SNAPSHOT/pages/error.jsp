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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.js"></script>
    <script type="text/javascript">
    function submitImgSize1Upload(){
    	
    	
    	var option={
    			type:'POST',
    			url:'${pageContext.request.contextPath }/upload/uploadPic.do',
    			dataType:'text',
    			data:{
    				fileName : 'imgSize1File'
    			},
    			success:function(data){
    				
    				//把json格式的字符串转换成json对象
    				var jsonObj = $.parseJSON(data);
    				
    				//返回服务器图片路径，把图片路径设置给img标签
    				$("#imgSize1ImgSrc").attr("src",jsonObj.fullPath);
    				//数据库保存相对路径
    				$("#imgSize1").val(jsonObj.relativePath);
    			}
    			
    		};
    	
    	$("#itemForm").ajaxSubmit(option);
    	
    }
    </script>
  </head>
  
  <body>
   <div>
    <img id='imgSize1ImgSrc' src='${picPath }${item.pic }'  height="100" width="100" />
    <input type='file' id='imgSize1File' name='imgSize1File' class="file" onchange='submitImgSize1Upload()' /><span class="pos" id="imgSize1FileSpan">请上传图片的大小不超过3MB</span>
    <input type='hidden' id='imgSize1' name='pic' value='' reg="^.+$" tip="亲！您忘记上传图片了。" />
   </div>
   
  </body>
</html>
