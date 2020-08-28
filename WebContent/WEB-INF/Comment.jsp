<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<td><c:out value="${image.title }" /></td>
			<td><img src="${image.directory}/${image.title}.jpg" width="400"
				height="400" /></td>
			<td><c:out value="${image.date}" /></td>
			<td><c:out value="${image.directory }" /></td>
		</tr>
	</table>

	<table>
		<tr>
			<th>User</th>
			<th>Comment</th>
		</tr>
		<c:forEach var="list" items="${listofcomments}">
			<tr>
				<td>${list['key'].surname} ${list['key'].name}</td>
				<td>${list.value}</td>
			</tr>
		</c:forEach>
	</table>

	<div>
		<form action="@{/CreateComment}" method="POST">
			<fieldset>
				<p>
					Insert comment: <input type="text" name="comment" required />
				</p>
				<input type="hidden" name="imageid" value="${image.id}">
				<button type="submit" name="send" value="true">Send</button>
			</fieldset>
		</form>
	</div>
	<div>
		<form action="HomePage" method="GET">
			<button>BACK TO HOMEPAGE</button>
		</form>
	</div>
</body>
</html>