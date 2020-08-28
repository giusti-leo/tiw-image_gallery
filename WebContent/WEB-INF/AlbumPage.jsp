<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Images</title>
</head>
<body>
	<div align="right">
		<a href="Logout">Logout</a>
	</div>
	<c:if test="${not selected}">
		<table>
			<tr>
				<td>Thumbnail</td>
				<c:forEach var="photos" items="${images}">
					<td><a href="GetComments?imageid=${photos.id}"> <img
							src="${photos.directory}/${photos.title}.jpg" width="40"
							height="40" />
					</a></td>
				</c:forEach>
			</tr>
			<tr>
				<td>Title</td>
				<c:forEach var="photos" items="${images}">
					<td>${photos.title}</td>
				</c:forEach>
			</tr>
		</table>
		
		<c:if test="${numberofpages gt pageno}">
			<div align="right">
				<form action="GetImages" method="GET">
					<input type="hidden" name="albumid" value="${albumid}" /> <input
						type="hidden" name="pageno" value="${pageno+1}" />
					<button type="submit">NEXT</button>
				</form>
			</div>
		</c:if>
		<c:if test="${pageno != 1}">
			<div align="left">
				<form action="GetImages" method="GET">
					<input type="hidden" name="albumid" value="${albumid}" /> <input
						type="hidden" name="pageno" value="${pageno-1}" />
					<button type="submit">BACK</button>
				</form>
			</div>
		</c:if>

	</c:if>
	<c:if test="${selected}">
		<table>
			<tr>
				<th>Title</th>
				<th>Image</th>
				<th>Date</th>
				<th>Directory</th>
			</tr>
			<tr>
				<td><c:out value="${image.title }" /></td>
				<td><img src="${image.directory}/${image.title}.jpg"
					width="400" height="400" /></td>
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
			<form action="CreateComment" method="POST">
				<fieldset>
					<p>
						Insert comment: <input type="text" name="text" required />
					</p>
					<button type="submit" name="imageid" value="${image.id}">Send</button>
				</fieldset>
			</form>
		</div>
	</c:if>
	<div align="center">
		<form action="HomePage" method="GET">
			<button>BACK TO HOMEPAGE</button>
		</form>
	</div>
</body>
</html>

