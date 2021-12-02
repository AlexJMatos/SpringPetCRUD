<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Information</title>
<!-- Reference the style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/add-pet-style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Pets Manager</h2>
		</div>
	</div>

	<div id="container">

		<h3>Pet information:</h3>

		<form:form action="save" modelAttribute="pet" method="POST">

			<!-- Associate data with pet id -->
			<form:hidden path="id" />
			<table>
				<tbody>

					<tr>
						<td><label>Name: </label></td>
						<td><form:input type="text" path="petName" required="true"
								pattern="[a-zA-Z]+" title="Only letters" /></td>
					</tr>

					<tr>
						<td><label>Type: </label></td>
						<td><form:select path="petType" id="typeList">
								<form:options items="${types}" />
							</form:select></td>
					</tr>

					<tr>
						<td><label>Birthday: </label></td>
						<td><form:input type="date" path="birthday" required="true"
								id="dateField" /></td>
					</tr>

					<tr>
						<td><label>Weight: </label></td>
						<td><form:input type="number" path="weight" step="any"
								min="0.01" name="weightInput" value="" oninput="check(this)" /></td>
						<td><p>Kilograms</p></td>
					</tr>

					<tr>
						<td><label>Height: </label></td>
						<td><form:input type="number" path="height" step="any"
								min="0.01" name="heightInput" value="" oninput="check(this)" /></td>
						<td><p>Centimeters</p></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save Pet" class="save" /></td>
					</tr>
				</tbody>
			</table>

		</form:form>
		<hr />

		<div style="">
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
			</security:authorize>
			<p>
				<a href="${pageContext.request.contextPath}/list">Back to the
					main list</a>
			</p>
		</div>
	</div>

	<script>
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();

		if (dd < 10) {
			dd = '0' + dd;
		}

		if (mm < 10) {
			mm = '0' + mm;
		}

		today = yyyy + '-' + mm + '-' + dd;
		document.getElementById("dateField").setAttribute("max", today);
	</script>
</body>
</html>