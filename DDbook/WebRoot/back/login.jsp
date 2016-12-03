<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/DDbook/Style/skin.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%">
            <!-- 顶部部分 -->
            <tr height="41"><td colspan="2" background="/DDbook/images/login_top_bg.gif">&nbsp;</td></tr>
            <!-- 主体部分 -->
            <tr style="background:url(/DDbook/images/login_bg.jpg) repeat-x;" height="532">
                <!-- 主体左部分 -->
                <td id="left_cont">
                    <table width="100%" height="100%">
                        <tr height="155"><td colspan="2">&nbsp;</td></tr>
                        <tr>
                            <td width="20%" rowspan="2">&nbsp;</td>
                            <td width="60%">
                                <table width="100%">
                                    <tr height="70"><td align="center"><img src="/DDbook/images/back_logo.png" title="叮叮图书" alt="叮叮图书" /></td></tr>
                                    <tr height="274">
                                        <td valign="top" align="right">
                                            <ul>
                                                <li>1- 网络购书的首选...</li>
                                                <li>2- 完善的购书体系，方便用户使用...</li>
                                                <li>3- 强大的后台系统，管理内容易如反掌...</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            <td width="15%" rowspan="2">&nbsp;</td>
                            </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                    </table>
                </td>
                <!-- 主体右部分 -->
                <td id="right_cont">
                    <table height="100%">
                        <tr height="30%"><td colspan="3">&nbsp;</td></tr>
                        <tr>
                            <td width="30%" rowspan="5">&nbsp;</td>
                            <td valign="top" id="form">
                                <form action="login.do?method=manager" method="post">
                                    <table valign="top" width="50%">
                                        <tr><td colspan="2"><h4 style="letter-spacing:1px;font-size:16px;">叮叮网站管理后台</h4></td></tr>
                                        <tr><td>管理员：</td><td><input type="text" name="managername" value="" /></td></tr>
                                        <tr><td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td><td><input type="password" name="password" value="" /></td></tr>
                                        <tr class="bt" align="center"><td>&nbsp;<input type="submit" value="登陆" /></td><td>&nbsp;<input type="reset" value="重置" /></td></tr>
                                    </table>
                                </form>
                            </td>
                            <td rowspan="5">&nbsp;</td>
                        </tr>
                        <tr><td colspan="3">&nbsp;</td></tr>
                    </table>
                </td>
            </tr>
            <!-- 底部部分 -->
            <tr id="login_bot"><td colspan="2"><p>Copyright © 2016-2017 叮叮 网络工作室</p></td></tr>
        </table>
        ${msg }
  </body>
</html>
