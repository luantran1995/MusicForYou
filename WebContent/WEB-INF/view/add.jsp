<%@page import="nashtech.luantran.musicstore.controller.AdminController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

<link href="<c:url value="/css/common.css"/>" rel="stylesheet">
<script>
	function validateForm() {
		var x = document.forms["myForm"]["price"].value;
		if (x == "") {
			alert("Please enter price ");
			return false;
		}
	}
</script>
<%
	String baseURL = (String) request.getAttribute(AdminController.PARAM_BASE_URL);
	String latestPhotoUpload = (String) request.getAttribute(AdminController.PARAM_LATESTPHOTO);
%>

<form:form action="${pageContext.request.contextPath }/admin/add"
	method="POST" commandName="albumVO" enctype="multipart/form-data"
	class="" name="myForm" onsubmit="return validateForm()" >


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


			<div class="form-group">
				<label>Price:</label>
			</div>
			<div class="form-group ">
				<form:input type="number" step="0.001" path="price"
					class="form-control " min="0" placeholder="input Title of Price"
					style="width: 100%" />
				<form:errors path="price" cssClass="has-error"></form:errors>

			</div>

			<div class="form-group ">
				<label>Title:</label>
			</div>
			<div class="form-group ">
				<form:input type="text" path="title" class="form-control"
					placeholder="input Title of album" style="width: 100%" />
				<form:errors path="title" cssClass="has-error"></form:errors>

			</div>


		<div class="form-group ">
			<label>Image:</label>
		</div>
		
		
		<div class="form-group">
			<div class="form-group">
				 <input type="file" name="file" />
				<form:errors name="file" cssClass="has-error"></form:errors>
			</div>
		</div>
		<%
			if (latestPhotoUpload != null && !"".equals(latestPhotoUpload)) {
		%>
		<div class="row">
			<div class="col-md-12">
				<img src="<%=baseURL%>/image/<%=latestPhotoUpload%>">
			</div>
		</div>
		<%
			}
		%>

		<p>
			<button class="btn btn-success" type="submit" value="Submit">Create</button>
		</p>
	</div>
</form:form>



<div id="footer">
	<a href="https://spring.io/">built with Spring MVC </a>
</div>

<script src="${contextPath}/js/bootstrap.min.js"></script>
</body>
</html>