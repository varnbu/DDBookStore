<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

</head>

<body background="images/wel.JPG">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<!-- 头部开始 -->
		<tr>
			<td width="17" valign="top"
				background="/DDbook/images/mail_left_bg.gif"><img
				src="/DDbook/images/left_top_right.gif" width="17" height="29" /></td>
			<td valign="top" background="/DDbook/images/content_bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" background="/DDbook/images/content_bg.gif">
					<tr>
						<td height="31"><div class="title">欢迎界面</div></td>
					</tr>
				</table>
			</td>
			<td width="16" valign="top"
				background="/DDbook/images/mail_right_bg.gif"><img
				src="/DDbook/images/nav_right_bg.gif" width="16" height="29" /></td>
		</tr>
		<!-- 中间部分开始 -->
		<tr>
			<!--第一行左边框-->
			<td valign="middle" background="/DDbook/images/mail_left_bg.gif">&nbsp;</td>
			<!--第一行中间内容-->
			<td valign="top" bgcolor="#F7F8F9">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<!-- 空白行-->
					<tr>
						<td colspan="2" valign="top">&nbsp;</td>
						<td>&nbsp;</td>
						<td valign="top">&nbsp;</td>
					</tr>
					<tr>
						<div>
							<img alt="" src="images/wel.JPG">
						</div>
					</tr>
					<tr>
						<td width="2%">&nbsp;</td>
						<td width="51%" class="left_txt"><img
							src="/DDbook/images/icon_mail.gif" width="16" height="11">
							客户服务邮箱：dingding@163.com<br /> <img
							src="/DDbook/images/icon_phone.gif" width="17" height="14">
							官方网站：<a href="http://localhost:8080/DDbook/front/index.jsp/"
							target="_blank">叮叮之家</a></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

				</table>
			</td>
			<td background="/DDbook/images/mail_right_bg.gif">&nbsp;</td>
		</tr>

		<!-- 底部部分 -->
		<tr>
			<td valign="bottom" background="/DDbook/images/mail_left_bg.gif">
				<img src="/DDbook/images/buttom_left.gif" width="17" height="17" />
			</td>
			<td background="/DDbook/images/buttom_bgs.gif"><img
				src="/DDbook/images/buttom_bgs.gif" width="17" height="17"></td>
			<td valign="bottom" background="/DDbook/images/mail_right_bg.gif">
				<img src="/DDbook/images/buttom_right.gif" width="16" height="17" />
			</td>
		</tr>

	</table>

</body>
</html>
