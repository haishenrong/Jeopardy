<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
   <head>
      <title>Jeopardy</title>
   </head>

   <body>
      <h2>Clue Information</h2>
      <form:form method = "POST" action = "/Jeopardy/addClue">
         <table>
         	<tr>
         	   <th>Prompts</th>
         	   <th>Responses</th>
         	</tr>
            <tr>
               <td><form:input path = "prompt1" /></td>
               <td><form:input path = "response1" /></td>
            </tr>
            
            <tr>
               <td><form:input path = "prompt2"/></td>
               <td><form:input path = "response2" /></td>
            </tr>
            <tr>
               <td><form:input path = "prompt3"/></td>
               <td><form:input path = "response3" /></td>
            </tr>
            <tr>
               <td><form:input path = "prompt4"/></td>
               <td><form:input path = "response4" /></td>
            </tr>         
            <tr>
               <td><form:input path = "prompt5"/></td>
               <td><form:input path = "response5" /></td>
            </tr>
            <tr></tr>
            <tr>
               <td><form:label path = "category">Category</form:label></td>
               <td><form:input path = "category" /></td>
            </tr>
            <tr>
               <td colspan = "2">
                  <input type = "submit" class = "button" value = "Submit"/>
                  <input type = "submit" class = "button" name = "main" value="Back" />
               </td>
            </tr>
            
         </table> 
          
         
      </form:form>
   </body>
   
</html>