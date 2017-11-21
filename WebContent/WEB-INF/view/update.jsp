<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
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
				<li><a href="<c:url value="/logout"/>">Logout</a></li>
			</ul>
		</div>

		<div>
			<form:form action="${pageContext.request.contextPath}/admin/update" method="POST" commandName="albumVO">
			<form:hidden path="id" value="${albumVO.id}"/>
			<form:hidden path="idArtist" value="${albumVO.idArtist}"/>
			<form:hidden path="idGenre" value="${albumVO.idGenre}"/>
			<form:hidden path="albumArtUrl" value="${albumVO.albumArtUrl}"/>
				<table>
					<tr>
						<th></th>
						<th>Title</th>
						<th>Artist</th>
						<th>Genre</th>
						<th>Price</th>
					</tr>
					<tr>
						<td><form:input path="title"
								placeholder="input Title of album" value="${albumVO.title}" /></td>
						<td><form:input path="nameArtist"
								placeholder="input Title of album" value="${albumVO.nameArtist }" /></td>
						<td><form:input path="nameGenre"
								placeholder="input Title of album" value="${albumVO.nameGenre}" /></td>
						<td><form:input path="price"
								placeholder="input Title of album" value="${albumVO.price }" /></td>

						<td>
							<button type="submit">Save</button> <br />
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
	</div>
</body>
</html>