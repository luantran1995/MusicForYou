<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>" />

<title>Store Index</title>
</head>
<style>
<
body
>
</style>
<div>
	<div id="header">
		<img src="<c:url value="/image/logo.png" />" />
		<h2>SPRING MVC MUSIC STORE</h2>
		<ul id="navlist">
			<li class="first"><a href="${pageContext.request.contextPath}/"
				id="current">Home</a></li>
			<li><a href="">Store</a></li>
			<li><a href="">Cart</a></li>
			<li><a href="">Login</a></li>
		</ul>
	</div>
	<div>
		<ul id="categories">
			<c:forEach var="genre" items="${genres}">
				<li><a href="<c:url value="/genre?name=${genre.name}"/>">${genre.name}</a></li>
			</c:forEach>
		</ul>
	</div>
	<form action="/cartdetail" method="post">
	<div id="main">
		<div class="genre">
			<h1>Albums</h1>
			<ul id="album-list">
				<c:forEach items="${albums}" var="album">
					<li><a href="<c:url value="/cartdetail/${album.id}" />"><img src="<c:url value="${album.albumArtUrl}" />" />
					<span>${album.title}</span> 
					</a></li>

				</c:forEach>
			</ul>
		</div>
	</div>
	
	
	
	</form>
	
</div>
</body>
</html>