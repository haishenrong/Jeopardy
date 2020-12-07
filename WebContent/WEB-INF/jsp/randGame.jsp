<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rand</title>
<style>
input[type = submit] {
 text-align:center
 width: 120;  height: 70;
}
</style>
</head>

<body>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />


<sql:query var="listClue1" dataSource="${myDS}">
        SELECT * FROM CLUE where DIFFICULTY=1 LIMIT 5;
    </sql:query>
<sql:query var="listClue2" dataSource="${myDS}">
        SELECT * FROM CLUE where DIFFICULTY=2 LIMIT 5;
    </sql:query>
<sql:query var="listClue3" dataSource="${myDS}">
        SELECT * FROM CLUE where DIFFICULTY=3 LIMIT 5;
    </sql:query>
<sql:query var="listClue4" dataSource="${myDS}">
        SELECT * FROM CLUE where DIFFICULTY=4 LIMIT 5;
    </sql:query>
<sql:query var="listClue5" dataSource="${myDS}">
        SELECT * FROM CLUE where DIFFICULTY=5 LIMIT 5;
    </sql:query>
<sql:query var="listCategory" dataSource="${myDS}">
        SELECT DISTINCT CATEGORY FROM CLUE LIMIT 5;
    </sql:query>
    
        <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Jeopardy</h2></caption>
            <tr>
            	<c:forEach var="category" items="${listCategory.rows}">
                	<th><c:out value="${category.category}" /></th>
            	</c:forEach>
            </tr>
            <tr>
            	<c:forEach var="clue" items="${listClue1.rows}">
            	<form action="selected" method="GET">
                	<td width="125"  height="75" align = "center">
                	<c:if test= "${!oO[clue.id]}">
                	<button type="submit" style ="width: 200px; height: 75px;" name="clueSelect" value="${clue.id}">${clue.difficulty*400}</button>
                	</c:if>
                	</td>
                </form>
            	</c:forEach>
            </tr>
            <tr>
            	<c:forEach var="clue" items="${listClue2.rows}">
                <form action="selected" method="GET">
                	<td width="125" height="75" align = "center">
                	<c:if test= "${!oO[clue.id]}">
                	<button type="submit" style ="width: 200px; height: 75px;" name="clueSelect" value="${clue.id}">${clue.difficulty*400}</button>
                	</c:if>
                	</td>
                </form>
            	</c:forEach>
            </tr>
            <tr>
            	<c:forEach var="clue" items="${listClue3.rows}">
                <form action="selected" method="GET">
                	<td width="125" height="75" align = "center">
                	<c:if test= "${!oO[clue.id]}">
                	<button type="submit" style ="width: 200px; height: 75px;" name="clueSelect" value="${clue.id}">${clue.difficulty*400}</button>
                	</c:if>
                	</td>
                </form>
            	</c:forEach>
            </tr>
            <tr>
            	<c:forEach var="clue" items="${listClue4.rows}">
                <form action="selected" method="GET">
                	<td width="125" height="75" align = "center">
                	<c:if test= "${!oO[clue.id]}">
                	<button type="submit" style ="width: 200px; height: 75px;" name="clueSelect" value="${clue.id}">${clue.difficulty*400}</button>
                	</c:if>
                	</td>
                </form>
            	</c:forEach>
            </tr>
            <tr>
            	<c:forEach var="clue" items="${listClue5.rows}">
                <form action="selected" method="GET">
                	<td width="125" height="75" align = "center">
                	<c:if test= "${!oO[clue.id]}">
                	<button type="submit" style =" width: 200px; height: 75px;" name="clueSelect" value="${clue.id}">${clue.difficulty*400}</button>
                	</c:if>
                	</td>
                </form>
            	</c:forEach>
            </tr>
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
				
				<td  width = "250" height = "300" align = "center"><p style="font-size:30px; font-family:'Courier New'">${player}</p></td>
				
			</c:forEach>
	</tr>
			
	</table>
    <form:form method="GET" action="/Jeopardy/clue">
    <tr>
			<td colspan="2">
			<input type="submit" class="button" name="main" value="back" />
			</td>
	</tr>
	</form:form>
	</div>
	<script>

	function myFunction(clueId) {
	  var x = disabled.charAt(clueId);
	  print(clueId);
	  if(x==='0')
		  return true;
	  else
		  return false;
	}
	</script>
    </body>
</html>