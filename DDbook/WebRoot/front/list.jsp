<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
<%@page import="com.ddbook.po.Book"%>
<%@page import="com.ddbook.util.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>商品列表页</title>
<link rel="stylesheet" href="/DDbook/css/base.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_common.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_header.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_list.css" type="text/css" />
<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
<script type="text/javascript" src="/DDbook/js/topNav.js"></script>
<script type="text/javascript" src="/DDbook/js/shop_list.js"></script>
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
					<form method="post" action="book.do?method=search">
						<div class="search_formstyle">
							<input type="text" class="search_form_text" name="search_content"
								value="" placeholder="搜索其实很简单！" /> <input type="submit"
								class="search_form_sub" name="secrch_submit" value="" title="搜索" />
						</div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="search_tag">
					<a href="">工具书</a> <a href="list.jsp">工具书</a> <a href="list.jsp">摄影</a>
					<a href="list.jsp">养生</a> <a href="list.jsp">育儿</a> <a
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

								<a href="/DDbook/book.do?method=booklist&category=教育" title="教育">教育</a>


							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=教育">教育</a>
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
								<a href="/DDbook/book.do?method=booklist&category=文艺" title="文艺">文艺</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=文艺">文艺</a>
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
								<a href="/DDbook/book.do?method=booklist&category=社会科学"
									title="社科">社科</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=社火科学">社会科学</a>
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
								<a href="/DDbook/book.do?method=booklist&category=生活" title="生活">生活</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=生活">生活</a>
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
								<a href="/DDbook/book.do?method=booklist&category=儿童读物"
									title="童书">童书</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=儿童读物">儿童读物</a>
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
								<a href="/DDbook/book.do?method=booklist&category=经济管理"
									title="经管">经管</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=经济管理">经济管理</a>
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
								<a href="/DDbook/book.do?method=booklist&category=科技" title="科技">科技</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=科技">科技</a>
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
								<a href="/DDbook/book.do?method=booklist&category=期刊杂志"
									title="期刊杂志">期刊杂志</a>
							</h3>
							<div id="cat_1_menu" class="cat_menu clearfix" style="">
								<dl class="clearfix">
									<dt>
										<a href="/DDbook/book.do?method=booklist&category=期刊杂志">期刊杂志</a>
									</dt>
									<dd>
										<a href="">期刊/杂志</a>
									</dd>
								</dl>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<!-- 所有商品菜单 END -->

			<!-- 普通导航菜单 -->
			<ul class="shop_hd_menu_nav">
				<li class="link"><a href="/DDbook/index.jsp"><span>首页</span></a></li>
				<li class="link"><a href="/DDbook/front/index1.jsp"><span>金书仓</span></a></li>
				<li class="link"><a href="/DDbook/front/index2.jsp"><span>尾品汇</span></a></li>
				<li class="link"><a href=""><span>排行榜</span></a></li>
			</ul>
			<!-- 普通导航菜单 End -->
		</div>
		<!-- Header Menu End -->

	</div>
	<div class="clear"></div>
	<!-- 面包屑 注意首页没有 -->
	<div class="shop_hd_breadcrumb">
		<strong>当前位置：</strong> <span> <a href="">首页</a>&nbsp;›&nbsp; <a
			href="">图书分类</a>&nbsp;›&nbsp;

		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->


	<!-- List Body 2013/03/27 -->
	<div class="shop_bd clearfix">
		<div class="shop_bd_list_left clearfix">
			<!-- 左边商品分类 -->
			<div class="shop_bd_list_bk clearfix">
				<div class="title">图书分类</div>
				<div class="contents clearfix">
					<dl class="shop_bd_list_type_links clearfix">
						<dt>
							<strong>教育</strong>
						</dt>
						<dd>
							<span><a href="">中小学教辅</a></span> <span><a href="">考试</a></span>
							<span><a href="">外语</a></span> <span><a href="">教材</a></span> <span><a
								href="">工具书</a></span>

						</dd>
					</dl>
				</div>
			</div>
			<!-- 左边商品分类 End -->

			<!-- 热卖推荐商品 -->
			<div class="shop_bd_list_bk clearfix">
				<div class="title">热卖推荐商品</div>
				<div class="contents clearfix">
					<ul class="clearfix">

						<li class="clearfix">
							<div class="goods_name">
								<a href="">余罪</a>
							</div>
							<div class="goods_pic">
								<span class="goods_price">¥ 25.00 </span><a href=""><img
									src="/DDbook/images/tebie1.jpg" /></a>
							</div>
							<div class="goods_xiaoliang">
								<span class="goods_xiaoliang_link"><a href="goods.jsp">去看看</a></span>
								<span class="goods_xiaoliang_nums">已销售<strong>99</strong>笔
								</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- 热卖推荐商品 -->
			<div class="clear"></div>

			<!-- 浏览过的商品 -->
			<div class="shop_bd_list_bk clearfix">
				<div class="title">浏览过的商品</div>
				<div class="contents clearfix">
					<ul class="clearfix">

						<li class="clearfix">
							<div class="goods_name">
								<a href="">余罪</a>
							</div>
							<div class="goods_pic">
								<span class="goods_price">¥ 25.00 </span><a href=""><img
									src="/DDbook/images/tebie1.jpg" /></a>
							</div>
							<div class="goods_xiaoliang">
								<span class="goods_xiaoliang_link"><a href="goods.jsp">去看看</a></span>
								<span class="goods_xiaoliang_nums">已销售<strong>99</strong>笔
								</span>
							</div>
						</li>

					</ul>
				</div>
			</div>
			<!-- 浏览过的商品 -->

		</div>

		<div class="shop_bd_list_right clearfix">
			<!-- 条件筛选框 -->
			<div class="module_filter">
				<div class="module_filter_line">



					<dl>
						<dt>客户评分：</dt>
						<dd>
							<span><a href="">五星</a></span> <span><a href="">四星以上</a></span> <span><a
								href="">三星以上</a></span> <span><a href="">两星以上</a></span> <span><a
								href="">一星以上</a></span>

						</dd>
					</dl>
					<dl>
						<dt>作者地区：</dt>
						<dd>
							<span><a href="">中国</a></span> <span><a href="">美国</a></span> <span><a
								href="">日本</a></span> <span><a href="">德国</a></span> <span><a
								href="">法国</a></span> <span><a href="">韩国</a></span> <span><a
								href="">俄罗斯</a></span>

						</dd>
					</dl>

					<dl>
						<dt>出版社名称：</dt>
						<dd>
							<span><a href="">人民文学出版社</a></span> <span><a href="">人民教育出版社</a></span>
							<span><a href="">清华大学出版社</a></span> <span><a href="">海南出版社</a></span>

						</dd>
					</dl>



				</div>
				<div class="bottom"></div>
			</div>
			<!-- 条件筛选框 -->

			<!-- 显示菜单 -->
			<div class="sort-bar">
				<div class="bar-l">
					<!-- 查看方式S -->
					<div class="switch">
						<span class="selected"><a title="以方格显示" ecvalue="squares"
							nc_type="display_mode" class="pm" href="javascript:void(0)">大图</a></span><span
							style="border-left:none;"><a title="以列表显示" ecvalue="list"
							nc_type="display_mode" class="lm" href="javascript:void(0)">列表</a></span>
					</div>
					<!-- 查看方式E -->
					<!-- 排序方式S -->
					<ul class="array">
						<li class="selected"><a title="默认排序"
							onclick="javascript:dropParam(['key','order'],'','array');"
							class="nobg" href="javascript:void(0)">默认</a></li>
						<li><a title="点击按销量从高到低排序"
							onclick="javascript:replaceParam(['key','order'],['sales','desc'],'array');"
							href="javascript:void(0)">销量</a></li>
						<li><a title="点击按人气从高到低排序"
							onclick="javascript:replaceParam(['key','order'],['click','desc'],'array');"
							href="javascript:void(0)">人气</a></li>
						<li><a title="点击按信用从高到低排序"
							onclick="javascript:replaceParam(['key','order'],['credit','desc'],'array');"
							href="javascript:void(0)">信用</a></li>
						<li><a title="点击按价格从高到低排序"
							onclick="javascript:replaceParam(['key','order'],['price','desc'],'array');"
							href="javascript:void(0)">价格</a></li>
					</ul>
					<!-- 排序方式E -->
					<!-- 价格段S -->
					<div class="prices">
						<em>¥</em> <input type="text" value="" class="w30"> <em>-</em>
						<input type="text" value="" class="w30"> <input
							type="submit" value="确认" id="search_by_price">
					</div>
					<!-- 价格段E -->
				</div>
			</div>
			<div class="clear"></div>
			<!-- 显示菜单 End -->

			<!-- 商品列表 -->
			<div class="shop_bd_list_content clearfix">
				<ul>
					<c:forEach items="${blist }" var="book">
						<li>
							<dl>
								<dt>
									<a href="book.do?method=bookinfo&bookid=${book.bid}"><img
										src="${book.img1 }" /></a>
								</dt>
								<dd class="title">
									<a href="">${book.bname }</a>
								</dd>
								<dd class="content">
									<span class="goods_jiage">￥<strong>${book.currentprice }</strong></span>
									<span class="goods_chengjiao">最近成交${book.sales }笔</span>
								</dd>
							</dl>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="pagination">
				<ul>
					<c:choose>

						<c:when test="${page.hasPrePage}">
							<li><span><a
									href="book.do?method=booklist&currentPage=1&category=${category}">首页</a></span></li>
							<li><span><a
									href="book.do?method=booklist&currentPage=${page.currentPage-1}&category=${category}">上一页</a></span></li>
						</c:when>
						<c:otherwise>
							<li><span><a>首页 </a> </span></li>
							<li><span><a> 上一页</a> </span></li>
						</c:otherwise>
					</c:choose>
					<li><span class="currentpage">当前第${page.currentPage }页</span></li>
					<c:choose>
						<c:when test="${page.hasNextPage }">
							<li><span><a
									href="book.do?method=booklist&currentPage=${page.currentPage+1}&category=${category}">下一页</a></span></li>
							<li><span><a
									href="book.do?method=booklist&currentPage=${page.totalPage}&category=${category}">末页</a></span></li>
						</c:when>
						<c:otherwise>
							<li><span><a>下一页 </a> </span></li>
							<li><span><a> 尾页</a> </span></li>
						</c:otherwise>
					</c:choose>
				</ul>

			</div>
			<!-- 商品列表 End -->


		</div>
	</div>
	<!-- List Body End -->

	<!-- Footer - wll - 2013/3/24 -->
	<div class="clear"></div>
	<div class="shop_footer">
		<div class="shop_footer_link">
			<p>
				<a href="">首页</a>| <a href="">招聘英才</a>| <a href="">广告合作</a>| <a
					href="">关于ShopCZ</a>| <a href="">关于我们</a>
			</p>
		</div>
		<div class="shop_footer_copy">
			<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
		</div>
	</div>
	<!-- Footer End -->

</body>
</html>