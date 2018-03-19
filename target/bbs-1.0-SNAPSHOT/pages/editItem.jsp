<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="picPath" value="http://127.0.0.1:8003/ssmImage19"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js_1/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js_1/jquery.form.js"></script>
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
  
  <form id="itemForm" action="${pageContext.request.contextPath }/items/saveOrUpdate.do" method="post">
 <input type="hidden" name="id" value="${item.id }"/>
  <p> 
		<img id='imgSize1ImgSrc' src='${picPath }${item.pic }'  height="100" width="100" />
		<input type='file' id='imgSize1File' name='imgSize1File' class="file" onchange='submitImgSize1Upload()' /> 
        <input type='hidden' id='imgSize1' name='pic' value='' reg="^.+$" tip="亲！您忘记上传图片了。" />
		</p>
 
 
</form>
 
 
      
 
</body>

</html>