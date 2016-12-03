<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>支付页面</title>
<link rel="stylesheet" href="/DDbook/css/base.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_common.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_header.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_gouwuche.css"
	type="text/css" />
<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
<script type="text/javascript" src="/DDbook/js/topNav.js"></script>
<script type="text/javascript" src="/DDbook/js/jquery.goodnums.js"></script>
<script type="text/javascript" src="/DDbook/js/shop_gouwuche.js"></script>

<style type="text/css">
.shop_bd_shdz_title {
	width: 1000px;
	margin-top: 10px;
	height: 50px;
	line-height: 50px;
	overflow: hidden;
	background-color: #F8F8F8;
}

.shop_bd_shdz_title h3 {
	width: 120px;
	text-align: center;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	font-weight: bold;
	background: #FFF;
	border: 1px solid #E8E8E8;
	border-radius: 4px 4px 0 0;
	float: left;
	position: relative;
	top: 10px;
	left: 10px;
	border-bottom: none;
}

.shop_bd_shdz_title p {
	float: right;
}

.shop_bd_shdz_title p a {
	margin: 0 8px;
	color: #555555;
}

.shop_bd_shdz_lists {
	width: 1000px;
}

.shop_bd_shdz_lists ul {
	width: 1000px;
}

.shop_bd_shdz_lists ul li {
	width: 980px;
	border-radius: 3px;
	margin: 5px 0;
	padding-left: 18px;
	line-height: 40px;
	height: 40px;
	border: 1px solid #FFE580;
	background-color: #FFF5CC;
}

.shop_bd_shdz_lists ul li label {
	color: #626A73;
	font-weight: bold;
}

.shop_bd_shdz_lists ul li label span {
	padding: 10px;
}

.shop_bd_shdz_lists ul li em {
	margin: 0 4px;
	color: #626A73;
}

.shop_bd_shdz {
	width: 1000px;
	margin: 10px auto 0;
}

.shop_bd_shdz_new {
	border: 1px solid #ccc;
	width: 998px;
}

.shop_bd_shdz_new div.title {
	width: 990px;
	padding-left: 8px;
	line-height: 35px;
	height: 35px;
	border-bottom: 1px solid #ccc;
	background-color: #F2F2F2;
	font-color: #656565;
	font-weight: bold;
	font-size: 14px;
}

.shdz_new_form {
	width: 980px;
	padding: 9px;
}

.shdz_new_form ul {
	width: 100%;
}

.shdz_new_form ul li {
	clear: both;
	width: 100%;
	padding: 5px 0;
	height: 25px;
	line-height: 25px;
}

.shdz_new_form ul li label {
	float: left;
	width: 100px;
	text-align: right;
	padding-right: 10px;
}

.shdz_new_form ul li label span {
	color: #f00;
	font-weight: bold;
	font-size: 14px;
	position: relative;
	left: -3px;
	top: 2px;
}
</style>

<script type="text/javascript">
	jQuery(function() {
		jQuery("#new_add_shdz_btn").toggle(function() {
			jQuery("#new_add_shdz_contents").show(500);
		}, function() {
			jQuery("#new_add_shdz_contents").hide(500);
		});
	});
