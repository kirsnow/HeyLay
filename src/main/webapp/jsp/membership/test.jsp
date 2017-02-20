	$('#passsword').focusout(function() {
        var passsword = $('#passsword').val();
        
        //특수문자, 영문(대소문자) , 숫자 포함 형태의 8~15자리 이내의 암호
         var regPasssword = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/ ;
        
           if ( !regPasssword.test( $('#passsword').val()) ) {  
        	   addHasError();
           } else {
        	   removeHasError();
           }
        });
         
         function addHasError() {
 	    	$('#regPasssword').addClass('has-error');
 	        $('#regPasssword').text('특수문자 ,문자,숫자 포함 형태의 8~15자리 이내의 암호를 작성해주세요.').addClass('text-danger');
 	     } 
 	     
 	     function removeHasError(){
 	        $('#regPasssword').removeClass('has-error');
 	        $('#regPasssword').text('');
 	     }
      });
	
     