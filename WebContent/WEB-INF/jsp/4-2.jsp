<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
td {
 text-align:center
}
</style>
</head>
<body>
<h2>Clue</h2>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />
	<sql:query var="clues" dataSource="${myDS}">
        SELECT * FROM CLUE WHERE ID = 17;
    </sql:query>
    	<form:form method="GET" action="/Jeopardy/select">

		<table>

			<c:forEach var="clue" items="${clues.rows}">
                <tr>
				<td>${clue.prompt}</td>
				</tr>
				<tr>
				<td><div  style = "display:none" id="myDIV">${clue.response}</div></td>
				</tr>
			</c:forEach>
		</table>
		
		<tr>
			<td colspan="2">
			<input type="submit" class="button" name="return" value="return" />
			</td>
		</tr>
		
	</form:form>
	<button onclick="myFunction()">Show/Hide</button>
<script>

function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
</script>

		
</body>
</html>