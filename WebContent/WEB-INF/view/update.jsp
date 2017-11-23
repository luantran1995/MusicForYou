<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/view/template/header.jsp" %>

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
</body>
</html>