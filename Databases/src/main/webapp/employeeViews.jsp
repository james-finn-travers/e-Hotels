<%@ page import="com.project.Query" %>
<%@ page import="com.project.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Options</title>
</head>
<body>

<% String SIN = null;
if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("SIN")!=null) {
    SIN = request.getParameter("SIN");
}
%>
   <form action="" method="POST">
           <label for="views">Select Page:</label>
           <select id="views" name="views" required>
               <option value="Renting">Renting</option>
               <option value="Booking to Renting"> Booking to Renting</option>
               <option value="Payment">Payment</option>
               <option value="Customers">Manage Customers</option>
               <option value="Rooms">Manage Rooms</option>
               <option value="Hotels">Manage Hotels</option>
               <option value="Employees">Manage Employees</option>




           </select>

           <input type="hidden" id="SIN" name="SIN" value="<%= SIN %>">

           <br><br>
           <button type="submit">Submit</button>
   </form>

<% if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("views")!=null) {
     String views = request.getParameter("views");

      if ("Renting".equals(views)) {
                 response.sendRedirect("renting.jsp?SIN="+SIN);
             } else if ("Booking to Renting".equals(views)) {
                 response.sendRedirect("bookingToRenting.jsp?SIN="+SIN);
             }
             else if ("Payment".equals(views)){
                 response.sendRedirect("payment.jsp?SIN="+SIN);
             }
             else if ("Customers".equals(views)){
                              response.sendRedirect("manageCustomer.jsp?SIN="+SIN);
             }
             else if ("Rooms".equals(views)){
                  response.sendRedirect("manageRoom.jsp?SIN="+SIN);
             }
             else if ("Hotels".equals(views)){
                  response.sendRedirect("manageHotel.jsp?SIN="+SIN);
             }
             else if ("Employees".equals(views)){
                  response.sendRedirect("manageEmployee.jsp?SIN="+SIN);
             }
             else {
                 response.sendRedirect("index.jsp"); // Default redirection
      }

}
%>

    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->


</body>
</html>
