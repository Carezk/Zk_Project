<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> %>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加主题控制页面</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String themename = request.getParameter("theme");
	int num = 0;
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	//判断reg是否为真，为真则提示重复，为假执行增加
	boolean reg = tdl.themeName(themename);
	if(reg){
		num = 1;
	}else{
		Theme t = new Theme();
		t.setName(themename);
		int count = tdl.addTheme(t);
		if(count>0)
		num = 2;
	}
		
	 if(num == 1){
		 out.print("<script type='text/javascript'>alert('主题已存在');location='../AddTheme.jsp'</script>");
	 }else if(num == 2){
		 out.print("<script type='text/javascript'>alert('添加成功！');location='../themeView.jsp'</script>");
	 }else{
		 out.print("<script type='text/javascript'>alert('添加失败！');location='../AddTheme.jsp'</script>");
	 }

%>	

</body>
</html>