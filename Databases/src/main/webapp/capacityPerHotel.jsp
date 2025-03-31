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
    <label for="hotel">Hotel:</label>
    <input type="text" id="hotel" name="hotel">
    <button name='submit' type ='submit'> Submit </button>
 </form>

   <%

   if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {

        ArrayList<String> rs = Query.getHotelCap(request.getParameter("hotel"));
                   if (!rs.isEmpty()) { %>
                       <h2> Total Capacity Per Hotel: </h2>
                       <table border="1">
                           <tr>
                               <th>Hotel Address</th>
                               <th>Total Capacity</th>
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
       ArrayList<String> rs = Query.getHotelCap();
                   if (!rs.isEmpty()) { %>
                       <h2> Total Capacity Per Hotel: </h2>
                       <table border="1">
                           <tr>
                               <th>Hotel Address</th>
                               <th>Total Capacity</th>
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
