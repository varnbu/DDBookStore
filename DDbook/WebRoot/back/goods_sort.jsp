<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_sort.jsp' starting page</title>
    
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
                        <tr><td height="31"><div class="title">图书分类</div></td></tr>
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
                        <tr>
                            <td colspan="4">
                                <table>
                                   
                                </table>
                            </td>
                        </tr>
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                       <!--现有列表-->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
   <tr>
   		<tr><h2>现有分类列表</h2></tr>
   </tr>
                                                    <tr>
                                                       
                                                        <th>分类名称</th>
                                                        <th>显示/隐藏</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                      
                                                        <td>教育</td>
                                                        <td>显示</td>
                                                        <td><a href="goods_sortalter.html">编辑</a> 删除</td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td>文艺</td>
                                                        <td>显示</td>
                                                        <td><a href="goods_sortalter.html">编辑</a> 删除</td>
                                                    </tr>
                                                    <tr align="center" class="d">
                                                        <td>生活</td>
                                                        <td>显示</td>
                                                        <td><a href="goods_sortalter.html">编辑</a>删除</td>
                                                    </tr>
                                                    
                                                 
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        
                   
                        
                         <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                                <table width="100%"  class="cont tr_color">
                                                <tr><br /></tr>
                                                <tr><br /></tr>
                                                <tr><br /></tr>
   <tr>
   		<tr><h2>添加分类</h2></tr>
   </tr>
                                                    <tr>
                                                    	<td width="100px">分类名称:</td>
                                                        <td><input  type="text" name="name"/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">父分类：</td>
                                                        <td>
                                                        	<select name="dad" style="width:100px">
                                                            	<option>教育</option>
                                                                <option>文艺</option>
                                                                <option>生活</option>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    	<td width="100px">状态：</td>
                                                    	<td>
                                                        	<select name="type" style="width:100px">
                                                            	<option>显示</option>
                                                                <option>隐藏</option>
                                                        </td>    
                                                    </tr>
                                                  <tr>
                                                  	<td></td>
                                                    <td>
                                                    	<input type="submit" name="submit"  value="添加"/>
                                                        <input type="reset" name="reset" value="重置" />
                                                    </td>
                                                  </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 商品分类结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="51%" class="left_txt">&nbsp;</td>
                            <td>&nbsp;</td><td>&nbsp;</td>
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
