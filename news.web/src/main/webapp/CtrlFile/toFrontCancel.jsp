<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'toFrontCancel.jsp' starting page</title>
    
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
    	String newsId = request.getParameter("nid");
    	int nid = Integer.parseInt(newsId);
    	NewsDaoImpl ndl = new NewsDaoImpl();
    	News n = new News();
    	int num = 0;
    	//获取该条新闻对象
    	n = ndl.getOne(nid);
    	//修改toFront属性为0，取消推送
    	n.setToFront("0");
   		num = ndl.toFront(n, nid);
   		if(num>0){
   			out.print("<script type='text/javascript'>alert('取消推送成功');window.history.go(-1)</script>");
   		}
     %>
  </body>
</html>
