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
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="http://static.geetest.com/static/tools/gt.js"></script>
<script language="javascript" defer="defer">
	function yanzheng(){
		var user = document.getElementById("user").value;
		var password = document.getElementById("pwd").value;
		if (user.trim() == "" || password.trim() == ""){
			alert("用户名或密码不能为空");
			return false;
		}
		return true;
	}
	function refreshCode(imgObj) {  

	    if (!imgObj) {  

	        imgObj = document.getElementById("validationCode");  

	    }  

	    var index = imgObj.src.indexOf("?");  

	    if(index != -1) {  

	        var url = imgObj.src.substring(0,index + 1);  

	        imgObj.src = url + Math.random();  

	    } else {  

	        imgObj.src = imgObj.src + "?" + Math.random();  

	    }  

	} 
</script>

</head>
<body>
	
	<div class="header wrap1000">
		<a href=""><img src="/DDbook/images/11.png" alt="" /></a>
	</div>

	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户登录</h3>
			</div>
			<div class="form-bd">
				<form action="/DDbook/login.do?method=customer" method="post">
					<dl>
						<dt>用户名</dt>
						<dd>
							<input id="user" type="text" name="username" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
						<dd>
							<input id="pwd" type="password" name="password" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd>
							<input id="checkCode" type="text" name="code" class="text" size="10" style="width:78px; line-height:20px;">
							<img id="validationCode" alt="验证码图片" title="验证码图片" src="<%=path %>/validationCodeServlet.png" onclick="refreshCode(this)"/>  
							<a id="aRecode" href="javascript:void(0);" onclick="refreshCode()">换一张</a>  
						</dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd>
							<input type="submit" value="登  录" class="submit" onclick="yanzheng();"/> 
							<a href="" class="forget">忘记密码?</a>
						</dd>
					</dl>
				</form>
				<dl>
					<dt>&nbsp;</dt>
					<dd>
						还不是本站会员？立即 <a href="/DDbook/front/register.jsp" class="register">注册</a>
					</dd>
				</dl>

			</div>
			<div class="form-ft"></div>
		</div>

		<div class="login-form-left fl">
			<img src="/DDbook/images/left.jpg" alt="" />
		</div>
	</div>

	<div class="footer clear wrap1000">
		<p>
			<a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a
				href="">关于叮叮</a> | <a href="">联系我们</a>
		</p>
		<p>Copyright 2016-2020 itcast Inc.,All rights reserved.</p>
	</div>
	${msg }

</body>
</html>
