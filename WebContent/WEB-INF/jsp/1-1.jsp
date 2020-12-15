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
						<td width="750" height="250" align="center">${clue.prompt}</td>
					</tr>
				</c:forEach>
			</table>

	<table border="2" cellpadding="5">
	<tr>
			<c:forEach var="score" items="${scores}">
				
				<td  width = "200" height = "50"
				
				 align = "center">${score}</td>
				
			</c:forEach>
	</tr>
	<tr>
			<c:forEach var="player" items="${players}">
				
				<td  width = "200" height = "50" align = "center">
				<button type="submit" style ="width : 130px; height: 40px;" name="playerSelect" value="${player}${clues.rows[0].difficulty}"><p style="font-size:13px; font-family:'Courier New'">${player} Right</p></button>
				<button type="submit" style ="width : 130px; height: 40px;" name="playerWrong" value="${player}${clues.rows[0].difficulty}"><p style="font-size:13px; font-family:'Courier New'">${player} Wrong</p></button>
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
	<button onclick="myFunction()" align="center" >Show/Hide
		Correct Response</button>
	<p id="func" style="visibility: hidden" ></p>
</div>
	<script>
//var playButtons = [[${playButtons}]];
function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.visibility === "hidden") {
	    x.style.visibility = "visible";
	  } else {
	    x.style.visibility = "hidden";
	  }
	}

function checkButtons() {
  	//var form = document.getElementsByTagName("form:form")[0];
  	var table = document.getElementsByTagName("table")[1];
  	var playButtons = [];
  	<c:forEach var="butt" items="${playButtons}">
    playButtons.push(${butt});                                  
	</c:forEach>
  	var row = table.getElementsByTagName("tr")[1];
  	var col1 = row.getElementsByTagName("td")[0];
  	var btn1 = col1.getElementsByTagName("button")[0];
  	var btn2 = col1.getElementsByTagName("button")[1];
  	if(playButtons[0]===false){
  		btn1.disabled = true;
  		btn2.disabled = true;
  	}
  	var col2 = row.getElementsByTagName("td")[1];
  	var btn3 = col2.getElementsByTagName("button")[0];
  	var btn4 = col2.getElementsByTagName("button")[1];
  	if(playButtons[1]===false){
  	  	btn3.disabled = true;
  	  	btn4.disabled = true;
  	}
  	var col3 = row.getElementsByTagName("td")[2];
  	var btn5 = col3.getElementsByTagName("button")[0];
  	var btn6 = col3.getElementsByTagName("button")[1];
  	if(playButtons[2]===false){
  	  	btn5.disabled = true;
  	  	btn6.disabled = true;
  	}
}
  	document.getElementById("func").innerHTML = checkButtons();

</script>


</body>
</html>