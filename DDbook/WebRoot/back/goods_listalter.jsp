<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_listalter.jsp' starting page</title>
    
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
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="/DDbook/images/mail_left_bg.gif">
                    <img src="/DDbook/images/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="/DDbook/images/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="/DDbook/images/content_bg.gif">
                        <tr><td height="31"><div class="title">图书列表</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="/DDbook/images/mail_right_bg.gif"><img src="/DDbook/images/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="/DDbook/images/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                       
                      
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 产品列表开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="manager.do?method=update&bookid=${book1.bid }" method="post">
                                                <table width="100%"  class="cont tr_color">
                                              
                                                    <tr>
                                                    	<td width="100px">图书名称：</td>
                                                        <td>${book1.bname }</td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">图书作者：</td>
                                                        <td>${book1.author }</td> <!--自动添加-->
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">图书价格：</td>
                                                        <td><input type="text" name="currentprice" /></td> 
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">图书分类：</td>
                                                        <td><input type="text" name="category" /></td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">库存数量：</td>
                                                        <td><input type="text" name="store" /></td> <!--自动添加-->
                                                    </tr>
                                                   
                                                    <tr>
                                                    	<td><input type="submit" name="submit" value="提交"  /></td>
                                                        <td><input type="reset" name="reset" value="重置" /></td>
                                                    </tr>
                                                    
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                       
                        <!-- 产品列表结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
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
                <td background="/DDbook/images/buttom_bgs.gif">
                    <img src="/DDbook/images/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="/DDbook/images/mail_right_bg.gif">
                    <img src="/DDbook/images/buttom_right.gif" width="16" height="17" />
                </td>
            </tr>
        </table>
  </body>
</html>
