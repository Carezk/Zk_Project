<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
    
    <title>My JSP 'DiscusCtril.jsp' starting page</title>
    
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
    	request.setCharacterEncoding("UTF-8");
    	String newsId = request.getParameter("nid");
    	int nid = Integer.parseInt(newsId);
    	String name = request.getParameter("cauthor");
    	String ip = request.getParameter("cip");
    	String content = request.getParameter("ccontent");
    	
    	DiscussionDaoImpl ddl = new DiscussionDaoImpl();
    	Discussion d = new Discussion();
    	d.setNewsId(nid);               //为新闻id赋值
    	d.setName(name);				//为评论者姓名赋值
    	d.setIp(ip);					//为评论者ip赋值
    	d.setContent(content);			//为评论内容赋值
    	//执行添加评论方法
    	int count = ddl.addDis(d);
    	if(count > 0){
    		out.print("<script type='text/javascript'>alert('评论成功');location='NewsPage.jsp?nid=" + nid + "'</script>");
    	}
    %>
  </body>
</html>
