<%@page import="com.entiy.User"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页</title>
		<style>
			#reg{margin: 0 auto;width: 300px;}
			.st{width: 100px;margin-left: 0;float: left;}
		</style>
</head>
<body>
<script type="text/javascript">
	
</script>

<div id="reg">
		<form name="form1" action="CtrlFile/RegControl.jsp" method="post" id="form1">
			<!-- <span class="st">注册邮箱 </span><input type="email" name="email" id="email" value="" /><br /> -->
			<span class="st">用户名 </span> <input type="text" name="name" id="name" value="" /><br />
			<span class="st">密码 </span> <input type="password" name="password1" id="password" value="" /><br />
			<span class="st">确认密码 </span><input type="password" name="password2" id="password" value="" /><br />
			<!-- <input type="checkbox" name="cb" id="" value="我已经阅读并接受协议" />我已经阅读并接受协议<br /> -->
			<input type="submit" value="注册"/>
		</form>
		</div>

</body>
</html>