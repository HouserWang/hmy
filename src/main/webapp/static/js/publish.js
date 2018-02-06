 
function isNotMax(oinput){
   if( oinput.value.length >oinput.getAttribute("maxlength"))
   {
       return oinput.value.substring(0,oinut.getAttribute("maxlength"));
    }else{
       return oinput.value;
    }
}
function checktext(text){ 

	allValid = true; 

	for (i = 0; i < text.length; i++) { 

	if (text.charAt(i) != " ") { 

	allValid = false; break; 

	} 

	}

	return allValid;

	}

	function gbcount(message,total,used,remain){

	var max;max = total.value;

	if (message.value.length > max) {

	message.value = message.value.substring(0,max);

	used.value = max;

	remain.value = 0;

	alert("内容不能超过字数!");
	 


	}else {

	used.value = message.value.length;

	remain.value = max - used.value;

	}

	}

	CKEDITOR.replace('ckeditor', { allowedContent: true });
	$(function(){
  	 	$("#signupForm").validate();
  	});