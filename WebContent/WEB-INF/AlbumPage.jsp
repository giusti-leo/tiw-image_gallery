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
				<th>Thumbnail</th>
				<th>Title</th>
			</tr>
			<c:forEach var="photos" items="${images}">
				<tr>

					<td><a href="GetComments?imageid=${photos.id}"> <img
							src="${photos.directory}/${photos.title}.jpg" width="40"
							height="40" />
					</a></td>
					<td>${photos.title}</td>
				</tr>
			</c:forEach>
			<tr>
				<c:if test="${numberofpages gt pageno}">
					<td><div>
							<form action="GetImages" method="GET">
								<input type="hidden" name="albumid" value="${albumid}" /> <input
									type="hidden" name="pageno" value="${pageno+1}" />
								<button type="submit">NEXT</button>
							</form>
						</div></td>
				</c:if>
			<tr>
				<c:if test="${pageno != 1}">
					<td><div>
							<form action="GetImages" method="GET">
								<input type="hidden" name="albumid" value="${albumid}" /> <input
									type="hidden" name="pageno" value="${pageno-1}" />
								<button type="submit">BACK</button>
							</form>
						</div></td>
				</c:if>
			</tr>
		</table>

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
					<td>${list['key'].surname}${list['key'].name}</td>
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
	<div>
		<form action="HomePage" method="GET">
			<button>BACK TO HOMEPAGE</button>
		</form>
	</div>
</body>
</html>

