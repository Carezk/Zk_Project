<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="CtrlFile/rootControl.jsp" %> 
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题查看界面</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
</head>
<%
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	List<Theme> themelist = tdl.getAlltheme();
	request.setAttribute("list", themelist);
%>
<body>
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
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <script language="javascript">
	function clickdel(){
		return confirm("删除请点击确认");
	}
	
</script>
	<ul class="classlist">
	
	<c:forEach var="list" items="${requestScope.list }">
		<li>${list.name } <span> &#160;&#160;&#160;&#160; 
			<a href='ThemeEdit.jsp?tid=${list.id }'>修改</a> &#160;&#160;&#160;&#160;
			<a href='CtrlFile/delThemeCtrl.jsp?tid=${list.id }'>删除</a> &#160;&#160;&#160;&#160;
	 	</li>
	 </c:forEach>
    </ul>
  </div>
</div>
<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<%@ include file="Include/toe.jsp" %>
</body>
<%
	request.removeAttribute("list");
 %>
</html>