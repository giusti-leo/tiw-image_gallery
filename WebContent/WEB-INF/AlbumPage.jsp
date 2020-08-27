<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Images </title>
</head>
<body>
<p> ${image.id} </p>
	<table>
	<tr> 
	<th>Thumbnails </th> 
	<th>Title </th>
	</tr>
	<c:forEach var="image" items="${images}" > 
	<tr>
	<td> 
	<p> PageNumber ="${pageno}" </p>
	<p> Number_of_Pages ="${numberofpages}" </p>
	<p> ID ="${image.id}" </p>
	<p> TITLE="${image.title}" </p>
	<p> TEXT="${image.text}" </p>
	<p> DIRECTORY="${image.directory}" </p>
	<p> DATE="${image.date}" </p>
	<a href="/GetComments?imageid=${image.id}" > 
	<img src="${image.directory}/${image.title}.jpg" width="400" height="200" /> 
	</a> 
	</td>
	<td> ${image.title} </td>
	</tr> 
	<tr>
	</c:forEach>
	<tr>
	<c:if test="${pageno  != 1}" > 
		<td> <a href="/GetImages?albumid=${albumid}&${pageno +1}"> NEXT </a> </td>
		</c:if>
	<tr>	
	<c:if test ="${numberofpages lt pageno}" > 
		<td> <a href="/GetImages?albumid=${albumid}&${pageno -1}"> BACK </a> </td>
		</c:if>
		</tr> 
	<tr>
	<td> 
	<div>
	<form th:action="/HomePage" method="GET">
	<button> BACK TO HOMEPAGE
	</button>
	</form>
	</div>
	</td>	
	</table>
</body>
</html>

