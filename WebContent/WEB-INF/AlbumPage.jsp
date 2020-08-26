<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Images</title>
</head>
<body>
	<table>
		<tr>
			<th>Title</th>
			<th>Image</th>
			<th>Date</th>
			<th>Directory</th>
		</tr>
		<c:forEach var="image" items="${images}">
			<tr>
				<td> ${image.title } </td>
				<td> <img src="<c:url value=" ${image.image}"/>" > </td>
				<td> ${image.date } </td>
				<td>${image.directory }</td>
			</tr>
		</c:forEach>
	</table>
	
	<table> 
		<c:forEach var="entry" items="${comments.map}"> 
			<tr>
				<td>
					<c:out value="${entry.value.name} ${entry.value.surname}"/> 
				</td>
				<td>
					<c:out value="${entry.key.text}"/>
				</td>
			</tr> 
		</c:forEach> 
	</table>

<div>
	<form  action="#" th:action="@{/CreateComment}" method="POST">
			<fieldset>
				<p>Insert comment: <input type="number" step="0.0001" name="food" min=0 required/></p>
				<input type="submit" name="text" th:value="${user.id}">
			</fieldset>
	</form>
</div>
<h1><a href="../WEB-INF/HomePage.html"> Back to Home Page </h1>

</body>
</html>