<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Add the taglibs for security -->
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pets Manager</title>
<!-- Reference the style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Pets Manager</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<!-- Add button -->
			<security:authorize access="hasRole('ADMIN')">
				<input type="button" value="Add Pet"
					onclick="window.location.href='add'; return false;"
					class="add-button" />
			</security:authorize>

			<!-- Add the HTML table -->
			<table>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Birthday</th>
					<th>Weight (kg)</th>
					<th>Height (cm)</th>
					<!-- Show the action column only if the user is admin -->
					<security:authorize access="hasRole('ADMIN')">
						<th>Action</th>
					</security:authorize>
				</tr>

				<!-- Loop to print the pets -->
				<c:forEach var="tempPet" items="${pets}">

					<security:authorize access="hasRole('ADMIN')">
						<c:url var="updateLink" value="/update">
							<c:param name="petId" value="${tempPet.id }" />
						</c:url>

						<c:url var="deleteLink" value="/delete">
							<c:param name="petId" value="${tempPet.id }" />
						</c:url>
					</security:authorize>


					<tr>
						<td>${tempPet.petName}</td>
						<td>${tempPet.petType}</td>
						<td>${tempPet.birthday}</td>
						<td>${tempPet.weight}</td>
						<td>${tempPet.height}</td>

						<security:authorize access="hasRole('ADMIN')">
							<td><a href="${updateLink}">Update</a> | <a
								href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete the pet?'))) return false;">Delete</a></td>
						</security:authorize>

					</tr>
				</c:forEach>
			</table>

		</div>

		<!-- Display the user information USERNAME and ROLE -->
		<security:authorize access="isAuthenticated()">
			<p>
				<b>User: </b>
				<security:authentication property="principal.username" />
			</p>

			<p>
				<b>Role(s): </b>
				<security:authentication property="principal.authorities" />
			</p>

			<form:form action="${pageContext.request.contextPath}/logout"
				method="POST">
				<input type="submit" value="Logout" class="logout-button" />
			</form:form>
		</security:authorize>

		<security:authorize access="isAnonymous()">
			<p><b>User: </b> GUEST</p>
		</security:authorize>
		<p>
			<a href="${pageContext.request.contextPath}/">Back to the main
				menu</a>
		</p>
	</div>
</body>
</html>