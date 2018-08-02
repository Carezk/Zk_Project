<%@page import="com.DaoImpl.Service"%>
<%@page import="com.entiy.News"%>
<%@page import="com.entiy.Theme"%>
<%@page import="com.DaoImpl.NewsDaoImpl"%>
<%@page import="com.DaoImpl.ThemeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻中国</title>
<link href="CSS/main.css" rel="stylesheet" type="text/css" />
</head>
<style>
  #li {
	text-overflow: ellipsis; //溢出显示省略号
	overflow: hidden;
	word-break: break-all;
}   
</style>
<body>
     <div id="header">
		<div id="top_login">
			<!-- 插入登录框or欢迎词 -->
			<%@ include file="Include/login.jsp"%>
			<label id="error"> </label> <img src="Images/friend_logo.gif"
				alt="Google" id="friend_logo" />
		</div>
		<div id="nav">
			<div id="logo">
				<a href="FrontPage.jsp"><img src="Images/logo.jpg" alt="新闻中国" /></a>
			</div>
			<div id="a_b01">
				<img src="Images/a_b01.gif" alt="" />
			</div>
		</div>
	</div>
	<%
		//DButil db = new DButil();
		ThemeDaoImpl tdl = new ThemeDaoImpl();
		NewsDaoImpl ndl = new NewsDaoImpl();

		//查询所有主题
		List<Theme> themelist = tdl.getAlltheme();
		request.setAttribute("themelist", themelist);

		//查询国内新闻
		List<News> listcn = ndl.getAnyNews(2);
		request.setAttribute("listcn", listcn);

		//查询国际新闻
		List<News> listinter = ndl.getAnyNews(1);
		request.setAttribute("listinter", listinter);

		//查询娱乐新闻
		List<News> listem = ndl.getAnyNews(24);
		request.setAttribute("listem", listem);

		Service ser = new Service();
		String pn = request.getParameter("page_num");
		String pno = request.getParameter("page_no");
		String tid = request.getParameter("tid");
		request.setAttribute("tid", tid);
		List<News> list = new ArrayList<News>();
		int page_num = 1; //初始页数
		int page_no = 1; //初始页数
		int page_news = 10; //每页显示新闻数
		int countNews; //新闻总数
		int countPage; //总页数
		int fucktid; //定义个变量用来存放转义后的主题id
		if (tid == null) {
			if (pn != null) {
				page_num = Integer.parseInt(pn);
			}
			//得到新闻的总数
			countNews = ndl.countNews();
			list = ser.selectNews(page_num, page_news);
		} else {
			if (pno != null) {
				page_no = Integer.parseInt(pno);
			}
			//当前主题id数据格式转换并存放
			fucktid = Integer.parseInt(tid);
			//得到当前主题id下的新闻数量
			countNews = ndl.countSomeNews(fucktid);
			list = ser.selectNews(page_no, page_news, fucktid);
		}
		//计算页数
		countPage = (countNews % page_news == 0) ? (countNews / page_news)
				: (countNews / page_news + 1);
		//保存各个变量
		request.setAttribute("countPage", countPage);
		request.setAttribute("list", list);
		request.setAttribute("page_num", page_num);
		request.setAttribute("page_no", page_no);
	%>
	<!-- 插入左侧新闻栏 -->
	<%@ include file="Include/leftNews.jsp"%>
	<div class="main">
		<div class="class_type">
			<img src="Images/class_type.gif" alt="新闻中心" />
		</div>
		<div class="content">
			<ul class="class_date">
				<li id='class_month'>
					<!-- 输出所有主题 --> <c:forEach var="themelist"
						items="${requestScope.themelist }" varStatus="themelistStatus">
						<a
							href='FrontPage.jsp?tid=${themelist.id }&page_num=${requestScope.page_num}'><b>${themelist.name }</b></a>
					</c:forEach>
				</li>
			</ul>
			<ul class="classlist">
				<!-- 循环输出新闻内容，并且给a标签附上id值，同表中的新闻和主题id -->
				<c:forEach var="list" items="${requestScope.list }"
					varStatus="listStatus">
					<li><a href='NewsPage.jsp?nid=${list.id }'>${list.title }</a><span>${list.date }</span></li>
					<c:if test="${(listStatus.index+1) % 5 == 0 }">
						<li class='space'></li>
					</c:if>
				</c:forEach>
				<!-- 根据是否存在tid展示不同分页效果 -->
				<p align="right">
					<c:if test="${empty requestScope.tid }">
					当前页数:[${requestScope.page_num }/${requestScope.countPage }]&nbsp; 
					<c:if test="${requestScope.page_num > 1}">
							<a href="FrontPage.jsp?page_num=1">首页</a>
							<a href="FrontPage.jsp?page_num=${requestScope.page_num-1 }">上一页</a>
						</c:if>
						<c:if test="${requestScope.page_num < requestScope.countPage}">
							<a href="FrontPage.jsp?page_num=${requestScope.page_num+1 }">下一页</a>
							<a href="FrontPage.jsp?page_num=${requestScope.countPage }">末页</a>
						</c:if>
					</c:if>
					<c:if test="${not empty requestScope.tid}">
					当前页数:[${requestScope.page_no }/${requestScope.countPage }]&nbsp; 
					<c:if test="${requestScope.page_no > 1}">
							<a href="FrontPage.jsp?tid=${requestScope.tid }&page_no=1">首页</a>
							<a
								href="FrontPage.jsp?tid=${requestScope.tid }&page_no=${requestScope.page_no-1 }">上一页</a>
						</c:if>
						<c:if test="${requestScope.page_no < requestScope.countPage}">
							<a
								href="FrontPage.jsp?tid=${requestScope.tid }&page_no=${requestScope.page_no+1 }">下一页</a>
							<a
								href="FrontPage.jsp?tid=${requestScope.tid }&page_no=${requestScope.countPage }">末页</a>
						</c:if>
					</c:if>
				</p>
			</ul>
		</div>
		<div class="picnews">
			<ul>
				<%
					//随机查询四条推送的新闻
					List<News> list4 = ndl.getHot();
					request.setAttribute("list4", list4);
				%>
				<c:forEach var="list4" items="${requestScope.list4 }">
					<li id="li"><a href='NewsPage.jsp?nid=${list4.id }'> <!-- <marquee onMouseOver=this.stop() onMouseOut=this.start() scrollamount=2 scrolldelay=1 direction=up height=190 id="digest"> -->
							<img src="${list4.photoName }" width="249" alt="" id="hot4" />
					</a> <a href='NewsPage.jsp?nid=${list4.id }'> <b id="digest">${list4.title}</b></a>
						<!-- </marquee> --></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div>
	<!-- 插入页脚 -->
	<jsp:include page="Include/foot.jsp"></jsp:include>
	<%@ include file="Include/toe.jsp"%>

	<%
		request.removeAttribute("themelist");
		request.removeAttribute("fucktid");
		request.removeAttribute("countPage");
		request.removeAttribute("list");
		request.removeAttribute("page_num");
		request.removeAttribute("listcn");
		request.removeAttribute("listinter");
		request.removeAttribute("listem");
		request.removeAttribute("page_no");
		request.removeAttribute("list4");
	%>
</body>
</html>