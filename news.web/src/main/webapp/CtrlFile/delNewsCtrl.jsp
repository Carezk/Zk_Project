<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻删除控制页面</title>
    
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
  		NewsDaoImpl ndl = new NewsDaoImpl();
  		String newsId = request.getParameter("nid");
  		int nid= Integer.parseInt(newsId);
  		//获取推送新闻的数量
  		int count = ndl.getHot().size();
  		if(count>=4){
  			//删除新闻
	  		int i = ndl.delnews(nid);
	  		//同时删除该新闻下的评论
	  		int j = ddl.deldis(nid);
	  		if(i>0){
	  			out.print("<script type='text/javascript'>alert('删除成功');location='Background.jsp'</script>");
	  		}
  		}else{
  			out.print("<script type='text/javascript'>alert('推送新闻只剩4条了，不能删除');location='Background.jsp'</script>");
  		}
  		
  	%>
  	

  </body>
</html>
