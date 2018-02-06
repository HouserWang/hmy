 
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
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="component/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="js/publish-post.js"></script>
 <script type="text/javascript">
 
 
function isNotMax(oinput){
if( oinput.value.length >oinput.getAttribute("maxlength")){
return oinput.value.substring(0,oinut.getAttribute("maxlength"));
}else{
return oinput.value;
}
}
</script>
<SCRIPT language="javascript">

 function checktext(text){ 

allValid = true; 

for (i = 0; i < text.length; i++) { 

if (text.charAt(i) != " ") { 

allValid = false; break; 

} 

}

return allValid;

}

function gbcount(Message,total,used,remain){

var max;max = total.value;

if (Message.value.length > max) {

Message.value = Message.value.substring(0,max);

used.value = max;

remain.value = 0;

alert("内容不能超过字数!");
 


}else {

used.value = Message.value.length;

remain.value = max - used.value;

}

}

 

</script>
    <style type="text/css">
        .tb {
            margin: 0 auto;
        }
            .tb tr th, .tb tr td {
                BORDER-left: #c2daf2 1px solid;
                BORDER-top: #c2daf2 1px solid;
                font-weight: normal;
                color: #000;
                background-repeat: repeat-x;
                FONT-SIZE: 9pt;
                FONT-FAMILY: Arial, "宋体";
                padding: 10px;
            }
            .tb tr th {
                width: 180px;
                background-color: #eff5fb;
            }
            .tb tr td {
                width: 800px;
                background-color: #f5f5f5;
            }
            .tb tr input {
                width: 500px;
            }
            .tb tr span {
                color: red;
            }
        .tab {
            width: 80px;
            border: 1px solid #ddddde;
            height: 27px;
            background: -webkit-linear-gradient(#e3e3e3, #fff); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(#e3e3e3, #fff); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(#e3e3e3, #fff); /* Firefox 3.6 - 15 */
            background: linear-gradient(#e3e3e3, #fff); /* 标准的语法 */
            text-align: center;
            line-height: 27px;
           
        }
           .tab:hover,.omg {
               background:#f5f5f5;
               border-bottom:1px solid #fff;
            }
        #small_btn_select {
            width: 120px;
          
        }
        #big_btn_select {
            width: 270px;
        }
        .btn-select {
            position: relative;
            display: inline-block;
           
            height: 35px;
          
            font: 14px/20px "Microsoft YaHei";
            color: #fff;
        }
            .btn-select .cur-select {
                position: absolute;
                display: block;
                width: 100%;
                height: 30px;
                
               text-align:center;
               
            }
           
            .btn-select select {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 30px;
                opacity: 0;
                filter: alpha(opacity: 0;);
                font: 14px/20px "Microsoft YaHei";
                color: #000;
            }
                .btn-select select option {
                    text-indent: 10px;
                }
                    .btn-select select option:hover {
                        background-color: #f80;
                        color: #fff;
                    }
             .inputtext {border:none; background-color: #f5f5f5;}
   </style>
     <script type="text/javascript">
        CKEDITOR.replace('ckeditor', { allowedContent: true });
     </script>
     <script type="text/javascript" src="js/jquery.validate.min.js"></script>
     <script type="text/javascript">
	  	$(function(){
	  	 	$("#signupForm").validate();
	  	});
    </script>
</head>
<body>

 <jsp:include page="header.jsp"/>
 <table class="tb" cellspacing="0" cellpadding="3">
  <form method="post" action="postTopic.do?">
    <tr>
            <th>文章标题</th>
            <td>
                <input required type="text" id="textfile" name="title" style="width:250px;" onKeyDown="gbcount(this.form.title,this.form.totaltitle,this.form.usedtitle,this.form.remaintitle);" onKeyUp="gbcount(this.form.Memo,this.form.totaltitle,this.form.usedtitle,this.form.remaintitle);"/>
                   <input disabled maxLength="2" name="totaltitle" size="1" value="30" class="inputtext" type="hidden"><!--可用总字数 -->
                   <input disabled maxLength="2" name="usedtitle" size="1" value="0" class="inputtext" type="hidden"><!-- 已用字数 -->                         
                                             剩余字数:<input disabled maxLength="2" name="remaintitle" size="1" value="30" class="inputtext">
               <!--  <span>你还可以输入30个字符</span> -->
                 
           </td>
    </tr>
    <tr>
            <th>文章内容</th>
            <td>
            <textarea type="text" class="" name="content" id="ckeditor" onKeyDown="gbcount(this.form.content,this.form.total,this.form.used,this.form.remain);" onKeyUp="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);"></textarea>
                   <input disabled maxLength="2" name="total" size="1" value="1000" class="inputtext" type="hidden"><!--可用总字数 -->
                   <input disabled maxLength="2" name="used" size="1" value="0" class="inputtext" type="hidden"><!-- 已用字数 -->                         
                                             剩余字数:<input disabled maxLength="2" name="remain" size="1" value="1000" class="inputtext">
            </td>
    </tr>
    <tr>
            <th>选择版块</th>
            <td>
                <div id="change" style="float:left">
                 <span style="float:right;line-height:35px;"><a href="showmodel.do">请选择所要发帖的版块</a> </span>
                 <%List modellist=(List<Model>)request.getAttribute("modelList"); %>
                 <c:forEach items="${modelList}" var="item" > ${item.getModelName()}&nbsp;&nbsp; </c:forEach>
                 <select name="change">
                   <c:forEach var="item" items="${modelList}">
                   <option  name="modelId" value="${item.getModelId()}">${item.getModelName()}</option>
                   </c:forEach>
                 </select>
                
                 
                </div>
                <!-- onChange="submit()" -->  
           </td>
   </tr>
   <tr>
            <th></th>
            <td>
               	<input type="submit" value="提交"/>
            </td>
  </tr>
  </form>
 </table>
    
        


</body>
	 
</html>