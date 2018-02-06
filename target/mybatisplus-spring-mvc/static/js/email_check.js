 function MathRand() 
    { 
		 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		 if(reg.test(document.getElementById("to").value)==false)
		 {  
			 document.getElementById("to").value="";
		 }
		 else{
			 var Num=""; 
		        for(var i=0;i<6;i++) 
		        { 
		           Num+=Math.floor(Math.random()*10); 
		        } 
		           document.getElementById("content").value=Num; 
		           return Num;
		           
		 }
    } 
    function checkCode(){
       if(document.getElementById("code").value==MathRand()){
    	   window.location.href="index.jsp"; 
       }
       else alert("验证码错误");
    }
    function secondEmail(){
      if(document.getElementById("userPassword")!=document.getElementById("userPassword1")){
        var text=document.getElementById("userPassword1");
        text.value="";
      }
    } 
    $(function(){
  	 	$("#form1").validate({
  	 		rules:{
                     
                    to:{
                        required:true,
                        email:true
                    }
                                      
                },
                messages:{
                    
                    to:{
                        required:"必填",
                        email:"E-Mail格式不正确"
                    }
                                                     
                }
  	 	});
  	});