<%@ page import="com.project.Query" %>
<%@ page import="com.project.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Sign-in</title>
</head>
<body>

   <%
      if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("SIN") != null) {
          String SIN = request.getParameter("SIN");
   %>

      <% if(Query.empExists(SIN)) { %>
          <form method="post" action="employeeViews.jsp">
              <input type="hidden" id="SIN" name="SIN" value="<%= SIN %>">
              <button type="submit">Continue</button>
          </form>
      <% } else { %>
          <p>Employee not found. Please try again.</p>
      <% } %>

   <% }
   else {%>

   <form method="post">
         <label for="SIN">Enter a String:</label>
         <input type="text" id="SIN" name="SIN" required>
         <br><br>
         <button type="submit">Submit</button>
     </form>

     <% }%>
       <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->

</body>
</html>
