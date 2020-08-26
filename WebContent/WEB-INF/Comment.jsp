<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Image</title>
</head>
<body>
	<table>
		<tr>
			<th>Title</th>
			<th>Image</th>
			<th>Date</th>
			<th>Directory</th>
		</tr>
		<tr>
			<td><c:out value="${image.title }"/>  </td>
			<td> <img src="<c:url value=" ${image.image}"/>" > </td>
			<td> <c:out value="${image.date}"/> </td>
			<td> <c:out value="${image.directory }"/> </td>
		</tr>
	</table>
	
	<table> 
		<c:forEach var="entry" items="${listofcomments}"> 
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
	<form  action="@{/CreateComment}" method="POST">
			<fieldset>
				<p>Insert comment: <input type="text" name="comment" required/></p>
				<input type="hidden" name="imageid" value="${image.id}">
				<button type="submit" name="send" value="true"> Send </button>
			</fieldset>
	</form>
</div>
<h1><a href="../WEB-INF/HomePage.html"> Back to Home Page </a> </h1>

</body>
</html>