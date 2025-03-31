<%@ page import="com.project.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Capacities</title>
</head>
<body>
 <form method = "post">
    <label for="area">Area:</label>
    <input type="text" id="area" name="area">
    <button name='submit' type ='submit'> Submit </button>
 </form>

   <%

   if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
        ArrayList<String> rs = Query.roomsPerArea(request.getParameter("area"));
                   if (!rs.isEmpty()) { %>
                       <h2> Rooms Per Area: </h2>
                       <table border="1">
                           <tr>
                               <th>Area</th>
                               <th>Rooms</th>
                           </tr>
                           <% for (String string : rs) { %>
                               <%= string %>
                           <% } %>
                       </table>
                   <% } else { %>
                       <p>No results found</p>
                   <% }
   }
   else {
       ArrayList<String> rs = Query.roomsPerArea();
                   if (!rs.isEmpty()) { %>
                       <h2> Rooms Per Area: </h2>
                       <table border="1">
                           <tr>
                               <th>Area</th>
                               <th>Rooms</th>
                           </tr>
                           <% for (String string : rs) { %>
                               <%= string %>
                           <% } %>
                       </table>
                   <% } else { %>
                       <p>No results found</p>
                   <% }
   }

   %>
       <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->

</body>
</html>
