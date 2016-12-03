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
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>用户登录</title>
<link rel="stylesheet" href="/DDbook/css/base.css" />
<link rel="stylesheet" href="/DDbook/css/global.css" />
<link rel="stylesheet" href="/DDbook/css/login-register.css" />
</head>
<body>
	<div class="header wrap1000">
		<a href=""><img src="/DDbook/images/11.png" alt="" /></a>
	</div>

	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户注册</h3>
			</div>
			<div class="form-bd">
				<form action="/DDbook/customer.do?method=regist" method="post">
					<dl>
						<dt>用户名</dt>
						<dd>
							<input id="user" type="text" name="username" class="text" />&nbsp;*
						</dd>
					</dl>
					<dl>
						<dt>真实姓名</dt>
						<dd>
							<input id="name" type="text" name="realname" class="text" />&nbsp;*
						</dd>
					</dl>
					<dl>
						<dt>密码</dt>
						<dd>
							<input id="pwd" type="password" name="password1" class="text" />&nbsp;*
						</dd>
					</dl>
					<dl>
						<dt>确认密码</dt>
						<dd>
							<input id="pass" type="password" name="password2" class="text" />&nbsp;*
						</dd>
					</dl>
					<dl>
						<dt>手机</dt>
						<dd>
							<input id="tel" type="text" name="tel" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>邮箱</dt>
						<dd>
							<input id="email" type="text" name="email" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd>
							<input type="submit" value="立即注册" class="submit" /> <input
								type="checkbox" checked="checked" />阅读并同意<a href=""
								class="forget">服务协议</a>
						</dd>
					</dl>
				</form>

			</div>
			<div class="form-ft"></div>
		</div>

		<div class="login-form-left fl">
			<dl class="func clearfix">
				<dt>注册之后您可以</dt>
				<dd class="ico05">
					<i></i>购买商品支付订单
				</dd>
				<dd class="ico01">
					<i></i>申请开店销售商品
				</dd>
				<dd class="ico03">
					<i></i>空间好友推送分享
				</dd>
				<dd class="ico02">
					<i></i>收藏商品关注店铺
				</dd>
				<dd class="ico06">
					<i></i>商品资讯服务评价
				</dd>
				<dd class="ico04">
					<i></i>安全交易诚信无忧
				</dd>
			</dl>

			<div class="if">
				<h2>如果您是本站用户</h2>
				<p>
					我已经注册过账号，立即 <a href="login.jsp" class="register">登录</a> 或是 <a
						href="" class="findpwd">找回密码？</a>
				</p>
			</div>
		</div>
	</div>

	<div class="footer clear wrap1000">
		<p>
			<a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a
				href="">关于ShopCZ</a> | <a href="">联系我们</a>
		</p>
		<p>Copyright 2016-2020 itcast Inc.,All rights reserved.</p>
	</div>
	<span>${msg }</span>

</body>
</html>
