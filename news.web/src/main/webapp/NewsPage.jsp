<%@page import="com.entiy.Discussion"%>
<%@page import="com.DaoImpl.Service"%>
<%@page import="com.entiy.News"%>
<%@page import="com.entiy.Theme"%>
<%@page import="com.DaoImpl.DiscussionDaoImpl"%>
<%@page import="com.DaoImpl.NewsDaoImpl"%>
<%@page import="com.DaoImpl.ThemeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻中国</title>
<link href="CSS/read.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//为空验证
	function checkDis(){
		var cauthor = document.getElementById("cauthor");
		var content = document.getElementById("ccontent");
		if(cauthor.value == ""){
			alert("用户名不能为空！！");
			return false;
		}else if(content.value == ""){
			alert("评论内容不能为空！！");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
	/* p{text-indent:2em;} */
	#img{max-width:400px}
</style>
</head>
<body>
<%
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	NewsDaoImpl ndl = new NewsDaoImpl();
	DiscussionDaoImpl ddl = new DiscussionDaoImpl();
	
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
	int newsId = Integer.parseInt(request.getParameter("nid"));
	String photoName = null;	//获取文件路径
	//获得并存储当前新闻对象
	News news = ndl.getOne(newsId);
	Service ser = new Service();
	String pn = request.getParameter("page_num");
	int page_num = 1; 			//当前页数
	int page_dis = 5; 			//每页显示评论数
	int countDis; 				//评论总数
	int countPage; 				//总页数
	//计算得出总评论数
	countDis = ddl.countSomeDis(newsId);
	//计算出总页数并存放
	countPage = (countDis % page_dis==0)?(countDis/page_dis):(countDis/page_dis+1);
	if(pn != null){
		page_num = Integer.parseInt(pn);
	}else{
		pn = "1";
	}
	//执行评论分页方法
	List<Discussion> dislist = ser.selectDis(page_num, page_dis, newsId);
	request.setAttribute("news", news);
	request.setAttribute("page_num", page_num);
	request.setAttribute("dislist", dislist);
	request.setAttribute("countPage", countPage);

%>
<div id="header">
  <div id="top_login">
    <!-- 插入登录框or欢迎词 -->
	<%@ include file="Include/login.jsp" %>    

    <label id="error"> </label>
    <img src="Images/friend_logo.gif" alt="Google" id="friend_logo" /> </div>
  <div id="nav">
    <div id="logo"><a href="FrontPage.jsp"><img src="Images/logo.jpg" alt="新闻中国" /></a></div>
    <div id="a_b01"> <img src="Images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>

<!-- 插入左侧新闻栏 -->
<%@ include file="Include/leftNews.jsp" %>

  <div class="main">
    <div class="class_type"> <img src="Images/class_type.gif" alt="新闻中心" /> </div>
    <div class="content">
      <ul class="classlist">
        <table width="80%" align="center" >
          <tr width="100%">
          <!-- 标题 -->
            <td colspan="2" align="center"><h2>${requestScope.news.title}</h2></td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
          <tr>
          <!-- 时间和主题 -->
            <td align="center"><b>${requestScope.news.date}</b></td>
            <td align="left"><b>${requestScope.news.theme}</b></td>
          </tr>
          <tr>
            <td colspan="2" align="center">文/${requestScope.news.author}</td>
          </tr>
          <!-- 图片 -->
          <c:if test="${not empty requestScope.news.photoName }">
          <tr>
          	<td colspan="2" align="center"><div id="imgtr"><img alt="" src="${requestScope.news.photoName}" id="img" ></div></td>
          </tr>
          </c:if>
          <!-- 文章内容 -->
          <tr>
          	<td colspan="2"><p>${requestScope.news.article}</p> </td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
        </table>
      </ul>
      <!-- 评论区 -->
      <ul class="classlist">
      <!-- 判断是否有评论 -->
        <table width="80%" align="center">
        <c:if test="${empty requestScope.dislist}">
			<td colspan="6" id = "dis"> 暂无评论！</td>
		</c:if>
		<c:if test="${not empty requestScope.dislist}">
			<td colspan="6" id = "dis"> 网友评论 </td>
		</c:if>
		
        <tr><td colspan="6"><hr></td></tr>
		<c:forEach var="dislist" items="${requestScope.dislist }">
			<tr>
	          <td colspan="2">网友 <b style="color:brown">${dislist.name }</b> 说： </td>
	          <td colspan="2"> ${dislist.ip } </td>
	          <td colspan="2"> ${dislist.time }</td>
	        </tr>
	          <!--显示留言内容-->
	        <tr>
	          <td colspan="6">${dislist.content }</td>
	        </tr>
	        <tr>
				<td colspan="6"><hr></td>
			</tr>
		</c:forEach>
		</table>
      </ul>
      <ul class="classlist">
          <form action="CtrlFile/DiscusCtrl.jsp?nid=${requestScope.news.id }" method="post" onsubmit="return checkDis()">
          <table width="80%" align="center">
	         <tr>
          	  <p align="right"> 当前页数:[${requestScope.page_num }/${requestScope.countPage }]&nbsp;
	          	  <c:if test="${requestScope.page_num > 1}">
				      <a href="NewsPage.jsp?nid=${requestScope.news.id }&page_num=1">首页</a>
				      <a href="NewsPage.jsp?nid=${requestScope.news.id }&page_num=${requestScope.page_num-1 }">上一页</a>
			      </c:if> 
			      <c:if test="${requestScope.page_num < requestScope.countPage}">
				      <a href="NewsPage.jsp?nid=${requestScope.news.id }&page_num=${requestScope.page_num+1 }">下一页</a> 
				      <a href="NewsPage.jsp?nid=${requestScope.news.id }&page_num=${requestScope.countPage }">末页</a>
				  </c:if>
			  </p>
	      	</tr>
            <tr>
              <td> 发表评论 </td>
            </tr>
            <tr>
              <td> 用户名： </td>
              <td><input id="cauthor" name="cauthor" value="火星网友"/>
                  IP：
                  <input name="cip" value="<%= request.getRemoteAddr() %>" readonly="readonly"/>
              </td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="ccontent" cols="70" rows="10">这家伙很懒什么也没留下</textarea>
              </td>
            </tr>
            <td><input name="submit" value="发  表" type="submit"/>
              </td>
          </table>
        </form>
      </ul>
    </div>
  </div>
</div>
<!-- 插入页脚 -->
<jsp:include page="Include/foot.jsp"></jsp:include>
</body>
<%
	request.removeAttribute("themelist");
	request.removeAttribute("listcn");
	request.removeAttribute("listinter");
	request.removeAttribute("listem");
	request.removeAttribute("page_num");
	request.removeAttribute("dislist");
	request.removeAttribute("countPage");
	request.removeAttribute("news");
 %>
</html>