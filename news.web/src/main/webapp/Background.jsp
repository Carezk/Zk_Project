<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
<title>管理后台</title>
<link href="CSS/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><a href="FrontPage.jsp"><img src="Images/logo.jpg" alt="新闻中国" /></a></div>
    <div id="a_b01"><img src="Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员： zk  &#160;&#160;&#160;&#160; <a href="CtrlFile/exit.jsp">login out</a></div>
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

<%
	Service ser = new Service();
	NewsDaoImpl ndl = new NewsDaoImpl();
	String pn = request.getParameter("page_num");
	List<News> newslist = new ArrayList<News>();
	int page_num = 1;   //当前页数
	int page_news = 10; //每页显示新闻数
	int countNews;      //新闻总数
	int countPage;      //总页数
	countNews = ndl.countNews();
	countPage = (countNews % page_news==0)?(countNews/page_news):(countNews/page_news+1);
	if(pn != null){
		page_num = Integer.parseInt(pn);
	}
	newslist = ser.selectNews(page_num, page_news);
	
	request.setAttribute("countPage", countPage);
	request.setAttribute("newslist", newslist);
	request.setAttribute("page_num", page_num);

%>
    <ul class="classlist">
	    <c:forEach var="newslist" items="${requestScope.newslist }" varStatus="newslistStatus">
	      <li>${newslist.title }
	      	<span>
		                   作者：${newslist.author } &#160;&#160;&#160;&#160; 
	        	<c:if test="${newslist.toFront ne '1' }">
                	<a href="CtrlFile/toFrontCtrl.jsp?nid=${newslist.id }">推送主页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${newslist.toFront eq '1' }">
					<a href="CtrlFile/toFrontCancel.jsp?nid=${newslist.id }">取消推送</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
		        <a href='NewsEdit.jsp?nid=${newslist.id }'>修改</a> &#160;&#160;&#160;&#160; 
		        <a href='CtrlFile/delNewsCtrl.jsp?nid=${newslist.id }' onclick='return clickdel()'>删除</a> 
	        </span> 
	      </li>
	    </c:forEach>
        <p align="right"> 当前页数:[${requestScope.page_num }/${requestScope.countPage }]&nbsp;
        <c:if test="${requestScope.page_num > 1 }">
        <a href="Background.jsp?page_num=1">首页</a>
        <a href="Background.jsp?page_num=${requestScope.page_num-1 }">上一页</a>
        </c:if>
        <c:if test="${requestScope.page_num < requestScope.countPage}">
        <a href="Background.jsp?page_num=${requestScope.page_num+1}">下一页</a> 
        <a href="Background.jsp?page_num=${requestScope.countPage }">末页</a>
        </c:if></p>
    </ul>
  </div>
</div>
<div id="site_link"> <a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span> <a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span> <a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span> <a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span> <a href="#">留言反馈</a> </div>
<!-- 插入页脚趾 -->
<%@ include file="Include/toe.jsp" %>
</body>

<%
	request.removeAttribute("countPage");
	request.removeAttribute("newslist");
	request.removeAttribute("page_num");
 %>
</html>