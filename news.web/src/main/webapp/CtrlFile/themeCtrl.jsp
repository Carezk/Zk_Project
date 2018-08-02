<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	ThemeDaoImpl tdl = new ThemeDaoImpl();
	request.setCharacterEncoding("UTF-8");
	String themename = request.getParameter("theme");    //获得主题
	String themeId = request.getParameter("tid");		 //获得主题id
	int tid = Integer.parseInt(themeId);
	int num = 0;
	//查询是否存在此主题,为真则存在
	boolean reg = tdl.themeName(themename);
	if(reg){
		num = 1;
	}else{
		Theme t = new Theme();
		t.setId(tid);
		t.setName(themename);
		//当主题不存在时，执行修改方法
		int count = tdl.updateTheme(t);
		if(count>0)
		num = 2;
	}
		
	 if(num == 1){
		 out.print("<script type='text/javascript'>alert('主题已存在');window.history.go(-1)</script>");
	 }else if(num == 2){
		 out.print("<script type='text/javascript'>alert('修改成功！');location='../themeView.jsp'</script>");
	 }else{
		 out.print("<script type='text/javascript'>alert('修改失败！');window.history.go(-1)</script>");
	 }

%>	

</body>
</html>
