<%@page import="com.ddbook.po.Manager"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% 
		Manager manager = (Manager)session.getAttribute("manager");
		
		if(manager==null){
			response.sendRedirect("/DDbook/back/login.jsp");
		}
		pageContext.setAttribute("manager", manager);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


  </head>
    <frameset rows="64,*"  frameborder="no" border="0" framespacing="0">
    <!--头部-->
    <frame src="/DDbook/back/top.jsp" name="top" noresize="noresize" frameborder="0"  scrolling="no" marginwidth="0" marginheight="0" />
    <!--主体部分-->
    <frameset cols="185,*">
        <!--主体左部分-->
        <frame src="/DDbook/back/left.jsp" name="left" noresize="noresize" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" />
        <!--主体右部分-->
        <frame src="/DDbook/back/main.jsp" name="main" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" />
	</frameset>

</html>
