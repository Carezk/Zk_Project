<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="CtrlFile/rootControl.jsp" %>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻搜索页面</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	#addhead{background:url(Images/opt_name.gif);width: 335px;height: 28px;}
	#addnews{padding-left:24px;line-height: 28px; font-size: 14px;font-weight: 900;}
	#title{margin-top:30px;margin-bottom:20px}
	#lily li{float: left;list-style: none;padding-left: 10px;}
	#suggest{position:absolute;background-color:#FFFFFF;text-align:left;
			border: 1px solid #000000;display:none;width:173px;z-index:999;top:309px}
	#suggest ul{list-style: none;margin:0;padding:0}
	#suggest ul li{line-height:18px;font-size:12px;white-space: nowrap;overflow: hidden;}
	#suggest ul li:hover{background-color:sandybrown}
</style>

<script type="text/javascript">
	//声明xml对象
	var xmlhttp;
	//关键字
	var key;
	var str;
	var searchSuggest = function(){
		//得到输入框中的值
		 key = document.getElementById("title").value;
		 doAjax("servlet/lookfor?key="+key);
	}
	
	function doAjax(url){
  		if (window.XMLHttpRequest) {
  			// code for IE7+, Firefox, Chrome, Opera, Safari  
        	xmlhttp = new XMLHttpRequest();  
    	}else {
	    	// code for IE6, IE5
	        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    	}
	    xmlhttp.onreadystatechange = pr;
		xmlhttp.open("post", url, true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send(null);
	}
	
   	//请求结果处理程序
   	function pr(){
   		var li="";
   		if (xmlhttp.readyState == 4) {
       		if(xmlhttp.status == 200){
       			str = xmlhttp.responseText.split("-",6);
       			if(str.length>0){
       				for(i = 0;i<str.length;i++){
       					li+="<li onmousedown='input(this)'>"+str[i]+"</li>";
       				}
       				ul.innerHTML = li;
       				suggest.style.display="block";
       			}
       		}else{
           		alert("请求处理返回的数据有错误");
	        }
       	}
   	}
   	
   	function input(object) {
		var st = object.innerHTML;
		document.getElementById("title").value = st;
		suggest.style.display="none";
	}
	
	function disA() {
		suggest.style.display="none";
	}
</script>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");
	Service ser = new Service();
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	NewsDaoImpl ndl = new NewsDaoImpl();
	List<News> newslist = new ArrayList<News>();
	//获取本页中输入的搜索内容和以及选择的主题id
	String search = request.getParameter("search");
	String themeId = request.getParameter("tid");
	List<Theme> themelist = tdl.getAlltheme();
	
	if(search != null){
		//没有选择主题时，搜索出关键字的所有新闻
		if(themeId==null || themeId.equals("0")){
			newslist = ndl.getAnyNews(search.trim());
		}else{
		//选择主题，搜索出当前主题下包含关键字的新闻
			int tid = Integer.parseInt(themeId);
			newslist = ndl.getAnyNews(tid, search.trim());
		}
	}else{
		search = "请输入要搜索的内容";
	}
	request.setAttribute("themelist", themelist);
	request.setAttribute("tid", themeId);
	request.setAttribute("search", search);
	request.setAttribute("newslist", newslist);
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
			<span id="addnews">搜索新闻</span>
		</div>
		<div id="lily">
			<ul class="class_date">
				<a href="search.jsp?tid=0&search=${requestScope.search }"><li>全部</li></a>
			<c:forEach var="themelist" items="${requestScope.themelist }">
				<a href="search.jsp?tid=${themelist.id }&search=${requestScope.search }"><li>${themelist.name }</li></a>
			</c:forEach>
			</ul>			
		</div><br>
		<!-- 搜索功能 -->
		<div id="addmain" style="padding-left:0">
			<form action="search.jsp" method="post" >
				<p>输入关键字 </p>
				<input type="text" name="search" placeholder="${requestScope.search }" 
							id = "title" onkeyup="searchSuggest()" autocomplete="off" onblur="disA()" style="margin-top:0"/>
				<input type="submit" value="搜索"/>
			</form>
			<!-- 提示框 -->
			<div id="suggest">
				<ul id="ul">
				</ul>
			</div>
		</div>
  </div>
  
  <div id="opt_area">
		<script language="javascript">
			function clickdel() {
				return confirm("删除请点击确认");
			}
		</script>

		<ul class="classlist">
			<c:forEach var="newslist" items="${requestScope.newslist }">
				<li>${newslist.title }
					<span> 
						作者：${newslist.author }&#160;&#160;&#160;&#160; 
						<c:if test="${newslist.toFront ne '1' }">
                			<a href="CtrlFile/toFrontCtrl.jsp?nid=${newslist.id }">推送主页</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${newslist.toFront eq '1' }">
							<a href="CtrlFile/toFrontCancel.jsp?nid=${newslist.id }">取消推送</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<a href='NewsEdit.jsp?nid=${newslist.id }'>修改</a>&#160;&#160;&#160;&#160; 
						<a href='CtrlFile/delNewsCtrl.jsp?nid=${newslist.id }' onclick='return clickdel()'>删除</a>
					</span>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<%@ include file="Include/toe.jsp" %>
</body>
<%
	request.removeAttribute("themelist");
	request.removeAttribute("tid");
	request.removeAttribute("search");
	request.removeAttribute("newslist");
%>
</html>
