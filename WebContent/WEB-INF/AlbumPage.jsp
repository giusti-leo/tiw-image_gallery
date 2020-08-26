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
	<table>
	<tr> 
	<th>Thumbnails </th> 
	<th>Title </th>
	</tr>
	<c:forEach var="image" items="\${images}" > 
	<tr>
	<td> <a href="GetComments?imageid=${image.id}" > <img src=" <c:url value="${image.image}" />" width="400" height="200" > </a> </td>
	<td> ${image.title } </td>
	</tr> 
	<tr>
	</c:forEach>
	<tr>
	<c:if test="${pageno  != 1}" > 
		<td> <a href="GetImages?albumid=${albumid}&${pageno +1}"> NEXT </a> </td>
		</c:if>
	<tr>	
	<c:if test ="${numberofpages lt pageno}" > 
		<td> <a href="GetImages?albumid=${albumid}&${pageno -1}"> BACK </a> </td>
		</c:if>
		</tr> 
	<tr>
	<td> 
	<a href="../WEB-INF/HomePage.html" > Back to Home Page  </a> 
	</td>	
	</table>
</body>
</html>