</script>
</head>
<body>
	<!-- Header  -wll-2013/03/24 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<div class="shop_hd_topNav_all_left">
					<p>
						<%
							Customer customer = (Customer) session.getAttribute("customer");
							pageContext.setAttribute("customer", customer);
						%>
						<%
							String str = "";
							if (customer == null) {
								str = "您好";
							} else {
								str = customer.getRealname();
							}
						%><span><%=str%></span>，欢迎来到<b><a href="index.jsp">叮叮书城</a></b><span
							id="yincang"
							<%String str1 = "";
			if (customer != null) {
				str1 = "style='display:none;'";
			}%>
							<%=str1%>>[<a href="/DDbook/front/login.jsp">登录</a>][<a
							href="/DDbook/front/register.jsp">注册</a>]
						</span>
					</p>
				</div>
				<!-- Header TopNav Left End -->

				<!-- Header TopNav Right -->
				<div class="shop_hd_topNav_all_right">
					<ul class="topNav_quick_menu">


						<li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">我的商城<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
									<ul>
										<li><a title="已买到的商品" target="_top" href="order.jsp">已买到的商品</a></li>
										<li><a title="个人主页" target="_top" href="order.jsp">个人主页</a></li>

									</ul>
								</div>
							</div>
						</li>
						<%
							List<Cart> cartlist = (List<Cart>) session.getAttribute("cartlist");
							int i = 0;
							if (cartlist != null) {
								for (Cart c : cartlist) {
									i++;
								}
							}
							pageContext.setAttribute("i", i);
						%>
						<li>
							<div class="topNav_menu">
								<a href="flow.jsp" class="topNavHover">购物车<b><label>${i }</label></b>种商品<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">


									<p
										<%String str2;
			if (i != 0) {
				str2 = "style='display:none;'";
			} else {
				str2 = "";
			}%>
										<%=str2%>>还没有商品，赶快去挑选！</p>
								</div>
							</div>
						</li>

						<li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">我的收藏<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
									<ul>
										<li><a title="收藏的商品" target="_top" href="favorite.jsp">收藏的商品</a></li>

									</ul>
								</div>
							</div>
						</li>
						<li>
							<div class="topNav_menu">
								<a href="#" class="topNavHover">商家支持<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
									<ul>
										<li><a title="收藏的商品" target="_top" href="">商家中心</a></li>
										<li><a title="收藏的商品" target="_top" href="">商家入驻</a></li>

									</ul>
								</div>
							</div>
						</li>
						<li>
							<div class="topNav_menu">
								<a href="/DDbook/back/login.jsp">后台登录</a>
							</div>
						</li>

					</ul>
				</div>
				<!-- Header TopNav Right End -->
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!-- Header TopNav End -->

		<!-- TopHeader Center -->
		<div class="shop_hd_header">
			<div class="shop_hd_header_logo">
				<h1 class="logo">
					<a href="/"><img src="/DDbook/images/11.png" alt="ShopCZ" /></a><span>ShopCZ</span>
				</h1>
			</div>
			<div class="shop_hd_header_search">
				<ul class="shop_hd_header_search_tab">
					<li id="search" class="current">商品</li>
					<li id="shop_search">店铺</li>

				</ul>
				<div class="clear"></div>
				<div class="search_form">
					<form method="post" action="index.php">
						<div class="search_formstyle">
							<input type="text" class="search_form_text" name="search_content"
								placeholder="搜索其实很简单！" value="" /> <input type="submit"
								class="search_form_sub" name="secrch_submit" value="" title="搜索" />
						</div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="search_tag">
					<a href="list.jsp">工具书</a> <a href="list.jsp">摄影</a> <a
						href="list.jsp">养生</a> <a href="list.jsp">育儿</a> <a
						href="list.jsp">小说</a>
				</div>

			</div>
		</div>
		<div class="clear"></div>
		<!-- TopHeader Center End -->

		<!-- Header Menu -->
		<div class="shop_hd_menu">
			<!-- 所有商品菜单 -->

			<div id="shop_hd_menu_all_category" class="shop_hd_menu_all_category">
				<!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				<div class="shop_hd_menu_all_category_title">
					<h2 title="所有商品分类">
						<a href="javascript:void(0);">所有商品分类</a>
					</h2>
					<i></i>
				</div>
				<div id="shop_hd_menu_all_category_hd"
					class="shop_hd_menu_all_category_hd">
					<ul class="shop_hd_menu_all_category_hd_menu clearfix">
						<!-- 单个菜单项 -->
						<li id="cat_1" class="">
							<h3>
								<a href="" title="教育">教育</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">教育</a>
									</dt>
									<dd>
										<a href="">中小学教辅</a> <a href="">考试</a> <a href="">外语</a> <a
											href="">教材</a> <a href="">工具书</a>
									</dd>
								</dl>

							</div>
						</li>
						<!-- 单个菜单项 End -->
						<li id="cat_2" class="">
							<h3>
								<a href="" title="文艺">文艺</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">文艺</a>
									</dt>
									<dd>
										<a href="">小说</a> <a href="">文学</a> <a href="">青春文学</a> <a
											href="">动漫</a> <a href="">幽默</a> <a href="">艺术</a> <a href="">摄影</a>
										<a href="">传记</a>

									</dd>
								</dl>


							</div>
						</li>

						<li id="cat_3" class="">
							<h3>
								<a href="" title="社科">社科</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">社会科学</a>
									</dt>
									<dd>
										<a href="">哲学</a> <a href="">历史</a> <a href="">政治</a> <a
											href="">文化</a> <a href="">军事</a> <a href="">法律</a> <a href="">心理</a>
										<a href="">社会科学</a>
									</dd>
								</dl>
							</div>
						</li>

						<li id="cat_4" class="">
							<h3>
								<a href="" title="生活">生活</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">生活</a>
									</dt>
									<dd>
										<a href="">育儿</a> <a href="">亲子</a> <a href="">养生</a> <a
											href="">运动</a> <a href="">旅游</a> <a href="">美食</a> <a href="">时尚</a>
										<a href="">居家</a>
									</dd>
								</dl>
							</div>
						</li>

						<li id="cat_5" class="">
							<h3>
								<a href="" title="童书">童书</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">儿童读物</a>
									</dt>
									<dd>
										<a href="">科普百科</a> <a href="">幼儿启蒙</a> <a href="">幼儿读物</a> <a
											href="">励志成长</a> <a href="">智力游戏</a> <a href="">中国儿童文学</a> <a
											href="">外国儿童文学</a>

									</dd>
								</dl>
							</div>
						</li>

						<li id="cat_6" class="">
							<h3>
								<a href="" title="经管">经管</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">经济管理</a>
									</dt>
									<dd>
										<a href=""></a> <a href="">成功</a> <a href="">管理</a> <a href="">经济</a>
										<a href="">投资理财</a>
									</dd>
								</dl>
							</div>
						</li>
						<li id="cat_7" class="">
							<h3>
								<a href="" title="科技">科技</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">科技</a>
									</dt>
									<dd>
										<a href="">农业</a> <a href="">林业</a> <a href="">医学</a> <a
											href="">建筑</a>
									</dd>
								</dl>
							</div>
						</li>
						<li id="cat_8" class="">
							<h3>
								<a href="" title="期刊杂志">期刊杂志</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="list.jsp">期刊杂志</a>
									</dt>
									<dd>
										<a href="">期刊/杂志</a>
									</dd>
								</dl>
							</div>
						</li>
						<li class="more"><a href="">查看更多分类</a></li>
					</ul>
				</div>
			</div>
			<!-- 所有商品菜单 END -->

			<!-- 普通导航菜单 -->
			<ul class="shop_hd_menu_nav">
				<li class="link"><a href="/DDbook/front/index.jsp"><span>首页</span></a></li>
				<li class="link"><a href="/DDbook/front/index1.jsp"><span>金书仓</span></a></li>
				<li class="link"><a href="/DDbook/front/index2.jsp"><span>尾品汇</span></a></li>
				<li class="link"><a href="ranking.jsp"><span>排行榜</span></a></li>
			</ul>
			<!-- 普通导航菜单 End -->
		</div>
		<!-- Header Menu End -->

	</div>
	<div class="clear"></div>
	<!-- 面包屑 注意首页没有 -->
	<div class="shop_hd_breadcrumb">
		<strong>当前位置：</strong> <span> <a href="">首页</a>&nbsp;›&nbsp; <a
			href="">我的商城</a>&nbsp;›&nbsp; <a href="">我的购物车</a>
		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->

	<!-- 购物车 Body -->
	<div class="shop_gwc_bd clearfix">
		<div class="shop_gwc_bd_contents clearfix">

			<!-- 购物流程导航 -->
			<div class="shop_gwc_bd_contents_lc clearfix">
				<ul>
					<li class="step_a">确认购物清单</li>
					<li class="step_b">确认收货人资料及送货方式</li>
					<li class="step_c hover_c">购买完成</li>
				</ul>
			</div>
			<!-- 购物流程导航 End -->
			<div class="clear"></div>
		</div>
