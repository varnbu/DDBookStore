<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.ddbook.po.Comment"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>商品详细页面</title>
<link rel="stylesheet" href="/DDbook/css/base.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_common.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_header.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_list.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_goods.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/Style/skin.css" type="text/css" />
<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
<script type="text/javascript" src="/DDbook/js/topNav.js"></script>
<script type="text/javascript" src="/DDbook/js/shop_goods.js"></script>
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
							Customer customer = (Customer)session.getAttribute("customer");
																								pageContext.setAttribute("customer", customer);
						%>
						<%
							String str = "";
																													if(customer==null)
																													{str="您好";}
																													else{str = customer.getRealname();}
						%><span><%=str%></span>，欢迎来到<b><a href="index.jsp">叮叮书城</a></b><span
							id="yincang"
							<%String str1 = "";
					if(customer!=null)
					{str1="style='display:none;'";}%>
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
							List<Cart> cartlist = (List<Cart>)session.getAttribute("cartlist");
																												int i = 0;
																												if(cartlist!=null){
																													for(Cart c : cartlist){
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
										<%String str2; if(i!=0){ str2="style='display:none;'"; }else{str2="";}%>
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
			href="">图书分类</a>&nbsp;›&nbsp; <a href="">图书</a>&nbsp;›&nbsp;

		</span>
	</div>
	<div class="clear"></div>
	<!-- 面包屑 End -->

	<!-- Header End -->

	<!-- Goods Body -->
	<div class="shop_goods_bd clear">

		<!-- 商品展示 -->
		<div class="shop_goods_show">
			<div class="shop_goods_show_left">
				<!-- 京东商品展示 -->
				<link rel="stylesheet" href="/DDbook/css/shop_goodPic.css"
					type="text/css" />
				<script type="text/javascript" src="/DDbook/js/shop_goodPic_base.js"></script>
				<script type="text/javascript" src="/DDbook/js/lib.js"></script>
				<script type="text/javascript" src="/DDbook/js/163css.js"></script>
				<div id="preview">
					<div class=jqzoom id="spec-n1" onClick="window.open('/')">
						<IMG height="350" src="${book.img1 }" jqimg="${book.img1 }"
							width="350">
					</div>
					<div id="spec-n5">
						<div class=control id="spec-left">
							<img src="/DDbook/images/left.gif" />
						</div>
						<div id="spec-list">
							<ul class="list-h">
								<li><img src="${book.img1 }"></li>
							</ul>
						</div>
						<div class=control id="spec-right">
							<img src="/DDbook/images/right.gif" />
						</div>

					</div>
				</div>

				<SCRIPT type=text/javascript>
					$(function() {
						$(".jqzoom").jqueryzoom({
							xzoom : 400,
							yzoom : 400,
							offset : 10,
							position : "right",
							preload : 1,
							lens : 1
						});
						$("#spec-list").jdMarquee({
							deriction : "left",
							width : 350,
							height : 56,
							step : 2,
							speed : 4,
							delay : 10,
							control : true,
							_front : "#spec-right",
							_back : "#spec-left"
						});
						$("#spec-list img").bind("mouseover", function() {
							var src = $(this).attr("src");
							$("#spec-n1 img").eq(0).attr({
								src : src.replace("\/n5\/", "\/n1\/"),
								jqimg : src.replace("\/n5\/", "\/n0\/")
							});
							$(this).css({
								"border" : "2px solid #ff6600",
								"padding" : "1px"
							});
						}).bind("mouseout", function() {
							$(this).css({
								"border" : "1px solid #ccc",
								"padding" : "2px"
							});
						});
					})
				</SCRIPT>
				<!-- 京东商品展示 End -->

			</div>
			<form
				action="customer.do?method=addcart&price=${book.currentprice}&bid=${book.bid}"
				method="post">
				<div class="shop_goods_show_right">
					<ul>
						<li><strong style="font-size:14px; font-weight:bold;">${book.bname }</strong>
						</li>
						<li><label>价格：</label> <span id="price"><strong>${book.currentprice}</strong>元</span>
						</li>
						<li><label>运费：</label> <span>卖家承担运费</span></li>
						<li><label>累计售出：</label> <span>${book.sales }件</span></li>
						<li><label>评价：</label> <span>0条评论</span></li>
						<li class="goods_num"><label>购买数量：</label> <span><a
								class="good_num_jian" id="good_num_jian"
								href="javascript:void(0);"></a><input type="text" value="1"
								id="good_nums" name="goodsnumber" class="good_nums" /><a
								href="javascript:void(0);" id="good_num_jia"
								class="good_num_jia"></a>(当前库存${store.storenumber }件)</span></li>
						<li class="goods_num"><label>商品总价：</label> &yen;<span
							id="good_count"> </span></li>
						<li style="padding:20px 0;"><label>&nbsp;</label> <span>
								<input type="submit" value="加入购物车"
								class="goods_sub goods_sub_gou">
						</span> <!-- <a href="customer.do?method=addcart&bid=${book.bid}" >加入购物车</a> -->
						</li>
					</ul>
				</div>
			</form>
		</div>
		<!-- 商品展示 End -->
		<div class="talk">
			<a target="_blank"
				href="http://www.taobao.com/webww/ww.php?ver=3&touid=hnllyr*****fff&siteid=cntaobao&status=1&charset=utf-8">
				<img border="0"
				src="http://amos.alicdn.com/online.aw?v=2&uid=hnllyr*****fff&site=cntaobao&s=1&charset=utf-8"
				alt="点这里给我发消息" />
			</a>
		</div>
		<div class="clear mt15"></div>
		<!-- Goods Left -->
		<div class="shop_bd_list_left clearfix">
			<!-- 左边商品分类 -->
			<div class="shop_bd_list_bk clearfix">
				<div class="title">商品分类</div>
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
		<!-- Goods Left End -->

		<!-- 商品详情 -->
		<script type="text/javascript" src="/DDbook/js/shop_goods_tab.js"></script>
		<div class="shop_goods_bd_xiangqing clearfix">
			<div class="shop_goods_bd_xiangqing_tab">
				<ul>
					<li id="xiangqing_tab_1"
						onmouseover="shop_goods_easytabs('1', '1');"
						onfocus="shop_goods_easytabs('1', '1');" onclick="return false;"><a
						href=""><span>商品详情</span></a></li>
					<li id="xiangqing_tab_2"
						onmouseover="shop_goods_easytabs('1', '2');"
						onfocus="shop_goods_easytabs('1', '2');" onclick="return false;"><a
						href=""><span>商品评论</span></a></li>
					<li id="xiangqing_tab_3"
						onmouseover="shop_goods_easytabs('1', '3');"
						onfocus="shop_goods_easytabs('1', '3');" onclick="return false;"><a
						href=""><span>商品咨询</span></a></li>
				</ul>
			</div>
			<style type="text/css">
.comment_list {
	width: 100%;
	height: auto;
	clear: both;
	margin-bottom: 20px;
	float: left;
	border-bottom: 1px dotted #cccccc;
	padding-bottom: 10px;
}

.comment_list .avatar {
	width: 50px;
	height: auto;
	margin-right: 10px;
	float: left;
}

.comment_list .avatar img {
	width: 50px;
	height: 50px;
	overflow: hidden;
}

.comment_list .avatar span {
	height: 24px;
	line-height: 24px;
	display: inline-block;
}

.comment_list_content {
	width: 700px;
	height: auto;
	float: right;
}

.comment_list_content .comment_list_content_l {
	width: 500px;
	float: left;
}

.comment_list_content_l p.tit {
	width: 100%;
	height: 24px;
	line-height: 24px;
}

.comment_list_content_l p.tit span {
	margin-right: 10px;
}

.comment_list_content_l .star i {
	width: 13px;
	height: 13px;
	display: inline-block;
	background: url(/DDbook/images/star0.jpg);
}

.comment_list_content_l .star i.cur {
	background: url(/DDbook/images/star1.jpg);
}

.comment_list_content_l p.con {
	line-height: 150%;
}

.comment_list_content .comment_list_content_r {
	width: 200px;
	float: right;
	text-align: right;
}

.comment_list_content_r a {
	height: 24px;
	line-height: 24px;
	padding: 0 8px;
	display: inline-block;
	border: 1px solid #dfdfdf;
	border-radius: 3px;
	margin-top: 30px;
	color: #333333;
}

.comment_list_content_r a:hover {
	color: #cc0000;
	text-decoration: none;
}

.comment_list_content_r a i {
	font-style: normal;
	padding: 0 5px;
	color: #cc0000;
	font-weight: bold;
}
</style>
			<div class="shop_goods_bd_xiangqing_content clearfix">
				<div id="xiangqing_content_1" class="xiangqing_contents clearfix">
					<p>商品名：${book.bname }</p>
					<br>
					<p>作者：${book.author }</p>
					<br>
					<p>出版社：${book.publisher }</p>
					<br>
					<p>ISBN:${book.ISBN }</p>
					<br>
					<p></p>
				</div>
				<div id="xiangqing_content_2" class="xiangqing_contents clearfix">

					<!--一条评论 开始-->
					<div class="comment_list">
						<c:choose>
							<c:when test="${empty comment}">

							</c:when>
							<c:otherwise>
								<form action="book.do?method=addcomment&bookid=${book.bid }"
									method="post">
									<input type="hidden" value="${orderid }" name="orderid">
									<label>评分 ：</label> <input type="radio" name="grades" value="1">1:非常不满意
									<input type="radio" name="grades" value="2">2:不满意 <input
										type="radio" name="grades" value="3">3:一般 <input
										type="radio" name="grades" value="4">4:基本满意 <input
										type="radio" name="grades" value="5">5:非常满意 <br>
									<br> <label>评价内容:<br></label><br>
									<textarea name="content" rows="10" cols="90"></textarea>
									<br> <br> <input type="submit" value="评价"> <br>
									<br>
									<hr>
								</form>
							</c:otherwise>
						</c:choose>
						<div class="avatar">
							<span></span>
						</div>
						<c:forEach items="${comm }" var="co">
							<div class="comment_list_content">
								<div class="comment_list_content_l">
									<p class="tit">
										<span class="time">${co.commenttime }</span> <span
											class="star"> <c:forEach var="i" begin="1"
												end="${co.grade }" step="1">
												<i class="cur"></i>
											</c:forEach>
										</span>
									</p>
									<p class="con">${co.content }</p>
								</div>
								<div class="comment_list_content_r"></div>
							</div>
						</c:forEach>
					</div>
					<!--一条评论 结束-->




				</div>

				<div id="xiangqing_content_3" class="xiangqing_contents clearfix">
					<p>商品自诩---3333</p>
				</div>
			</div>
		</div>
		<!-- 商品详情 End -->

	</div>
	<!-- Goods Body End -->

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
	
	<a href="#" id="online-service">在线客服</a>
	<script
		src="https://qiyukf.com/script/89d528c38c25aa65ed3350bfafa5c3ca.js"
		charset="UTF-8" defer async></script>
	<script>
		var prepare = function() {
			// 轻量级CRM基础配置信息, 可选
			ysf.config({
				uid : '${customer.cid}',
				name : '${customer.realname}',
				email : '${customer.email}',
				mobile : '${customer.tel}'
			});

			ysf.product({
				show : 1, // 1为打开， 其他参数为隐藏（包括非零元素）
				title : '${book.bname}',
				desc : '${book.publisher}',
				picture : 'zxm:8080${book.img1}',
				note : '${book.currentprice}',
				url : ''
			});
		}
		var time = 1000; // 接入的延迟时间，可以配置
		setTimeout(function() {
			prepare();
			ysf.open(); // 或location.href = ysf.url();
		}, time);
	</script>


</body>
</html>