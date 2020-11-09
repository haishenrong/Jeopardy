<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<html>
   <head>
      <title>Jeopardy</title>
   </head>

   <body>
      <h2>Clue Loading</h2>
      <form:form method = "POST" action = "/Jeopardy/load">
            <ul>
    			<li><label>Load String:</label> <input type='text' name='clueString' /></li>
            </ul>
            <tr>
               <td colspan = "2">
                  <input type = "submit" class = "button" name = "loadClues" value="Load Clues" />
                  <input type = "submit" class = "button" name = "main" value="Back" />
               </td>
            </tr>
            
          
         
      </form:form>
   </body>
   
</html>