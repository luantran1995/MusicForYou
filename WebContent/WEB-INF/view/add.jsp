<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

<link href="<c:url value="/css/common.css"/>" rel="stylesheet">


<form:form action="${pageContext.request.contextPath }/admin/add"
	method="POST"  commandName="albumVO"
	enctype="multipart/form-data" class="">


	<div class="container">
		<div class="form-group">
			<label>Genre:</label>
		</div>
		<div class="form-group">
			<form:select class="form-control" path="idGenre" style="width: 100%">
				<c:forEach items="${genres}" var="genre">
					<form:option value="${genre.id}" label="${genre.name}" />
				</c:forEach>
			</form:select>
		</div>

		<div class="form-group">
			<label>Artist:</label>
		</div>
		<div class="form-group">
			<form:select class="form-control" path="idArtist" style="width: 100%">
				<c:forEach items="${artists}" var="artist">
					<form:option value="${artist.id}" label="${artist.name}" />
				</c:forEach>
			</form:select>
		</div>
		<spring:bind path="price">

			<div class="form-group">
				<label>Price:</label>
			</div>
			<div class="form-group ${status.error ? 'has-error' : ''}" >
				<form:input type ="text" path="price" class="form-control"
					placeholder="input Title of Price" style="width: 100%" />
				<form:errors path="price"></form:errors>

			</div>

		</spring:bind>

		<spring:bind path="title">
			<div class="form-group ">
				<label>Title:</label>
			</div>
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<form:input type ="text" path="title" class="form-control"
					placeholder="input Title of album" style="width: 100%"/>
				<form:errors path="title"></form:errors>

			</div>
		</spring:bind>


		<div class="form-group ">
			<label>Image:</label>
		</div>
		<div class="form-group">
			<%-- <form:input  path="albumArtUrl" type="file" placeholder="input Title of album" />--%>
			<div>
				<input type="file" name="file">
			</div>

		</div>


		<p>
<!-- 			<input class="btn-lg btn-primary" type="submit" value="Create" /> -->
						<button class="btn btn-lg  " type="submit">Create</button>
						
			
		</p>
	</div>




</form:form>



<div id="footer">
	<a href="https://spring.io/">built with Spring MVC </a>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
</body>
</html>