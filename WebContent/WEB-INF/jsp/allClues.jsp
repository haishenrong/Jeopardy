<%@page contentType="text/html;charset = UTF-8" language="java"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>



<head>
<title>Jeopardy</title>
</head>


<body>
	<h2>List of All Clues</h2>
	<form:form method="GET" action="/Jeopardy/clue">

		<table>
			<tr>
				<td>Master List:</td>
				<td>${masterList}</td>
			</tr>
		</table>
		<tr>
			<td colspan="2">
			<input type="submit" class="button" name="main" value="back" />
			</td>
		</tr>
		
	</form:form>

	
</body>

</html>