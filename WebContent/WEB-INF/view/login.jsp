<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>Login Page</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

<link href="<c:url value="/css/common.css"/>"  rel="stylesheet">
</head>
<body>
<div class="container">
		<form th:action="@{/login}" method="POST" class="form-signin">
		 <h2 class="form-heading">Log in</h2>
		
		<div class ="form-group ${error != null ? 'has-error' : ''}">
		<span>${message}</span>
			<input type="text" class="form-control" name="email" placeholder="Your email"  />
			<input type="password" class="form-control"  name="password" placeholder="Your password" />
			<span>${error}</span>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			 <h4 class="text-center"><a href="${pageContext.request.contextPath}/registration">Create an account</a></h4>
		</div>
		</form>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
</html>