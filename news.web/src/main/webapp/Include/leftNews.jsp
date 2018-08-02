<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻显示</title>
<body>
	<div id="container">
		<div class="sidebar">
			<h1>
				<img src="Images/title_1.gif" alt="国内新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<c:forEach var="listcn" items="${requestScope.listcn }"
						varStatus="listcnStatus" begin="0" end="5">
						<li><a href='NewsPage.jsp?nid=${listcn.id }'><b>
									${listcn.title }</b></a></li>
					</c:forEach>
				</ul>
			</div>
			<h1>
				<img src="Images/title_2.gif" alt="国际新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<c:forEach var="listinter" items="${requestScope.listinter }"
						varStatus="listinterStatus" begin="0" end="5">
						<li><a href='NewsPage.jsp?nid=${listinter.id }'><b>
									${listinter.title }</b></a></li>
					</c:forEach>
				</ul>
			</div>
			<h1>
				<img src="Images/title_3.gif" alt="娱乐新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<c:forEach var="listem" items="${requestScope.listem }"
						varStatus="listemStatus" begin="0" end="5">
						<li><a href='NewsPage.jsp?nid=${listem.id }'><b>
									${listem.title }</b></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
</body>
</head>
</html>