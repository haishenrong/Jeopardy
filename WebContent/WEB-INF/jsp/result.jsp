<%@page contentType="text/html;charset = UTF-8" language="java"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>



<head>
<title>Jeopardy</title>
</head>


<body>
	<h2>Submitted Clue Information</h2>
	<form:form method="GET" action="/Jeopardy/clue">

		<table>
			<tr>
				<td>Verdict:</td>
				<td>${verdict}</td>
			</tr>
			<tr>
				<td>Category</td>
				<td>${category}</td>
			</tr>
			<tr>
				<td>Prompt</td>
				<td>${prompt}</td>
			</tr>
			<tr>
				<td>Response</td>
				<td>${response}</td>
			</tr>
			<tr>
				<td>Difficulty</td>
				<td>${difficulty}</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>${id}</td>
			</tr>
		</table>
		<tr>
			<td colspan="2">
			<input type="submit" class="button" name="return" value="return" />
			<input type="submit" class="button" name="replace" value="replace"/>
			</td>
		</tr>
		
	</form:form>

	
</body>

</html>