<%@page import="com.entiy.Theme"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="CtrlFile/rootControl.jsp" %> 
<%@ page import="com.DaoImpl.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加主题</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	#addhead{background:url(Images/opt_name.gif);width: 335px;height: 28px;}
	#addnews{padding-left:24px;line-height: 28px; font-size: 14px;font-weight: 900;}
	#title{margin-top:30px;margin-bottom:20px}
</style>
</head>
<body>
<%
	String themeId = request.getParameter("tid");
	//初始化主题id和name
	String thisTheme = null;
	int thisId = 0;
	int tid = Integer.parseInt(themeId);
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	List<Theme> themelist = tdl.getAnytheme(tid);
	//从数组得到当前主题的id和name
	for(int i = 0;i<themelist.size();i++){
		thisTheme = themelist.get(i).getName();
		thisId = themelist.get(i).getId();
	}
	request.setAttribute("thisname", thisTheme);
	request.setAttribute("thisid", thisId);
 %>
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><a href="FrontPage.jsp"><img src="Images/logo.jpg" alt="新闻中国" /></a></div>
    <div id="a_b01"><img src="Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员： aoteman  &#160;&#160;&#160;&#160; <a href="CtrlFile/exit.jsp">login out</a></div>
  <div id="channel"> </div>
</div>
<div id="main">
  <div id="opt_list">
    <ul>
      <li><a href="Addnews.jsp">添加新闻</a></li>
      <li><a href="Background.jsp">编辑新闻</a></li>
      <li><a href="search.jsp">查找新闻</a></li>
      <li><a href="AddTheme.jsp">添加主题</a></li>
      <li><a href="themeView.jsp">编辑主题</a></li>
    </ul>
  </div>
  <div id="opt_area">
    <div id="addhead">
			<span id="addnews">修改主题</span>
		</div>
		<div id="addmain">
			<form action="CtrlFile/themeCtrl.jsp?tid=${requestScope.thisid }" method="post" onsubmit="return suck()">
				主题名称    <input type="text" name="theme" value="${requestScope.thisname }" id = "title"/><br />
				<input type="submit" value="提交"/>
				<input type="reset" name="" id="" value="重置" />
			</form>
		</div>
   </div>
</div>

<script type="text/javascript">
var suck = function(){
	var theme = document.getElementById("title").value.trim();
	if(theme == ""){
		alert("请输入主题");
		return false;
	}
}
</script>
<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<!-- 插入页脚趾 -->
<%@ include file="Include/toe.jsp" %>
</body>
<%
	request.removeAttribute("thisname");
	request.removeAttribute("thisid");
 %>
</html>