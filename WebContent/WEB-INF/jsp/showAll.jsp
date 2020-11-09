<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP List Clues Records</title>
</head>

<body>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />


<sql:query var="listClues" dataSource="${myDS}">
        SELECT * FROM CLUE;
    </sql:query>

    
        <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of clues</h2></caption>
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Prompt</th>
                <th>Response</th>
                <th>Difficulty</th>
            </tr>
            <c:forEach var="clue" items="${listClues.rows}">
                <tr>
                    <td><c:out value="${clue.id}" /></td>
                    <td><c:out value="${clue.category}" /></td>
                    <td><c:out value="${clue.prompt}" /></td>
                    <td><c:out value="${clue.response}" /></td>
                    <td><c:out value="${clue.difficulty}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <form:form method="GET" action="/Jeopardy/clue">
    <tr>
			<td colspan="2">
			<input type="submit" class="button" name="main" value="back" />
			</td>
	</tr>
	</form:form>
    </body>
</html>