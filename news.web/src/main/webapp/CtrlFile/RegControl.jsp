<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册控制页面</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");				//输入的用户名
	String password1 = request.getParameter("password1");   //第一次输入的密码
	String password2 = request.getParameter("password2");   //第二次输入的密码
	
	UserDaoImpl udl = new UserDaoImpl();
	//返回一个布尔值，为真则用户已存在
	boolean reg = udl.isUser(name);
	
	if(reg){
		out.print("<script type='text/javascript'>alert('用户已存在');window.history.go(-1)</script>");
	}else if(password1.equals(password2)){
		//如果两次密码输入相同，则添加用户至数据库
		User u = new User();
		u.setName(name);
		u.setPassword(password1);
		int count = udl.addUser(u);
		if(count>0){
			out.print("<script type='text/javascript'>alert('注册成功');location='../FrontPage.jsp'</script>");
		}
	}else{
		 response.sendRedirect("../RegPage.jsp");
		 }
%>
</body>
</html>