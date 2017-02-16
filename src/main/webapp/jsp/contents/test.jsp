<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    //Loop through all Labels with class 'editable'.
    $(".editable").each(function () {
        //Reference the Label.
        var label = $(this);
 
        //Add a TextBox next to the Label.
        label.after("<input type = 'text' style = 'display:none' />");
 
        //Reference the TextBox.
        var textbox = $(this).next();
 
        //Set the name attribute of the TextBox.
        textbox[0].name = this.id.replace("lbl", "txt");
 
        //Assign the value of Label to TextBox.
        textbox.val(label.html());
 
        //When Label is clicked, hide Label and show TextBox.
        
        
        $('#button1').click( function() {
    	    
    	    if( $(this).html() == '수정' ) {
    	      $(this).html('확인');
    	      label.hide();
    	      label.next().show();
    	    }
    	    else {
    	      $(this).html('수정');
    	      textbox.hide();
    	      textbox.prev().html(textbox.val());
    	      textbox.prev().show();
    	    }
    	    
    	  });
    });
});

</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        Name:&nbsp;
    </td>
    <td>
        <span id="lblName" class="editable">Mudassar</span>
    </td>
</tr>
</table>
<button id='button1'>수정</button>
</body>
</html>