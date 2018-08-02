<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录控制页面</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");             //请求获得输入的用户名
	String password = request.getParameter("password");		//获得输入的密码
	
	UserDaoImpl udl = new UserDaoImpl();
	int num = 0;
	//执行方法返回boolean值为真则表示存在此用户
	boolean reg = udl.YesUser(name, password);
	
	if(reg){
		if("aoteman".equals(name)){
			num = 1;
		}else{
			num = 2;
		}
		//登录成功时保存用户名信息
		session.setAttribute("login", name);
	}
	 if(num == 1){
	 	 //用户为管理员，直接跳转至后台页面，其余返回主页
	 	 response.sendRedirect("../Background.jsp");
	 }else if(num == 2){
		 out.print("<script type='text/javascript'> location='../FrontPage.jsp'</script>");
	 }else{
		 out.print("<script type='text/javascript'>alert('请正确输入用户名和密码！ ');location='../FrontPage.jsp'</script>");
	 }
 %>

</body>
</html>