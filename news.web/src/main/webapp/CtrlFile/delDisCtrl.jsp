<%@page import="com.DaoImpl.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论删除控制页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%	
		DiscussionDaoImpl ddl = new DiscussionDaoImpl();
		request.setCharacterEncoding("UTF-8");
		String did = request.getParameter("did");
		String nid = request.getParameter("nid");
		out.print(did);
		int disId = Integer.parseInt(did);
		int newsId = Integer.parseInt(nid);
		int i = ddl.delAnyDis(disId);
		response.sendRedirect("../NewsEdit.jsp?nid="+nid);
	 %>
  </body>
</html>
