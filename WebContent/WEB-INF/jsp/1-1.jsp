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
	text-align: center
}
</style>
</head>
<body>
	<h2>Clue</h2>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />
	<sql:query var="clues" dataSource="${myDS}">
        SELECT * FROM CLUE WHERE ID = ${clueKey};
    </sql:query>
    <div align = "center">
	<form:form method="GET" action="/Jeopardy/select">


			<table border="1" cellpadding="5" >
				<c:forEach var="clue" items="${clues.rows}">
					<tr>
						<td width="250" height="250" align="center">${clue.prompt}</td>
					</tr>
				</c:forEach>
			</table>

		</table>
	<table border="1" cellpadding="5">
	<tr>
			<c:forEach var="score" items="${scores}">
				
				<td  width = "250" height = "75"
				
				 align = "center">${score}</td>
				
			</c:forEach>
	</tr>
	<tr>
			<c:forEach var="player" items="${players}">
				
				<td  width = "250" height = "300" align = "center">
				<button type="submit" style ="width : 230px; height: 290px;" name="playerSelect" value="${player}"><p style="font-size:30px; font-family:'Courier New'">${player}</p></button>
				</td>
				
			</c:forEach>
	</tr>
			
	</table>

		<tr>
			<td colspan="2" align="center"><input type="submit"
				class="button" name="playerSelect" value="return" /> </td>
		</tr>

	</form:form>

	<table border="1" cellpadding="5" width="250">
		<c:forEach var="clue" items="${clues.rows}">
			<tr>
				<td height="250" align="center"><div style="visibility: hidden"
						id="myDIV">${clue.response}</div></td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="myFunction()" align="center">Show/Hide
		Correct Response</button>
</div>
	<script>

function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.visibility === "hidden") {
	    x.style.visibility = "visible";
	  } else {
	    x.style.visibility = "hidden";
	  }
	}
</script>


</body>
</html>