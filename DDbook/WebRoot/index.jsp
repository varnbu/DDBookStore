<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.getRequestDispatcher("book.do?method=getbysales").forward(request, response);
 %>

<html>
    <base href="<%=basePath%>">
</html>
