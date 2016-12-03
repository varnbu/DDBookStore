<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/DDbook/Style/skin.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
        function logout() {
            if(window.confirm('您确定要退出吗？')) {
                top.location = 'login.jsp';
            }
        }
    </script>
  </head>
  
  <body>
    <table cellpadding="0" width="100%" height="64" background="/DDbook/images/top_top_bg.gif">
            <tr valign="top">
                <td width="50%" style="color:#FFF; font-size:32px">叮叮书城管理系统</a></td>
                <td width="30%" style="padding-top:13px;font:15px Arial,SimSun,sans-serif;color:#FFF">管理员：<b></b> 您好，感谢登陆使用！</td>
                <td style="padding-top:10px;" align="center"><a href="javascript:void(0)"><img style="border:none" src="/DDbook/images/index.gif" /></a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:void(0)"><img style="border:none" src="/DDbook/images/out.gif" onclick="logout();" /></td>
            </tr>
        </table>
  </body>
</html>
