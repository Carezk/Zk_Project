<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.DaoImpl.*" %>
<%@ page import="com.entiy.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻控制页面</title>
</head>
<body>
<%
	SmartUpload a = new SmartUpload();
	//初始化SmartUpload对象
	a.initialize(pageContext);
	com.jspsmart.upload.File file=null;
	//允许上传类型
	String allowed = "gif,jpg,png,jpeg,bmp";
	//不允许类型
	String denied = "jsp,asp,php,aspx,html,exe,bat";
	com.jspsmart.upload.Request req=a.getRequest();
	//设置上传文件大小
	int file_size = 5*1024*1024;
	String exceptionMsg = null;
	String filepath = null;
	try{
		//定义允许上传文件类型
		a.setAllowedFilesList(allowed);
		//不允许上传类型
		a.setDeniedFilesList(denied);
		//单个文件最大限制
		a.setMaxFileSize(file_size);
		a.setCharset("UTF-8");
		//执行上传
		a.upload();
		//得到单个上传文件信息
		file = a.getFiles().getFile(0);
		if(!file.isMissing()){
		//设置文件在服务器的准确位置
			filepath = "upload\\";
			filepath =filepath + file.getFileName();
		//文件另存为
			file.setCharset("UTF-8");
			file.saveAs(filepath,SmartUpload.SAVE_VIRTUAL);
		}
	}catch(Exception e){
		exceptionMsg = e.getMessage();
		e.printStackTrace();
		out.print(exceptionMsg);
	}

		request.setCharacterEncoding("UTF-8");
		String themeId = req.getParameter("theme");         //主题id
		String title = req.getParameter("title");			//标题
		String author = req.getParameter("author");			//作者
		String digest = req.getParameter("digest");			//摘要
		String article = req.getParameter("article");		//文章内容
		
		ThemeDaoImpl tdl = new ThemeDaoImpl();
		int tid = Integer.parseInt(themeId);
		//获得当前主题的名称
		String name = tdl.getThemeName(tid);
		
		//添加新闻
		NewsDaoImpl ndl = new NewsDaoImpl();
		News n = new News();
		n.setTheme(name);
		n.setThemeId(tid);
		n.setTitle(title);
		n.setAuthor(author);
		n.setDigest(digest);
		n.setArticle(article);
		n.setPhotoName(filepath);
		int count = ndl.addNews(n);
		out.print(count);
		if(count>0){
			out.print("<script type='text/javascript'>alert('添加成功');location='../Background.jsp'</script>");
		}else{
			out.print("<script type='text/javascript'>alert('添加失败');location='../Addnews.jsp'</script>");
		}
%>

</body>
</html>