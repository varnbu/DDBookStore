<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Customer customer = (Customer) session.getAttribute("customer");

	if (customer == null) {
		response.sendRedirect("/DDbook/front/login.jsp");
	}
	pageContext.setAttribute("customer", customer);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>购物车页面</title>
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
</head>
<body>
	${msg }
	<!-- Header  -wll-2013/03/24 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<div class="shop_hd_topNav_all_left">
					<p>

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
										<li><a title="已买到的商品" target="_top" href="/DDbook/customer.do?method=getCustomerOrder">已买到的商品</a></li>
										<li><a title="个人主页" target="_top" href="/DDbook/front/member_info.jsp">个人主页</a></li>

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
								placeholder="搜索其实很简单!" value="" /> <input type="submit"
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

			<ul class="shop_hd_menu_nav">
				<li class="link"><a href="/DDbook/index.jsp"><span>首页</span></a></li>
				<li class="link"><a href="/DDbook/front/index1.jsp"><span>金书仓</span></a></li>
				<li class="link"><a href="/DDbook/front/index2.jsp"><span>尾品汇</span></a></li>
				<li class="link"><a href="ranking.jsp"><span>排行榜</span></a></li>
			</ul>
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
		<!-- 在具体实现的时候，根据情况选择其中一种情况 -->
		<!-- 购物车为空 -->
		<c:choose>
			<c:when test="${i==0 }">
				<div class="empty_cart mb10">
					<div class="message">
						<p>
							购物车内暂时没有商品，您可以<a href="index.jsp">去首页</a>挑选喜欢的商品
						</p>
					</div>

				</div>
			</c:when>
		</c:choose>

		<!-- 购物车为空 end-->

		<!-- 购物车有商品 -->
		<div class="shop_gwc_bd_contents clearfix">
			<!-- 购物流程导航 -->
			<div class="shop_gwc_bd_contents_lc clearfix">
				<ul>
					<li class="step_a hover_a">确认购物清单</li>
					<li class="step_b">确认收货人资料及送货方式</li>
					<li class="step_c">购买完成</li>
				</ul>
			</div>
			<!-- 购物流程导航 End -->

			<!-- 购物车列表 -->
			<table>
				<thead>
					<tr>
						<th colspan="2"><span>商品</span></th>
						<th><span>单价(元)</span></th>
						<th><span>数量</span></th>
						<th><span>小计</span></th>
						<th><span>操作</span></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${cartbooklist }" var="book">
						<tr>
							<td class="gwc_list_pic"><a href=""><img
									src="${book.img1 }" /></a></td>
							<td class="gwc_list_title"><a href="">${book.bname }</a></td>
							<td class="gwc_list_danjia"><span>￥<strong
									id="danjia${book.bid }">${book.currentprice }</strong></span></td>
							<td class="gwc_list_shuliang"><span><a
									class="good_num_jian this_good_nums" did="danjia${book.bid }"
									xid="xiaoji${book.bid }" ty="-" valId="${book.bid }"
									href="javascript:void(0);">-</a><input type="text"
									value="${book.number }" id="${book.bid }" class="good_nums" /><a
									href="javascript:void(0);" did="danjia${book.bid }"
									xid="xiaoji${book.bid }" ty="+"
									class="good_num_jia this_good_nums" valId="${book.bid }">+</a></span></td>
							<td class="gwc_list_xiaoji"><span>￥<strong
									id="xiaoji${book.bid }" class="good_xiaojis"
									value="${book.subtotal }">${book.subtotal }</strong></span></td>
							<td class="gwc_list_caozuo"><a href="">收藏</a><a
								href="../customer.do?method=deletebook&cid=${customer.cid }&bid=${book.bid}"
								class="shop_good_delete">删除</a></td>
						</tr>
					</c:forEach>

					<!-- <tr>
						<td class="gwc_list_pic"><a href=""><img src="${book.img1 }" /></a></td>
						<td class="gwc_list_title"><a href="">${book.bname }</a></td>
						<td class="gwc_list_danjia"><span>￥<strong id="danjia${book.bid }">${book.currentprice }</strong></span></td>
						<td class="gwc_list_shuliang"><span><a class="good_num_jian this_good_nums" did="danjia${book.bid }" xid="xiaoji${book.bid }" ty="-" valId="${book.bid }" href="javascript:void(0);">-</a><input type="text" value="1" id="${book.bid }" class="good_nums" /><a href="javascript:void(0);" did="danjia${book.bid }" xid="xiaoji${book.bid }" ty="+" class="good_num_jia this_good_nums" valId="${book.bid }">+</a></span></td>
						<td class="gwc_list_xiaoji"><span>￥<strong id="xiaoji${book.bid }" class="good_xiaojis"></strong></span></td>
						<td class="gwc_list_caozuo"><a href="">收藏</a><a href="javascript:void(0);" class="shop_good_delete">删除</a></td>
					</tr> -->

				</tbody>

				<tfoot>
					<tr>
						<td colspan="6">
							<div class="gwc_foot_zongjia">
								商品总价(不含运费)<span>￥<strong id="good_zongjia">0</strong></span>
							</div>
							<div class="clear"></div>
							<div class="gwc_foot_links">
								<a href="/DDbook/index.jsp" class="go">继续购物</a> <a
									href="../customer.do?method=setaddress" class="op">确认并填写订单</a>

							</div>
						</td>
					</tr>
				</tfoot>
			</table>

			<!-- 购物车列表 End -->
		</div>
		<!-- 购物车有商品 end -->

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
			<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
		</div>
	</div>
	<!-- Footer End -->

</body>
</html>