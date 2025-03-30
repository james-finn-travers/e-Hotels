<%@ page import="com.project.Query" %>
<%@ page import="com.project.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking to Renting</title>
</head>
<body>

    <%
    String SIN = request.getParameter("SIN");
    %>

    <form method="post">
        <label for="custID">Enter Customer ID:</label>
        <input type="text" id="custID" name="custID" required>
        <button name="submit" type="submit">Submit</button>
    </form>


    <br>

<%
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
        String custID = request.getParameter("custID");

        ArrayList<Booking> rs = Query.getCustomerBooking(custID);

                if (!rs.isEmpty()) { %>
                    <h2>Rooms Booked:</h2>
                    <table border="1">
                        <tr>
                            <th>Hotel Address</th>
                            <th>Room Number</th>
                            <th>Check In Date</th>
                            <th>Customer ID</th>
                            <th>Check Out Date</th>
                            <th>Duration</th>
                        </tr>
                        <% for (Booking book : rs) { %>
                            <%= book.toString(SIN) %>
                        <% } %>
                    </table>
                <% } else { %>
                    <p>No Bookings found.</p>
                <% }
    }
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rent") != null) {

        String hotelAddr = request.getParameter("hotelAddr");
        String roomNum = request.getParameter("roomNum");
        String checkInDate = request.getParameter("checkInDate");
        String customerID = request.getParameter("customerID");
        String checkOutDate = request.getParameter("checkOutDate");
        String duration = request.getParameter("duration");
        String balance = request.getParameter("balance");

        boolean flag = Query.bookingToRenting(hotelAddr, roomNum, checkInDate, customerID,checkOutDate, SIN);

        if(flag){
        %>
        <p> Success! Booking changed to Renting </p>
        <%
        }
        else {
        %>
          <p> Error! Booking failed to be changed </p>
        <%
        }

    }
%>

    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->


</body>
</html>
