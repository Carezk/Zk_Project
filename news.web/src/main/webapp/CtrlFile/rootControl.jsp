<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String login = (String)session.getAttribute("login");
	if(!login.equals("zk")){
		response.sendRedirect("FrontPage.jsp");
	}
%>