<%
	String orderid = request.getParameter("orderid");
	String total = request.getParameter("total");
	request.setAttribute("orderid", orderid);
	request.setAttribute("total", total);
 %>
		<div id="s_bdw">
			<div id="s_bd">
				<div class="osuccess">
					<strong class="tit">您的订单提交成功！</strong>
					<p>请尽快付款，否者我们将取消此订单。</p>
					<div class="ddinfo">
						订单编号：${orderid } <a class="blue" href="#">查看订单详情</a><br>付款方式：在线支付<br>应付金额：<strong
							class="red">￥${total }</strong>
					</div>
					<form action="../customer.do?method=pay&orderid=${orderid }" method="post"
						id="form1" target="_top">
						<input type="hidden" name="method" value="" /> <input
							type="hidden" name="oid" value="" />
						<div class="divBank">
							<div class="divText">选择网上银行</div>
							<div style="margin-left: 20px;">
								<div style="margin-bottom: 20px;">
									<input id="ICBC-NET-B2C" type="radio" name="yh"
										value="ICBC-NET-B2C" checked="checked" /> <img
										name="ICBC-NET-B2C" align="middle"
										src="<c:url value='/bank_img/icbc.bmp'/>" /> <input
										id="CMBCHINA-NET-B2C" type="radio" name="yh"
										value="CMBCHINA-NET-B2C" /> <img name="CMBCHINA-NET-B2C"
										align="middle" src="<c:url value='/bank_img/cmb.bmp'/>" /> <input
										id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" />
									<img name="ABC-NET-B2C" align="middle"
										src="<c:url value='/bank_img/abc.bmp'/>" /> <input
										id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" />
									<img name="CCB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/ccb.bmp'/>" />
								</div>
								<div style="margin-bottom: 20px;">
									<input id="BCCB-NET-B2C" type="radio" name="yh"
										value="BCCB-NET-B2C" /> <img name="BCCB-NET-B2C"
										align="middle" src="<c:url value='/bank_img/bj.bmp'/>" /> <input
										id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
									<img name="BOCO-NET-B2C" align="middle"
										src="<c:url value='/bank_img/bcc.bmp'/>" /> <input
										id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" />
									<img name="CIB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/cib.bmp'/>" /> <input
										id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
									<img name="NJCB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/nanjing.bmp'/>" />
								</div>
								<div style="margin-bottom: 20px;">
									<input id="CMBC-NET-B2C" type="radio" name="yh"
										value="CMBC-NET-B2C" /> <img name="CMBC-NET-B2C"
										align="middle" src="<c:url value='/bank_img/cmbc.bmp'/>" /> <input
										id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" />
									<img name="CEB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/guangda.bmp'/>" /> <input
										id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" />
									<img name="BOC-NET-B2C" align="middle"
										src="<c:url value='/bank_img/bc.bmp'/>" /> <input
										id="PINGANBANK-NET" type="radio" name="yh"
										value="PINGANBANK-NET" /> <img name="PINGANBANK-NET"
										align="middle" src="<c:url value='/bank_img/pingan.bmp'/>" />
								</div>
								<div style="margin-bottom: 20px;">
									<input id="CBHB-NET-B2C" type="radio" name="yh"
										value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C"
										align="middle" src="<c:url value='/bank_img/bh.bmp'/>" /> <input
										id="HKBEA-NET-B2C" type="radio" name="yh"
										value="HKBEA-NET-B2C" /> <img name="HKBEA-NET-B2C"
										align="middle" src="<c:url value='/bank_img/dy.bmp'/>" /> <input
										id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
									<img name="NBCB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/ningbo.bmp'/>" /> <input
										id="ECITIC-NET-B2C" type="radio" name="yh"
										value="ECITIC-NET-B2C" /> <img name="ECITIC-NET-B2C"
										align="middle" src="<c:url value='/bank_img/zx.bmp'/>" />
								</div>
								<div style="margin-bottom: 20px;">
									<input id="SDB-NET-B2C" type="radio" name="yh"
										value="SDB-NET-B2C" /> <img name="SDB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/sfz.bmp'/>" /> <input
										id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" />
									<img name="GDB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/gf.bmp'/>" /> <input
										id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" />
									<img name="SHB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/sh.bmp'/>" /> <input
										id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
									<img name="SPDB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/shpd.bmp'/>" />
								</div>
								<div style="margin-bottom: 20px;">
									<input id="POST-NET-B2C" type="radio" name="yh"
										value="POST-NET-B2C" /> <img name="POST-NET-B2C"
										align="middle" src="<c:url value='/bank_img/post.bmp'/>" /> <input
										id="BJRCB-NET-B2C" type="radio" name="yh"
										value="BJRCB-NET-B2C" /> <img name="BJRCB-NET-B2C"
										align="middle"
										src="<c:url value='/bank_img/beijingnongshang.bmp'/>" /> <input
										id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" />
									<img name="HXB-NET-B2C" align="middle"
										src="<c:url value='/bank_img/hx.bmp'/>" /> <input
										id="CZ-NET-B2C" type="radio" name="yh" value="CZ-NET-B2C" /> <img
										name="CZ-NET-B2C" align="middle"
										src="<c:url value='/bank_img/zheshang.bmp'/>" />
								</div>
							</div>
							<div style="margin: 40px;">
							<label><strong>请输入银行卡密码：</strong></label><input type="password" name="bankCardPassword">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="付款">
							</div>
						</div>
					</form>
					
					<div class="nowgo">
						您现在还可以：<br> <a class="blue" href="index.jsp">返回首页</a><a
							class="blue" href="list.jsp">继续购物</a><a class="blue"
							href="order.jsp">订单中心</a>
					</div>
				</div>
				<!--osuccess end-->

				<dl style="margin-top:10px;">
					<dt>注意事项：</dt>
					<dd>
						1.“订单提交成功”仅表明叮叮网收到了您的订单，只有您的订单通过审核后，才代表订单正式生效；<br>2.选择货到付款/易迅快递的客户，请您务必认真检查所收货物，如有不符，您可以拒收；<br>3.选择其他方式的客户，请您认真检查外包装。如有明显损坏迹象，您可以拒收该货品，并及时通知我们；<br>4.建议在购买的15天内保留商品的全套包装、附件、发票等所有随货物品，以便后续的保修处理。
					</dd>
				</dl>

			</div>
			<!--s_bd end-->


		</div>


	</div>
	</div>
	<!-- 购物车 Body End -->

	<!-- Footer - wll - 2013/3/24 -->
	<div class="clear"></div>
	<div class="shop_footer">
		<div class="shop_footer_link">
			<p>
				<a href="">首页</a>| <a href="">招聘英才</a>| <a href="">广告合作</a>| <a
					href="">关于叮叮</a>| <a href="">关于我们</a>
			</p>
		</div>
		<div class="shop_footer_copy">
			<p>
				Copyright 2016-2020 ShopCZ Inc.,All rights reserved.<br />d by
				ShopCZ 2.4
			</p>
		</div>
	</div>
	<!-- Footer End -->

</body>
</html>