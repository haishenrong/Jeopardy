<%@page contentType="text/html;charset = UTF-8" language="java"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>
<meta charset="ISO-8859-1">
<title>Jeopardy Main</title>
</head>
<body>
	<h2>Select option</h2>
	<form:form method="GET" action="/Jeopardy/start">

		<tr>
			<td colspan="2">
			<input type="submit" class="button" name="return" value="Insert new set" />
			<input type="submit" class="button" name="showAll" value="Show all clues"/>
			<input type="submit" class="button" name="randStart" value="Start a random game"/>
			<input type="submit" class="button" name="loadClues" value="Load Clues"/>
			</td>
		</tr>
		
	</form:form>

</body>
</html>

