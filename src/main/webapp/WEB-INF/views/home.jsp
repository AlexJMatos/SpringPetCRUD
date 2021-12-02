<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>

<title>Home Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="content">
			<h2>Welcome to the home page of Pet's Manager</h2>
			<hr />

			<!-- Show the name of the user if authenticated -->
			<security:authorize access="isAuthenticated()">
				<p>
					<b>Welcome User: </b>
					<security:authentication property="principal.username" />
				</p>

				<p>
					<b>Your Role(s): </b>
					<security:authentication property="principal.authorities" />
				</p>
			</security:authorize>

			<!-- Show GUEST if the user is not authenticated -->
			<security:authorize access="isAnonymous()">
				<p>Welcome Guest!</p>
				<hr />
				<a href="${pageContext.request.contextPath}/loginForm">Click here to
					login</a>
			</security:authorize>

			<hr />
			<!-- Show the link to the List of Pets -->
			<a href="${pageContext.request.contextPath}/list">Click to view
				the complete list of pets</a>
			<hr />

			<security:authorize access="isAuthenticated()">
				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<button type="submit" class="btn btn-primary">Logout</button>
				</form:form>
			</security:authorize>

		</div>
	</div>
</body>
</html>