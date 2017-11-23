<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>


<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="<c:url value="${album.albumArtUrl}" />" alt="image"
						style="width: 70%" />
				</div>
				<div class="col-md-5">
					<p>
						<strong>Title:</strong>: ${album.title}
					</p>
					<p>
						<strong>Genre:</strong>: ${album.genre.name}
					</p>
					<p>
						<strong>Artist:</strong>:${album.artist.name}
					</p>
					<p>
						<strong>Price:</strong>: ${album.price}
					</p>
					<br />
					<p>
						<a href="<c:url value = "/genre?name=${album.genre.name}"/>"
							class="btn btn-default">Back</a> <a href="#"
							class="btn btn-warning btn-large"
							onclick="addToCart('${album.id}')"><span
							class="glyphicon glyphicon-shopping-cart"></span> Add Cart</a> <a
							href="<spring:url value="" />" class="btn btn-default"><span
							class="glyphicon glyphicon-hand-right"></span> View Cart</a>
					</p>
				</div>
			</div>
		</div>
		<div id="footer">
			<a href="https://spring.io/">built with Spring MVC </a>
		</div>
	</div>

</div>


<!-- My -->
<script src="<c:url value="/resources/js/controller.js?v3" /> "></script>

