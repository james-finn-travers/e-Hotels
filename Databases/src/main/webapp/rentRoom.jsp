<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="com.project.Query" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Renting Confirmation</title>
</head>
<body>
    <h2>Renting Confirmation</h2>

    <%
        // Retrieve room details from form submission
        String hotelAddr = request.getParameter("hotelAddr");
        String roomNum = request.getParameter("roomNum");
        String price = request.getParameter("price");
        String cap = request.getParameter("cap");
        String view = request.getParameter("view");
        String extendable = request.getParameter("extendable");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String SIN = request.getParameter("SIN");

        if (hotelAddr != null && roomNum != null) {
    %>
        <p><strong>Hotel Address:</strong> <%= hotelAddr %></p>
        <p><strong>Room Number:</strong> <%= roomNum %></p>
        <p><strong>Price:</strong> $<%= price %></p>
        <p><strong>Capacity:</strong> <%= cap %></p>
        <p><strong>View:</strong> <%= view %></p>
        <p><strong>Extendable:</strong> <%= extendable %></p>
        <p><strong>Check In Date:</strong> <%= checkIn %></p>
        <p><strong>Check Out Date:</strong> <%= checkOut %></p>
         <form method="post">
             <label for="custID">Customer ID:</label>
             <input type="text" id="custID" name="custID">
             <br><br>

             <input type='hidden' name='hotelAddr' value='<%= hotelAddr %>'>
             <input type='hidden' name='roomNum' value='<%= roomNum %>'>
             <input type='hidden' name='price' value='<%= price %>'>
             <input type='hidden' name='cap' value='<%= cap %>'>
             <input type='hidden' name='view' value='<%= view %>'>
             <input type='hidden' name='extendable' value='<%= extendable %>'>
             <input type='hidden' name='checkIn' value='<%= checkIn %>'>
             <input type='hidden' name='checkOut' value='<%= checkOut %>'>
             <input type='hidden' name='SIN' value='<%= SIN %>'>


             <button type="submit" name="submit">Submit</button>
         </form>

         <% if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null && request.getParameter("custID")!=null) {
                String custID = request.getParameter("custID");
                boolean isValid = true;
                Query q = new Query();
         %>
                <p>Hotel Address: <%= hotelAddr %></p>
                <p>Room Number: <%= roomNum %></p>
                <p>Check-In Date: <%= checkIn %></p>
                <p>Customer ID: <%= custID %></p>
                <p>Check-Out Date: <%= checkOut %></p>
         <%
                boolean flag = q.makeRenting(hotelAddr,roomNum,checkIn, custID,checkOut, price, SIN);

                if (flag) {
                    %>
                    <p>Your booking request has been received! We will process it shortly.</p>
                    <%
                }
            }
        } else {
    %>
        <p style="color: red;">Error: Invalid booking request. Please try again.</p>
    <%
        }
    %>

    <br>
    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->
</body>
</html>