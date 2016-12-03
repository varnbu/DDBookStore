<%@page import="com.ddbook.po.Cart"%>
<%@page import="com.ddbook.po.Customer"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>叮叮书城-金书仓</title>
<link rel="stylesheet" href="/DDbook/css/base.css" type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_common.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_header.css"
	type="text/css" />
<link rel="stylesheet" href="/DDbook/css/shop_lunbo.css" type="text/css" />
<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
<script type="text/javascript" src="/DDbook/js/topNav.js"></script>
<script type="text/javascript" src="/DDbook/js/focus.js"></script>
<script type="text/javascript" src="/DDbook/js/shop_home_tab.js"></script>
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
								placeholder="搜索其实很简单" value="" /> <input type="submit"
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

			<div class="shop_hd_menu_all_category shop_hd_menu_hover">
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
	<!-- Header End -->


	<!-- Body -wll-2013/03/24 -->
	<div class="shop_bd clearfix">
		<!-- 第一块区域  -->
		<div class="shop_bd_top clearfix">
			<div class="shop_bd_top_left"></div>
			<div class="shop_bd_top_center">
				<!-- 图片切换  begin  -->
				<div class="xifan_sub_box">
					<div id="p-select" class="sub_nav">
						<div class="sub_no" id="xifan_bd1lfsj">
							<ul></ul>
						</div>
					</div>
					<div id="xifan_bd1lfimg">
						<div>
							<dl class=""></dl>
							<dl class="">
								<dt>
									<a href="" title="" target="_blank"><img
										src="/DDbook/images/1.jpg" alt="2011城市主题公园亲子游"></a>
								</dt>
								<dd>
									<h2>
										<a href="" target="_blank">万种童书五折封顶</a>
									</h2>
								</dd>
							</dl>
							<dl class="">
								<dt>
									<a href="" title="" target="_blank"><img
										src="/DDbook/images/2.jpg" alt="潜入城市周边清幽之地"></a>
								</dt>
								<dd>
									<h2>
										<a href="http://www.zztuku.com" target="_blank">向上吧，少年！</a>
									</h2>
								</dd>
							</dl>
							<dl class="">
								<dt>
									<a href="" title="" target="_blank"><img
										src="/DDbook/images/3.jpg" alt=""></a>
								</dt>
								<dd>
									<h2>
										<a href="http://www.zztuku.com" target="_blank">巨人的陨落</a>
									</h2>
								</dd>
							</dl>
							<dl class="">
								<dt>
									<a href="" title="" target="_blank"><img
										src="/DDbook/images/4.jpg" alt="2011西安世园会攻略"></a>
								</dt>
								<dd>
									<h2>
										<a href="http://www.zztuku.com" target="_blank">奔跑吧，同学们！</a>
									</h2>
								</dd>
							</dl>
							<dl class="">
								<dt>
									<a href="" title="" target="_blank"><img
										src="/DDbook/images/5.jpg" alt="班岛"></a>
								</dt>
								<dd>
									<h2>
										<a href="http://www.zztuku.com" target="_blank">夏日的天空，听云讲故事</a>
									</h2>
								</dd>
							</dl>

							<dl class="">
								<dt>
									<a href="http://www.zztuku.com" title="" target="_blank"><img
										src="/DDbook/images/6.jpg" alt="潜入城市周边清幽之地"></a>
								</dt>
								<dd>
									<h2>
										<a href="http://www.zztuku.com" target="_blank">我想要两颗西梅</a>
									</h2>
								</dd>
							</dl>

						</div>
					</div>
				</div>
				<script type="text/javascript">
					movec();
				</script>
				<!-- 图片切换  end -->
				<div class="clear"></div>
				<!--  <div class="shop_bd_top_center_hot"><img src="/DDbook/images/7.jpg" /><img src="/DDbook/images/8.jpg" /><img src="/DDbook/images/9.jpg" /></div>
                </div>-->

				<!-- 右侧 
                <div class="shop_bd_top_right clearfix">
                    <div class="shop_bd_top_right_quickLink">
                        <a href="login.jsp" class="login" title="会员登录"><i></i>会员登录</a>
                        <a href="register.jsp" class= title="免费注册"><i></i>免费注册</a>
                        <a href="index1.jsp" class="join" title="商家开店" ><i></i>商家入驻</a>
                    </div>
                    
                    <div class="shop_bd_top_right-style1 nc-home-news">
                        <ul class="tabs-nav">
                            <li><a href="javascript:void(0);" class="hover">商城广告</a></li>
                            <li><a href="javascript:void(0);">关于我们</a></li>
                        </ul>
                        <div class="clear"></div>
                        <div class="tabs-panel">
                            <ul class="list-style01">
                                <li><a title="如何申请开店" href="article-15.jsp">如何申请开店</a><span>(2016-06-21)</span></li>
                                <li><a title="商城商品推荐" href="article-14.jsp">商城商品推荐</a><span>(2016-06-21)</span></li>
                                <li><a title="如何发货" href="article-13.jsp">如何发货</a><span>(2016-06-21)</span></li>
                                <li><a title="查看售出商品" href="article-12.jsp">查看售出商品</a><span>(2016-06-21)</span></li>
                                <li><a title="如何管理店铺" href="article-11.jsp">如何管理店铺</a><span>(2016-06-21)</span></li>
                                <li><a title="如何申请开店" href="article-15.jsp">如何申请开店</a><span>(2016-06-21)</span></li>
                                <li><a title="商城商品推荐" href="article-14.jsp">商城商品推荐</a><span>(2016-06-21)</span></li>
                                <li><a title="如何发货" href="article-13.jsp">如何发货</a><span>(2016-06-21)</span></li>
                                <li><a title="查看售出商品" href="article-12.jsp">查看售出商品</a><span>(2016-06-21)</span></li>
                                <li><a title="如何管理店铺" href="article-11.jsp">如何管理店铺</a><span>(2016-06-21)</span></li>
                                
                                
                            </ul>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- 右侧 End 	-->
			</div>
			<div class="clear"></div>
			<!-- 第一块区域 End -->

			<!-- 第二块区域 -->
			<div class="shop_bd_2 clearfix">
				<!-- 特别推荐 -->
				<div class="shop_bd_tuijian">
					<ul class="tuijian_tabs">
						<li class="hover" onmouseover="easytabs('1', '1');"
							onfocus="easytabs('1', '1');" onclick="return false;"
							id="tuijian_content_btn_1"><a href="javascript:void(0);">特别推荐</a></li>
						<li onmouseover="easytabs('1', '2');"
							onfocus="easytabs('1', '2');" onclick="return false;"
							id="tuijian_content_btn_2"><a href="javascript:void(0);">热门商品</a></li>
						<li onmouseover="easytabs('1', '3');"
							onfocus="easytabs('1', '3');" onclick="return false;"
							id="tuijian_content_btn_3"><a href="javascript:void(0);">新品上架</a></li>
					</ul>
					<div class="tuijian_content">
						<div id="tuijian_content_1" class="tuijian_shangpin"
							style="display: block;">
							<ul>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/tebie1.jpg" /></a>
										</dt>
										<dd>
											<a href="">余罪：我的刑侦笔记</a>
										</dd>
										<dd style="color:#999">常书欣</dd>
										<dd>
											商城价：<em>25.00</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/tebie2.jpg" /></a>
										</dt>
										<dd>
											<a href="">原来你还在这里</a>
										</dd>

										<dd style="color:#999">辛夷坞</dd>
										<dd>
											商城价：<em>28.00</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/tebie3.jpg" /></a>
										</dt>
										<dd>
											<a href="">世界名人传记（全10本）</a>
										</dd>

										<dd style="color:#999">[日]武鹿悦</dd>
										<dd>
											商城价：<em>80.00</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/tebie4.jpg" /></a>
										</dt>
										<dd>
											<a href="">硅谷钢铁侠</a>
										</dd>

										<dd style="color:#999">（美）阿什利·万</dd>
										<dd>
											商城价：<em>45.90</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/tebie5.jpg" /></a>
										</dt>
										<dd>
											<a href="">幸存者：法医秦明系列第五季</a>
										</dd>

										<dd style="color:#999">秦明</dd>
										<dd>
											商城价：<em>23.30</em>元
										</dd>
									</dl>
								</li>

							</ul>
						</div>

						<div id="tuijian_content_2" class="tuijian_shangpin">
							<ul>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/remen1.jpg" /></a>
										</dt>
										<dd>
											<a href="">查令十字街84号</a>
										</dd>
										<dd style="color:#999">海莲·汉芙</dd>
										<dd>
											商城价：<em>22.50</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/remen2.jpg" /></a>
										</dt>
										<dd>
											<a href="">穿越人海拥抱你</a>
										</dd>
										<dd style="color:#999">苑子文，苑子豪</dd>
										<dd>
											商城价：<em>23.60</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/remen3.jpg" /></a>
										</dt>
										<dd>
											<a href="">我喜欢这个功利的世界</a>
										</dd>
										<dd style="color:#999">咪蒙</dd>
										<dd>
											商城价：<em>22.50</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/remen4.jpg" /></a>
										</dt>
										<dd>
											<a href="">斗罗大陆3</a>
										</dd>
										<dd style="color:#999">唐家三少</dd>
										<dd>
											商城价：<em>19.00</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/remen5.jpg" /></a>
										</dt>
										<dd>
											<a href="">答案之书</a>
										</dd>
										<dd style="color:#999">保罗</dd>
										<dd>
											商城价：<em>22.50</em>元
										</dd>
									</dl>
								</li>
							</ul>
						</div>
						<div id="tuijian_content_3"
							class="tuijian_shangpin tuijian_content">
							<ul>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/xinshu1.jpg" /></a>
										</dt>
										<dd>
											<a href="">只是我们刚巧相爱</a>
										</dd>
										<dd style="color:#999">唐家三少</dd>
										<dd>
											商城价：<em>24.00</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/xinshu2.jpg" /></a>
										</dt>
										<dd>
											<a href="">别生气，我又不是在说你</a>
										</dd>
										<dd style="color:#999">左小祖</dd>
										<dd>
											商城价：<em>29.30</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/xinshu3.jpg" /></a>
										</dt>
										<dd>
											<a href="">爸爸总有好办法</a>
										</dd>
										<dd style="color:#999">（美）斯坦·博恩斯</dd>
										<dd>
											商城价：<em>64.00</em>元
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/xinshu4.jpg" /></a>
										</dt>
										<dd>
											<a href="">你的梦想，自己会来找你</a>
										</dd>
										<dd style="color:#999">一诺,华章</dd>
										<dd>
											商城价：<em>28.70</em>元
										</dd>
									</dl>
								</li>

								<li>
									<dl>
										<dt>
											<a href=""><img src="/DDbook/images/xinshu5.jpg" /></a>
										</dt>
										<dd>
											<a href="">我心温柔，自有力量</a>
										</dd>
										<dd style="color:#999">张德芬</dd>
										<dd>
											商城价：<em>11.00</em>元
										</dd>
									</dl>
								</li>

							</ul>
						</div>

					</div>

				</div>



				<div class="faq">
					<dl>
						<dt>帮助中心</dt>
						<dd>
							<a href=""><span>积分兑换说明</span></a>
						</dd>
						<dd>
							<a href=""><span>积分明细</span></a>
						</dd>
						<dd>
							<a href=""><span>查看已购买商</span></a>
						</dd>
						<dd>
							<a href=""><span>我要买</span></a>
						</dd>
						<dd>
							<a href=""><span>忘记密码</span></a>
						</dd>
					</dl>

					<dl>
						<dt>店主之家</dt>
						<dd>
							<a href="index.jsp"><span>如何申请开店</span></a>
						</dd>
						<dd>
							<a href=""><span>商城商品推荐</span></a>
						</dd>
						<dd>
							<a href=""><span>如何发货</span></a>
						</dd>
						<dd>
							<a href=""><span>查看已售商品</span></a>
						</dd>
						<dd>
							<a href=""><span>如何管理店铺</span></a>
						</dd>
					</dl>

					<dl>
						<dt>支付方式</dt>
						<dd>
							<a href=""><span>公司转账</span></a>
						</dd>
						<dd>
							<a href=""><span>邮局汇款</span></a>
						</dd>
						<dd>
							<a href=""><span>分期付款</span></a>
						</dd>
						<dd>
							<a href=""><span>在线支付</span></a>
						</dd>
						<dd>
							<a href=""><span>如何注册支付</span></a>
						</dd>
					</dl>

					<dl>
						<dt>售后服务</dt>
						<dd>
							<a href=""><span>退款申请</span></a>
						</dd>
						<dd>
							<a href=""><span>返修/退换货</span></a>
						</dd>
						<dd>
							<a href=""><span>退换货流程</span></a>
						</dd>
						<dd>
							<a href=""><span>退换货政策</span></a>
						</dd>
						<dd>
							<a href=""><span>联系卖家</span></a>
						</dd>
					</dl>

					<dl>
						<dt>客服中心</dt>
						<dd>
							<a href=""><span>修改收货地址</span></a>
						</dd>
						<dd>
							<a href=""><span>商品发布</span></a>
						</dd>
						<dd>
							<a href=""><span>会员修改个人</span></a>
						</dd>
						<dd>
							<a href=""><span>会员修改密码</span></a>
						</dd>

					</dl>

					<dl>
						<dt>关于我们</dt>
						<dd>
							<a href=""><span>合作及洽谈</span></a>
						</dd>
						<dd>
							<a href=""><span>招聘英才</span></a>
						</dd>
						<dd>
							<a href=""><span>联系我们</span></a>
						</dd>
						<dd>
							<a href=""><span>关于叮叮</span></a>
						</dd>
					</dl>


				</div>
				<div class="clear"></div>
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
					<p>Copyright 2016-2020 itcast Inc.,All rights reserved.</p>
				</div>
			</div>
			<!-- Footer End -->
</body>
</html>