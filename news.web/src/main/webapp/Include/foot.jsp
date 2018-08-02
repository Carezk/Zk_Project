<%@page import="com.entiy.Url"%>
<%@page import="com.DaoImpl.UrlDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>页脚</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  	UrlDaoImpl udl = new UrlDaoImpl();
  	List<Url> urlList = udl.getAll();
  	request.setAttribute("urlList", urlList);
  %>
  
  <body>
	  <div id="friend">
		  <h1 class="friend_t"> <img src="Images/friend_ico.gif" alt="合作伙伴" /> </h1>
		  <div class="friend_list">
			  	<ul>
			 	<c:forEach var="urlList" items="${requestScope.urlList }" >
				      <li> <a href="${urlList.url}">${urlList.name }</a> </li>
				     </c:forEach>
				      <!-- <li> <a href="http://www.baidu.com">百度</a> </li> -->
			    </ul>
		  </div>
	  </div>
  </body>
</html>
