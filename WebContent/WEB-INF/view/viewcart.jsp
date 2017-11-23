<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<section></section>

		<section class="container">

			<div>

				<div>
					<a class="btn btn-danger pull-left"><span
						class="glyphicon glyphicon-remove-sign"></span> Clear Cart</a> <a
						href="<spring:url value="" />" class="btn btn-success pull-right"><span
						class="glyphicon glyphicon-shopping-cart"></span> Check out</a>
				</div>

				<br /> <br /> <br />

				<table class="table table-hover">
					<tr>
						<th>Album name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th></th>
						<th></th>
						<th></th>


					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="#" class="label label-danger" onclick=""><span
								class="glyphicon glyphicon-remove"></span>remove</a></td>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>Grand Total</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</table>

				<a href="<c:url value ="/genre?name=${album.genre.name}"/>"
					class="btn btn-default">Continue shopping </a>
			</div>
		</section>
	</div>
</div>
<!-- My -->
<script src="<c:url value="/resources/js/controller.js?v3" /> "></script>

