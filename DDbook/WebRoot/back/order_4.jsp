<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order_4.jsp' starting page</title>
    
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
                        <tr><td height="31"><div class="title">退货单</div></td></tr>
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
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                     
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        	<td></td>
                           
                        </tr>
                        <!-- 产品列表开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                       
                                                        <th>订单编号</th>
                                                        <th>下单时间</th>
                                                        <th>订单金额</th>
                                                        <th>收货人</th>
                                                        <th>收货地址</th>
                                                        <th>收货人手机</th>
                                                     
                                                    </tr>

                                                    <tr align="center" class="d">
                                                       
                                                        <td>1</td>
                                                        <td><input type="date" name="date" /></td>
                                                        <td>149</td>
                                                        <td>张三</td>
                                                        <td>北京市</td>
                                                        <td>18753377131</td>
                                                    
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                   
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <tr><td><br /></td></tr>
                        
                                      <tr>
                                      <td></td>
                                      <td align="right">
                                     		<input type="button" value="宝贝详情" name="list" />
                                     	</td>
                                      </tr>
                                       <tr><td><br /></td></tr>
                                       
                                     <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                       
                                                        <th>图书编号</th>
                                                        <th>图书名称</th>
                                                        <th>图书单价</th>
                                                        <th>购买数量</th>
                                                        <th>总金额</th>
                                                      
                                                    </tr>

                                                    <tr align="center" class="d">
                                                       
                                                        <td>1</td>
                                                        <td>余罪</td>
                                                        <td>149</td>
                                                        <td>张三</td>
                                                        <td>北京市</td>
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
