<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>My Music Store</title>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>



<!-- Bootstrap core CSS -->
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- MaCarouselin CSS -->

<link rel="stylesheet" href="<c:url value="/css/style.css"/>" />

<!-- <!-- Main CSS --> 
<%-- <link href="<c:url value="/css/main.css" />" rel="stylesheet"> --%>


<link
	href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css"
	rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper">
		<div class="header">

			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav pull-right">
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
								<li><a href="${pageContext.request.contextPath}/">Home</a></li>
								<li><a href="">Store</a></li>
								<c:if
									test="${pageContext.request.userPrincipal.name != 'admin'}">
									<li><a href="">Cart</a></li>
								</c:if>
								<c:if
									test="${pageContext.request.userPrincipal.name != 'admin'}">
									<li><a href="<c:url value="/admin" />">Management</a></li>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
								</c:if>
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<li><a href="${pageContext.request.contextPath}/">Home</a></li>
								<li><a href="">Store</a></li>
								<li><a href="">Cart</a></li>
								<li><a href="<c:url value="/registration" />">Register</a></li>
								<li><a href="<c:url value="/login" />">Login</a></li>
							</c:if>
						</ul>
							
					</div>
				</div>
			</nav>

		</div>
	</div>