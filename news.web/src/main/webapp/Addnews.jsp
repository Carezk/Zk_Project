<%@page import="com.entiy.Theme"%>
<%@page import="com.DaoImpl.ThemeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ include file="CtrlFile/rootControl.jsp" %> 
<%@ page import="com.jspsmart.upload.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#addhead {
	background: url(Images/opt_name.gif);
	width: 335px;
	height: 28px;
}

#addnews {
	padding-left: 24px;
	line-height: 28px;
	font-size: 14px;
	font-weight: 900;
}

select, textarea, input {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="header">
		<div id="welcome">欢迎使用新闻管理系统！</div>
		<div id="nav">
			<div id="logo">
				<img src="Images/logo.jpg" alt="新闻中国" />
			</div>
			<div id="a_b01">
				<img src="Images/a_b01.gif" alt="" />
			</div>
		</div>
	</div>
	<div id="admin_bar">
		<div id="status">
			管理员： aoteman &#160;&#160;&#160;&#160; <a href="CtrlFile/exit.jsp">login out</a>
		</div>
		<div id="channel"></div>
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
				<span id="addnews">添加新闻</span>
			</div>
			<div id="addmain">
				<form action="CtrlFile/AddNewsCtrl.jsp" method="post" onSubmit="return fuck()" enctype="multipart/form-data">
					主题 <select name="theme" id="theme">
						<option value="choose">---选择---</option>

						<%
							request.setCharacterEncoding("UTF-8");
							ThemeDaoImpl tdl = new ThemeDaoImpl();
							String theme = request.getParameter("theme");
							List<Theme> themelist = tdl.getAlltheme();
							request.setAttribute("themelist", themelist);
						%>
						<!-- 循环输出主题到下拉菜单 -->
						<c:forEach var="list" items="${requestScope.themelist }">
							<option value="${list.id }">${list.name }</option>
						</c:forEach>
					</select><br /> 
					标题<input type="text" name="title" value="" id="title" /><br />
					作者<input type="text" name="author" id="author" value="" /><br />
					摘要<textarea cols=50 rows=5 name="digest" value="" id="digest" /></textarea><br /> 
					内容<textarea cols=80 rows=15 name="article" value="" id="article" /></textarea><br /> 
					上传图片<input type="file" name="file" id="" value="" /><br /> 
					<input type="submit" value="提交" /> 
					<input type="reset" name="" id="" value="重置" />
				</form>
			</div>
		</div>
	</div>

	<div id="site_link">
		<a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span>
		<a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span>
		<a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span>
		<a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span>
		<a href="#">留言反馈</a>
	</div>
	<%@ include file="Include/toe.jsp" %>
	
	<!-- 验证填写内容JS -->
	<script type="text/javascript">
		var fuck = function() {
			var theme = document.getElementById("theme").value.trim();
			//alert(theme);
			var title = document.getElementById('title').value.trim();
			var author = document.getElementById('author').value.trim();
			var digest = document.getElementById('digest').value.trim();
			var article = document.getElementById('article').value.trim();
			if(theme != "choose"){
				if (title == "" || author == "" || digest == "" || article == "") {
					alert("请补全内容");
					return false;
				}
			}else if(theme == "choose"){
				alert("请选择主题");
				return false;
			}
		}
	</script>
</body>

<%
	request.removeAttribute("themelist");
 %>
</html>
