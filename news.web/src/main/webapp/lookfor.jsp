<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookfor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
	//声明xml对象
	var xmlhttp;
	//关键字
	var key;
	var str;
	var searchSuggest = function(){
		//得到输入框中的值
		 key = document.getElementById("txtSearch").value;
		 doAjax("servlet/lookfor?key="+key);
	}
	
	function doAjax(url){
  		if (window.XMLHttpRequest) {
  			// code for IE7+, Firefox, Chrome, Opera, Safari  
        	xmlhttp = new XMLHttpRequest();  
    	}else {
	    	// code for IE6, IE5
	        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
    	}
	    	
	    xmlhttp.onreadystatechange = pr;
		
		xmlhttp.open("post", url, true);
		
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		xmlhttp.send(null);
	}
	
   	//请求结果处理程序
   	function pr(){
   		var li="";
   		if (xmlhttp.readyState == 4) { 
       		if(xmlhttp.status == 200){
       			str = xmlhttp.responseText.split("-",6);
       			if(str.length>0){
       				suggest.style.display="block";
       				for(i = 0;i<str.length;i++){
       					li+="<li onclick='input(this)'>"+str[i]+"</li>"
       				}
       				ul.innerHTML = li;
       			}
       		}else{
           		alert("请求处理返回的数据有错误");
	        }
       	}
   	}
   	
   	function input(object) {
		var st = object.innerHTML;
		document.getElementById("txtSearch").value = st;
		suggest.style.display="none";
	}
	

  </script>
  <style>
  	#suggest{position:absolute;background-color:#FFFFFF;text-align: :left;border: 1px solid #000000;display:none;width:200px}
	#suggest ul{list-style: none;margin:0;padding:0}
	#suggest ul li{line-height:24px;font-size:16px;white-space: nowrap;overflow: hidden;}
	#suggest ul li:hover{background-color:#e5e5e5}
  </style>
  
  <body>
      <div style="width:500px">  
          <form action="serach.jsp" id="formSearch">
             <input type="text" id="txtSearch" name="txtSearch"  onkeyup="searchSuggest()"autocomplete="off" style="width:200px"/>  
             <input type="submit" id="cmdSerach" name="cmdSearch" value="搜索" onclick="check()"/><br/>
       	 	 <div id="suggest"><ul id="ul"></ul></div>
       	 </form> 
  </body>
</html>
