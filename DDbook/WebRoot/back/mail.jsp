<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">CKEDITOR.replace("TextArea1")</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
	function getdatas(){
		var stemTxt=CKEDITOR.instances.TextArea1.document.getBody().getText();
		var tt = document.getElementById("textbox");
		tt.innerHTML=stemTxt;
	}
	
	
	</script>
	
  </head>
  
  <body>
  <div>
  <textarea id="TextArea1" name="text" cols="20" rows="2" class="ckeditor"></textarea>
  </div>
  	<form action="manager.do?method=mail" method="post">
  		
  		<textarea rows="" cols="" id="textbox" name="text" style="display:none"></textarea>
  		<br>&nbsp;<input type="submit" onclick="getdatas()" value="发送">
  	</form>
    
    
  </body>
</html>
