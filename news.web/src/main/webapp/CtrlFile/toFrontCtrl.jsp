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
    
    <title>My JSP 'toFrontCtrl.jsp' starting page</title>
    
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
    	//判断是否存在图片，不存在则提示添加
    	if(n.getPhotoName() == null){
    		out.print("<script type='text/javascript'>alert('缺少图片，无法推送，请添加图片后再试');window.history.go(-1)</script>");
    	}else {
    		//修改toFront属性完成推送
    		n.setToFront("1");
   			num = ndl.toFront(n,nid);
   			if(num>0){
   				out.print("<script type='text/javascript'>alert('推送成功');window.history.go(-1)</script>");
   			}else{
   				out.print("<script type='text/javascript'>alert('推送失败');window.history.go(-1)</script>");
   			}
    	}
     %>
  </body>
</html>
