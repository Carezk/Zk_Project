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
    
    <title>My JSP 'delCtrlForTheme.jsp' starting page</title>
    
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
  		ThemeDaoImpl tdl = new ThemeDaoImpl();
  		NewsDaoImpl ndl = new NewsDaoImpl();
  		String themeId = request.getParameter("tid");
  		int tid = Integer.parseInt(themeId);
  		//根据主题id查询出此id下的新闻条数
		int count = ndl.countSomeNews(tid);
  		//只有当新闻条数等于0时执行删除
  		if(count == 0){
  			int num = tdl.delTheme(tid);
  			if(num>0){
  			out.print("<script type='text/javascript'>alert('删除成功');location='themeView.jsp'</script>");
  			}
  		}
  		if(count>0){
  			out.print("<script type='text/javascript'>alert('该主题下存在新闻，无法删除');location='themeView.jsp'</script>");
  		}
  	%>
  </body>
</html>
