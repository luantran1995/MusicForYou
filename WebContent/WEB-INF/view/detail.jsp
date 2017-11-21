<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>" />
<title>Store Index</title>
</head>
<body>
	<span sec:authentication="name"></span>
	<span sec:authentication="principal.authorities"></span>
	<div>
		<img src="<c:url value="/image/logo.png" />" />
		<h2>SPRING MVC MUSIC STORE</h2>
		<div id="header">
			<ul id="navlist">
				<li class=""><a href="${pageContext.request.contextPath}/" id="current">Home</a></li>
				<li><a href="">Store</a></li>
				<li><a href="">Cart(0)</a></li>
				<li><a  href="<c:url value="/logout"/>">Logout</a></li>
			</ul>
		</div>
	
		<div>
			<table>
				<tr>
					<th></th>
					<th>Title</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>Price</th>
				</tr>
				<tr>
					<td><img src="<c:url value="${album.albumArtUrl}" />" /></td>
					<td>${album.title}</td>
					<td>${album.artist.name }</td>
					<td>${album.genre.name }</td>
					<td>${album.price}</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
		<a href="${pageContext.request.contextPath}/admin">Back</a>
	</div>
</body>
</html>