<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<script src="/DDbook/js/prototype.lite.js" type="text/javascript"></script>
    <script src="/DDbook/js/moo.fx.js" type="text/javascript"></script>
    <script src="/DDbook/js/moo.fx.pack.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="/DDbook/Style/skin.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
        window.onload = function () {
            var contents = document.getElementsByClassName('content');
            var toggles = document.getElementsByClassName('type');

            var myAccordion = new fx.Accordion(
            toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                    dl_a.onfocus=function(){
                        this.blur();
                    }
            }
        }
    </script>
  </head>
  
  <body>
      <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
        <tr>
            <td width="182" valign="top">
                <div id="container">
                    <h1 class="type"><a href="javascript:void(0)">图书管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="/DDbook/images/menu_top_line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="/DDbook/back/goods_sort.jsp" target="main">图书分类</a></li>
                            <li><a href="/DDbook/back/goods_add.jsp" target="main">添加图书</a></li>
                            <li><a href="/DDbook/manager.do?method=getall" target="main">图书列表</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">订单管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="/DDbook/images/menu_top_line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="manager.do?method=showorder1" target="main">未付款订单</a></li>
                            <li><a href="manager.do?method=showorder2" target="main">未发货订单</a></li>
                            <li><a href="manager.do?method=showorder3" target="main">已发货订单</a></li>
                            <li><a href="/DDbook/back/order_4.jsp" target="main">退货订单</a></li>
                        </ul>
                    </div>
                    <!-- *********** -->
                    <h1 class="type"><a href="javascript:void(0)">统计管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="/DDbook/images/menu_top_line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="/DDbook/back/chart.jsp" target="main">图表分析</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">系统设置</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="/DDbook/images/menu_top_line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="/DDbook/back/mail.jsp" target="main">站内信</a></li>
                            <li><a href="#" target="main">管理员设置</a></li>
                        </ul>
                    </div>
                    <!-- *********** -->
                    <h1 class="type"><a href="javascript:void(0)">其它设置</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="/DDbook/images/menu_top_line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="javascript:void(0)" target="main">友情连接</a></li>
                            <li><a href="javascript:void(0)" target="main">在线留言</a></li>
                            <li><a href="javascript:void(0)" target="main">图片上传</a></li>
                        </ul>
                    </div>
                </div>
            </td>
        </tr>
    </table>
  </body>
</html>
