<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>" />
<title>Store Index</title>
</head>
<body>
	<div>
		<img src="<c:url value="/image/logo.png" />" />
		<h2>SPRING MVC MUSIC STORE</h2>
		<div id="header">
			<ul id="navlist">
				<li class=""><a href="${pageContext.request.contextPath}/" id="current">Home</a></li>
				<li><a href="">Store</a></li>
				<li><a href="">Cart(0)</a></li>
				<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
			</ul>
		</div>
		<div>
			<ul id="categories">
				<c:forEach var="genre" items="${genres}">
					<li><a href="<c:url value="/genre?name=${genre.name}"/>">${genre.name}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<img src="<c:url value="/image/home-showcase.png" />" />
		</div>

		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
	</div>
</body>
</html>