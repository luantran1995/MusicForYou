<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<li><a href="${pageContext.request.contextPath}/admin">Login</a></li>
			</ul>
		</div>
		<form:form action="${pageContext.request.contextPath }/admin/add" method="post" commandName="albumVO" enctype="multipart/form-data">
			<div>
				<div class="editor-label">
					<label>Genre:</label>
				</div>
				<div class="editor-field">
					<form:select path="idGenre">
						<c:forEach items="${genres}" var="genre">
							<form:option value="${genre.id}" label="${genre.name}" />
						</c:forEach>
					</form:select>
				</div>

				<div class="editor-label">
					<label>Artist:</label>
				</div>
				<div class="editor-field">
					<form:select path="idArtist">
						<c:forEach items="${artists}" var="artist">
							<form:option value="${artist.id}" label="${artist.name}" />
						</c:forEach>
					</form:select>
				</div>

				<div class="editor-label">
					<label>Price:</label>
				</div>
				<div class="editor-field">
					<form:input path="price" placeholder="input Title of album" />
				</div>

				<div class="editor-label">
					<label>Title:</label>
				</div>
				<div class="editor-field">
					<form:input path="title" placeholder="input Title of album" />
				</div>
				
				<div class="editor-label">
					<label>Image:</label>
				</div>
				<div class="editor-field">
<%-- 					<form:input  path="albumArtUrl" type="file" placeholder="input Title of album" />

 --%>					<input type="file" name="file">
 
						Name: <input type="text" name="name">
 
 				</div>


				<p>
					<input type="submit" value="Create" />
				</p>
			</div>



		</form:form>

		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
	</div>
</body>
</html>