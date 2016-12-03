<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/DDbook/Style/skin.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		
		//点击"全选/全不选"复选框，如果选中，则选中全部复选框，否则取消选中全部复选框
function checkboxall( Allname,name) {
	var ischecked = document.getElementById(Allname).checked;
	if(ischecked) {
		checkallbox(name);
	}else {
		discheckallbox(name);
	}
}
//选中全部复选框
function checkallbox(name) {
	var boxarray = document.getElementsByName(name);
	for(var i = 0; i < boxarray.length; i++) {
		boxarray[i].checked = true;
	}
}
//取消选中全部复选框
function discheckallbox(name) {
	var boxarray = document.getElementsByName(name);
	for(var i = 0; i < boxarray.length; i++) {
		boxarray[i].checked = false;
	}
}

//点击某个复选框，如果所有复选框都选中，“全选/全不选”复选框也选中
//否则如果所有复选框都取消选中，“全选/全不选”复选框也取消选中
function checkonebox(Allname,name) {
	if(isallchecked(name)) {
		document.getElementById(Allname).checked = true;
	}
	if(isalldischecked(name)) {
		document.getElementById(Allname).checked = false;
	}
}

//是否全部选中
function isallchecked(name) {
	var boxarray = document.getElementsByName(name);
	for(var i = 0; i < boxarray.length; i++) {
		if(!boxarray[i].checked) {
			return false;
		}
	}
	return true;
}
//是否全部没有选中
function isalldischecked(name) {
	var boxarray = document.getElementsByName(name);
	for(var i = 0; i < boxarray.length; i++) {
		if(boxarray[i].checked) {
			return false;
		}
	}
	return true;
}

//得到选中项的值的集合
function getallcheckedvalue(name) {
	var boxvalues = "";
	var boxarray = document.getElementsByName(name);
	for(var i = 0; i < boxarray.length; i++) {
		if(boxarray[i].checked) {
			var boxvalue = boxarray[i].value;
			if(boxvalues == "") {
				boxvalues = boxvalue;
			}else {
				boxvalues = boxvalues + "," + boxvalue;
			}
		}
	}
	return boxvalues;
}
//如果只需要得到其中选中项的id值的集合，方法如下，得到的值为（1,2,3,…）
function getIds() {
		var boxvalues = getallcheckedvalue();
		var boxvaluesArray = boxvalues.split(",");
		var ids = "";
		for(var i = 0; i < boxvaluesArray.length; i++) {
			var boxvalue = boxvaluesArray[i];
			var boxvalueArray = boxvalue.split("|");
			var id = boxvalueArray[0];
			var username = boxvalueArray[1];
			if(ids == "") {
				ids = id;
			}else {
				ids = ids + "," + id;
			}
		}
		return ids;
}

		
		</script>
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
                                            <form action="manager.do?method=delete" method="post">
                                                <table width="100%"  class="cont tr_color">
                                                    <tr>
                                                        <th>选中</th>
                                                     
                                                        <th>图书名称</th>
                                                        <th>图书作者</th>
                                                        <th>图书价格</th>
                                                        <th>图书分类</th>
                                                        <th>销售数量</th>
                                                        <th>库存数量</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    <c:forEach items="${list }"  var="book">
                                                    <tr align="center">
                                                    	
                                                    	<td><input id="box" type="checkbox" name="box" value="${book.bid }" onclick="checkonebox('checkall','box')"/></td>
                                                        <td>${book.bname }</td>
                                                         <td>${book.author }</td>
                                                        <td>${book.currentprice }</td>
                                                        <td>${book.category }</td>
                                                        <td>${book.sales }</td>
                                                        <td>${book.store }</td>
                                                        <td>
                                                        	<a href="manager.do?method=show&bookid=${book.bid }">编辑</a>
                                                            &nbsp;&nbsp;<a href="manager.do?method=deleteone&bookid=${book.bid}">删除</a>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </table>
                                  
                                                 <tr><td></td><td><input type="submit" value="批量删除"  name="button" /></td></tr>
                                                 
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <tr><td><br /></td></tr>
   <table width="461" height="24" border="1" cellpadding="0" cellspacing="0">                        
      <tr>         
    <td  >当前为第${page.currentPage}页,共${page.totalPage}页</td>
   <td >

    <c:choose>
		<c:when test="${page.hasPrePage}">
			<a href="<%=path %>/mamager.do?method=getall&currentPage=1">首页</a> | 
	<a href="<%=path %>/manager.do?method=getall&currentPage=${page.currentPage -1 }">上一页</a>
		</c:when>
		<c:otherwise>
			首页 | 上一页
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${page.hasNextPage}">
			<a href="<%=path %>/manager.do?method=getall&currentPage=${page.currentPage + 1 }">下一页</a> | 
	<a href="<%=path %>/manager.do?method=getall&currentPage=${page.totalPage }">尾页</a>
		</c:when>
		<c:otherwise>
			下一页 | 尾页
		</c:otherwise>
	</c:choose>
	
</td>
  </tr>
  </table><br/>
                       
                       
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
