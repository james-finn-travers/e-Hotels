<%@ page import="com.project.Query" %>
<%@ page import="com.project.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Hotels</title>
</head>
<body>
   <form action="" method="POST">
           <label for="userType">Select User Type:</label>
           <select id="userType" name="userType" required>
               <option value="Customer">Customer</option>
               <option value="Employee">Employee</option>
           </select>
           <br><br>
           <button name="submit" type="submit">Submit</button>
   </form>

   <form action="" method="POST">
      <button type="submit" name = "area">Rooms Per Area</button>
      <br><br>
      <button type="submit" name = "cap">Capacity Per Hotel</button>
   </form>

<% if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("userType")!=null && request.getParameter("submit")!= null) {
     String userType = request.getParameter("userType");

      if ("Customer".equals(userType)) {
                 response.sendRedirect("customer.jsp");
             } else if ("Employee".equals(userType)) {
                 response.sendRedirect("employee.jsp");
             } else {
                 response.sendRedirect("index.jsp"); // Default redirection
      }



}


if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("area")!=null) {

     response.sendRedirect("roomsPerArea.jsp");




}




if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("cap")!=null) {
                            response.sendRedirect("capacityPerHotel.jsp");

}


%>

</body>
</html>
