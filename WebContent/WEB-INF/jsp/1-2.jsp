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
p {
  font-size: 30px;
}
</style>
</head>
<body>

	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />
	<sql:query var="clues" dataSource="${myDS}">
        SELECT * FROM CLUE WHERE ID = 51;
    </sql:query>
    <div align = "center">


			<table border="1" cellpadding="5" >
			<caption><h2>Final Jeopardy</h2></caption>
				<c:forEach var="clue" items="${clues.rows}">
					<tr>
						<td width="300" height="100">
						<button id="fJCat" style ="width : auto; height: 100px;" onclick="myFunction('prompt')"" >${clue.category}</button>
						</td>
						<td width="300" height="100">
						<p id="demo"></p>
						</td>
					</tr>
					<tr>
					<td colspan="2" width = "600" height="250" align="center"><div style="visibility: hidden"
						id="prompt">${clue.prompt}</div></td>
					</tr>
				</c:forEach>
			</table>

		</table>
		<form:form method="GET" action="/Jeopardy/select">
	<table border="1" cellpadding="0">
	<tr>
			<c:forEach var="score" items="${scores}">
				
				<td  width = "200" height = "50"
				
				 align = "center">${score}</td>
				 
				
			</c:forEach>
	</tr>
	<tr>
			<c:forEach var="player" items="${players}">

				<td  width = "200" height = "50"
				
				 align = "center">${player}</td>
			</c:forEach>
	</tr>
	<tr>
			<c:forEach var="score" items="${scores}">
				<td  width = "200" height = "50" align = "center">
				<label for="wager">Wager:</label>
				<input type="number" id="wager" name= "wager" value = "0" min = "0" max = "${score}">
				</td>
			</c:forEach>
			</tr>
			<tr>
			<c:forEach var="player" items="${players}">
				<td  width = "200" height = "50" align = "center">
				<label for="correctness">Correctness:</label>
				<input type="checkbox" id="correctness" name="${player}correct"value = "1">
				</td>
			</c:forEach>
	</tr>
	</table>


		<tr>
			<td colspan="2" align="center"><input type="submit"
				class="button" name="return" value="return" /> </td>
			<td colspan="2" align="center"><input type="submit"
				class="button" name="playerLock" value="lock" /> </td>
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
	<button onclick="myFunction('myDIV')" align="center" >Show/Hide
		Correct Response</button>
</div>
<script>

function myFunction(val) {
	  var x = document.getElementById(val);
	  if (x.style.visibility === "hidden") {
	    x.style.visibility = "visible";
	  } else {
	    x.style.visibility = "hidden";
	  }
	  document.getElementById("fJCat").disabled = true;
	  if(val ==="prompt"){
		  var countDownDate = new Date().getTime()+32000;

		  var x = setInterval(function() {
		  
		  var now = new Date().getTime();
		  var distance = countDownDate - now;
		  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		  document.getElementById("demo").innerHTML = seconds + "s ";
		  if (distance < 0) {
			    clearInterval(x);
			    document.getElementById("demo").innerHTML = "Times Up";
		  }
		}, 1000);
		}
	}
 
	
</script>


</body>
</html>