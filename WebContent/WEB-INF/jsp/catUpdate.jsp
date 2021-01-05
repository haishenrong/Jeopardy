<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
   <head>
      <title>Jeopardy</title>
      <style>
      	input[type = submit] {
 		text-align:center;
 		width: 250px; 
 		height: 75px
		}
		input[type = text] {
 		width: 250px; 
 		height: 75px
		}
      </style>
   </head>

   <body>
   <sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/TEST" user="root" password="" />
	<sql:query var="listCategory" dataSource="${myDS}">
        SELECT * FROM CLUE WHERE CATEGORY = '${cat}';
    </sql:query>

      <h2>Modify Category</h2>
      <form:form method = "POST" action = "/Jeopardy/addClue">
         <table>
         	<tr>
         	   		<th>
         	  		<p>Category:</p>
  					<textarea id="category" name="category" rows = "5" cols = "30">${listCategory.rows[0].category}</textarea>
  					</th>
  					<th>
         	  		<input type="hidden" id="iD" name="iD" value="${listCategory.rows[0].id}">
  					</th>
         	</tr>
         	<tr>
         			<th>
         	  		<p>First Prompt:</p>
  					<textarea id="prompt1" name="prompt1" rows = "5" cols = "30">${listCategory.rows[0].prompt}</textarea>
  					</th>
  					<th>
  					<p>First Response: </p>
            		<textarea id="response1" name="response1"  rows = "5" cols = "30">${listCategory.rows[0].response}</textarea>
            		</th>
            </tr>    	
            <tr>
                	<th>
         	  		<p>Second Prompt:</p>
  					<textarea id="prompt2" name="prompt2" rows = "5" cols = "30">${listCategory.rows[1].prompt}</textarea>
  					</th>
  					<th>
  					<p>Second Response: </p>
            		<textarea id="response2" name="response2"  rows = "5" cols = "30">${listCategory.rows[1].response}</textarea>
            		</th>
            </tr>    	
            <tr>
                	<th>
         	  		<p>Third Prompt:</p>
  					<textarea id="prompt3" name="prompt3" rows = "5" cols = "30">${listCategory.rows[2].prompt}</textarea>
  					</th>
  					<th>
  					<p>Third Response: </p>
            		<textarea id="response3" name="response3"  rows = "5" cols = "30">${listCategory.rows[2].response}</textarea>
            		</th>
            </tr>    	
            <tr>
         			<th>
         	  		<p>Fourth Prompt:</p>
  					<textarea id="prompt4" name="prompt4" rows = "5" cols = "30">${listCategory.rows[3].prompt}</textarea>
  					</th>
  					<th>
  					<p>Fourth Response: </p>
            		<textarea id="response4" name="response4"  rows = "5" cols = "30">${listCategory.rows[3].response}</textarea>
            		</th>
            </tr>    	
            <tr>
                	         			<th>
         	  		<p>Fifth Prompt:</p>
  					<textarea id="prompt5" name="prompt5" rows = "5" cols = "30">${listCategory.rows[4].prompt}</textarea>
  					</th>
  					<th>
  					<p>Fifth Response: </p>
            		<textarea id="response5" name="response5"  rows = "5" cols = "30">${listCategory.rows[4].response}</textarea>
            		</th>
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