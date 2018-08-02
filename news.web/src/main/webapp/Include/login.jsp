<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录框控制</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var xmlhttp;
		var name;
  		function checkLogin(){
  			//获得输入的用户名
	  		name = document.getElementById("uname").value;
	  		//获得输入的密码
	  		var password = document.getElementById("upwd").value;
	  		if(name=="" || password==""){
	  			alert("请输入用户名或者密码");
	  		}else {	  			
	  			doAjax("servlet/loginCtrl?name=" + name + "&password=" + password);
	  		}
	  	}
	  	
	  	function doAjax(url){
	  		if (window.XMLHttpRequest) {
	  			// code for IE7+, Firefox, Chrome, Opera, Safari  
	        	xmlhttp = new XMLHttpRequest();  
	    	}else {
		    	// code for IE6, IE5
		        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
	    	} 
	    	////请求结果处理程序
	    	xmlhttp.onreadystatechange = function() { 
	        	if (xmlhttp.readyState == 4) {
	        		if(xmlhttp.status == 200){
	        			//responseText表示请求完成后，返回的字符串值
	        			if(xmlhttp.responseText == "1"){
	        				//管理员登录成功，替换div内容
	        				window.location="/news.web/Background.jsp";
	            		} 
	            		if(xmlhttp.responseText == "2"){
	            			//普通会员登录成功，替换div内容
							mess.style.display = "none"
							pepe.style.display = "block";
							normaluser.innerHTML = name;
							
	            		}
	            		if(xmlhttp.responseText == "3"){
	            			//登录失败，提示
	            			alert("请正确输入用户名和密码！ ");
	            		}
	            	}else{
	            		alert("请求处理返回的数据有错误");
	            	}
	        	}  
    		}
    		//以post方法请求 
	    	xmlhttp.open("post", url, true);
	    	//如果以post方式请求，必须添加
	    	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    	//当send()方法不配置参数时，建议最好加上null
	    	xmlhttp.send(null); 
	    }
	    
	    
	    function over() {
			dame.style.display = "block";
			dame.style.backgroundColor = "white";
		}
		function out() {
			dame.style.display = "none";
		}
	</script>

  </head>
  <body>
	<%	
		String a = "none";
		String b = "none";
		String c = "none";
  		String ff = (String)session.getAttribute("login");
  		if(ff == null){
  			a = "block";
  		}
	%>
		<div id="mess" style="display:<%=a%>">
			<form action="" method="post">
		    <label> 登录名 </label>
		    <input type="text" id="uname" value="" class="login_input" name="uname"/>
		    <label> 密&#160;&#160;码 </label>
		    <input type="password" id="upwd" value="" class="login_input" name="password"/>
		    <input type="button" class="login_sub" value="登录" onclick="checkLogin()"/>
		    <a href="RegPage.jsp">注册</a>
		    </form>
		</div>
	<%if("zk".equals(ff)){ 
		   b = "inline";
	  }
	%>
		<div  id="ramos" style='display:<%=b %>'>
			<p>欢迎您，<a onmouseover="over()" onmouseout="out()"><%=ff %></a>
			<span id='zk'><a href="Background.jsp">进入管理页面</a><a href='CtrlFile/exit.jsp'>&nbsp退出登录</a></span></p>
			<div style='width:100px;height:100px;display:none;position:absolute;left:75px;top:23px;z-inde:5;'>
			<ul>
				<li>显示内容</li>
			</ul></div>
		</div>
	<%if(!"zk".equals(ff) && ff!=null){ 
			c="inline";
		}
	%>
		<div id="pepe" style='display:<%=c %>'>
			<p>欢迎您, <a onmouseover="over()" onmouseout="out()" id="normaluser"><%=ff %></a>
			<a href='CtrlFile/exit.jsp'>&nbsp退出登录</a></p>
			<div style='width:100px;height:100px;display:none;position:absolute;z-inde:999;left:55px;opacity: 0.8' id="dame">
				<ul>
					<li>显示内容1</li>
					<li>显示内容2</li>
					<li>显示内容3</li>
					<li>显示内容4</li>
				</ul>
			</div>
		</div>
	
 </body>
</html>