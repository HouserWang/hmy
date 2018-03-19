
$(function(){
    var validate = $("#form1").validate({
        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
            alert("提交表单");   
            form.submit();   //提交表单   
        },   
        
        rules:{
            email:{
                required:true,
                email:true
            },
            userPassword:{
                required:true,
                rangelength:[3,10]
            }                
        },
        messages:{
           
            email:{
                required:"必填",
                email:"E-Mail格式不正确"
            },
            userPassword:{
                required: "不能为空",
                rangelength: $.validator.format("密码长度最短为3位，最长10位。")
            }                                  
        }
                  
    });    

});
