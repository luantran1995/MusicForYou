<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
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
		
		<a href="${pageContext.request.contextPath}/admin">Back</a>

</html>