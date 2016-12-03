<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/DDbook/Style/skin.css" />
	<script type="text/javascript" src="/DDbook/js/jquery.js"></script>
	<script type="text/javascript" src="/DDbook/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	function ajaxFileUpload()
	{
	
	$("#loading")
        .ajaxStart(function(){
            $(this).show();
        })//开始上传文件时显示一个图片
        .ajaxComplete(function(){
            $(this).hide();
        });//文件上传完成将图片隐藏起来
        
       $.ajaxFileUpload({
                 url:'/DDbook/FileUpload',             //需要链接到服务器地址
                 secureuri:false,
                 fileElementId:'uploadFileInput',                         //文件选择框的id属性
                 dataType: 'json',                                     //服务器返回的格式，可以是json
                 success: function (data, status)             //相当于java中try语句块的用法
                 {   
                 	alert(data);       //data是从服务器返回来的值   
                     $('#result').html('上传图片成功!请复制图片地址<br/>'+data.src);
                 },
                 error: function (data, status, e)             //相当于java中catch语句块的用法
                 {
                     $('#result').html('上传图片失败');
                 }
               }
             );
    }
	</script>
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
                        <tr><td height="31"><div class="title">添加图书</div></td></tr>
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
                        <!-- 添加产品开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form action="manager.do?method=addbook" method="post" enctype="multipart/form-data">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="15%">图书名称：</td>
                                                        <td width="25%"><input class="text" type="text" name="bname" value="" /></td>
                                                        <td>设置图书名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>图书ISBN：</td>
                                                        <td width="20%"><input class="text" type="text" name="ISBN" value="" /></td>
                                                        <td>设置图书ISBN码</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>产品图片：</td>
                                                        <td width="20%"><input type="file" id="uploadFileInput" size="45" name="img" /></td>
                                                        <div id="result" style="FONT:12px 宋体"></div><br/><img id="loading" src="loading.gif" style="display:none;">
                                                        <td><input type="button" id="buttonUpload" onclick="return ajaxFileUpload();" value="上传图片"></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>库存量：</td>
                                                        <td width="20%"><input class="text" style="width:50px;" type="text" name="store" value="" /></td>
                                                        <td>设置图书的库存量</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>图书价格：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="price" value="" /></td>
                                                        <td>填写图书价格</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>图书作者：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="author" value="" /></td>
                                                        <td>填写图书作者</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>出版社：</td>
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="publisher" value="" /></td>
                                                        <td>填写图书出版社</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>图书分类：</td>
                                                       
                                                        <td width="20%"><input class="text" style="width:100px;" type="text" name="category" value="" /></td>
                                                        
                                                        <td>设置图书分类</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>关键字(Keywords)：</td>
                                                        <td><textarea></textarea></td>
                                                        <td>设置关键字，便于查询</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>描述(Description)：</td>
                                                        <td><textarea></textarea></td>
                                                        <td>图书简短描述</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加产品结束 -->
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
