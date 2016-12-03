<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
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
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>新闻页面</title>
<link rel="stylesheet" href="/DDbook/css/base.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_common.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_header.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_list.css" type="text/css" />

<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
<script type="text/javascript" src="/DDbook/js/topNav.js"></script>

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

						<li>
							<div class="topNav_menu">
								<a href="flow.jsp" class="topNavHover">购物车<b><label>0</label></b>种商品<i></i></a>
								<div class="topNav_menu_bd" style="display:none;">
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
					<a href="">摄影</a> <a href="">养生</a> <a href="">育儿</a> <a href="">小说</a>
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
				<li class="current_link"><a href="index.jsp"><span>首页</span></a></li>
				<li class="link"><a href="index1.jsp"><span>金书仓</span></a></li>
				<li class="link"><a href="index2.jsp"><span>尾品汇</span></a></li>
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
			href="">新闻</a>
		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->

	<!-- Body -->
	<style type="text/css">
.news {
	width: 1000px;
	margin: 10px auto 0;
	border: 1px solid #EBEBEB;
	color: #666666;
}

.news .title {
	width: 100%;
	height: 80px;
}

.news .title h1 {
	width: 95%;
	margin: 20px auto 0px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 22px;
	border-bottom: 1px solid #dfdfdf;
}

.news .title h2 {
	text-align: center;
	margin-top: 10px;
	color: #999999;
}

.news .content {
	padding: 30px 20px;
	font-size: 14px;
	line-height: 2em;
}
</style>
	<div class="news">
		<div class="title">
			<h1>微联超级APP场景化升级</h1>
			<h2>时间：2015-07-09 09:38:51</h2>
		</div>
		<div class="content">
			<p>
				<a href="" target="_blank"></a>
			</p>
			亲爱的各位网友：<br>国内首款完成智能硬件产品跨品牌集中控制和数据集中管理的应用——微联超级APP近日宣布升级到2.1版，全面支持场景化。用户可以根据自己的生活习惯建立一个场景模式，然后给该场景添加一系列相关设备及设备需要执行的动作，各设备动作之间可以设置时间间隔；此后，当用户点击执行该场景模式，相关设备即可自动按照定义好的动作序列自动执行。<br>例如，用户可以将空调开启到26度、热水器开始加热、窗帘关闭后灯光点亮至最佳色温和亮度、电视自动开机并切换到用户最喜欢的频道等等一系列操作设置为“回家模式”；用户也可以设置“睡眠模式”为灯光渐暗到熄灭、空调到睡眠模式、视听大家电关闭……<br>场景化模式不仅令用户使用更加便利和人性化，也从生态角度推进了智能产品的购物场景化。在微联超级APP实现场景化的同时，智能产品选购的网页也完成了场景化改版，不仅便于用户迅速了解智能产品的组合应用，更可以启发用户设置更有趣和实用的场景。<br>欢迎访问微联专题，了解更多智能产品和场景化选择：<a
				href="http://sale.jd.com/act/uAUwiBra0L7gelF.jsp">http://sale.jd.com/act/uAUwiBra0L7gelF.jsp</a><br>祝您购物愉快！
			<p>
				<a href="" target="_blank"></a>
			</p>
		</div>
	</div>
	<!-- Body End -->

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