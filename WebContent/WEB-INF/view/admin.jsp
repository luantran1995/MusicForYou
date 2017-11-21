<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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

		<a href="<c:url value="/admin/getList"/>"> Create New Album </a>





		<div id="header">
			<ul id="navlist">
				<li class=""><a href="${pageContext.request.contextPath}/" id="current">Home</a></li>
				<li><a href="">Store</a></li>
				<li><a href="">Cart(0)</a></li>
				<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
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
			<table>
				<tr>
					<th>Image</th>

					<th>Title</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>
					<th>
				</tr>
				<c:forEach items="${albums}" var="album">
					<tr>
						<td><img src="<c:url value="${album.albumArtUrl}" />"/></td>
						<td>${album.title}</td>
						<td>${album.artist.name }</td>
						<td>${album.genre.name }</td>
						<td><a href="<c:url value ="/admin/update/${album.id}"/>">
								Edit </a>| <a href="<c:url value="/admin/detail/${album.id}"/>">Detail</a>|
							<a href="<c:url value="/admin/delete/${album.id}"/>">Delete</a>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a href="${pageContext.request.contextPath}">Back</a>
		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
	</div>
</body>
</html>