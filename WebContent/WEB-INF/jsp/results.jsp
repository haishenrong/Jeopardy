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

	<form:form method="GET" action="/Jeopardy/select">
	<table border="1" cellpadding="5">
	<caption><h2>Final Scores</h2></caption>
	<tr>
			<c:forEach var="player" items="${players}">
				
				<td  width = "250" height = "75" align = "center">
				<label  style ="width : 230px; height: 140px;" ><p style="font-size:30px; font-family:'Courier New'">${player}</p></button>
				</td>
				
			</c:forEach>
	</tr>
	<tr>
			
			<c:forEach var="score" items="${scores}">
				
				<td  width = "250" height = "75"
				
				 align = "center">${score}</td>
				
			</c:forEach>
	</tr>
			
	</table>

		<tr>
			<td colspan="2" align="center"><input type="submit"
				class="button" name="return" value="return" /> </td>
		</tr>

	</form:form>


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