
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
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

 --%>
			<div><input type="file" name="file"></div>
<p>			<div>Name: <input type="text" name="name"></div>
</p>
		</div>


		<p>
			<input type="submit" value="Create" />
		</p>
	</div>



</form:form>

<div id="footer">
	<a href="https://spring.io/">built with Spring MVC </a>
</div>
</body>
</html>