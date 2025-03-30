<%@ page import="com.project.Query" %>
<%@ page import="com.project.Renting" %>
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
        <br> <br>
        <label for="moneyInput">Enter an amount:</label>
        <input type="number" id="moneyInput" name="moneyInput" step="0.01" min="0" required>
        <button name="submit" type="submit">Submit</button>
    </form>


    <br>

<%
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
        String custID = request.getParameter("custID");
        String payment = String.valueOf(request.getParameter("moneyInput"));
        %>
        <p> <%=custID %> </p>
         <p><%=payment %> </p>
        <%

        ArrayList<Renting> rs = Query.getCustomerRenting(custID);

                if (!rs.isEmpty()) { %>
                    <h2>Rooms Renting:</h2>
                    <table border="1">
                        <tr>
                            <th>Hotel Address</th>
                            <th>Room Number</th>
                            <th>Check In Date</th>
                            <th>Customer ID</th>
                            <th>Check Out Date</th>
                            <th>Duration</th>
                            <th>Balance</th>
                        </tr>
                        <% for (Renting rent : rs) { %>
                            <%= rent.toString(payment) %>
                        <% } %>
                    </table>
                <% } else { %>
                    <p>No Rentings found.</p>
                <% }
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("pay") != null && request.getParameter("payment") != null) {

        String hotelAddr = request.getParameter("hotelAddr");
        String roomNum = request.getParameter("roomNum");
        String checkInDate = request.getParameter("checkInDate");
        String customerID = request.getParameter("custID");
        String checkOutDate = request.getParameter("checkOutDate");
        String duration = request.getParameter("duration");
        String balance = request.getParameter("balance");
        String money = request.getParameter("payment");

        boolean flag = Query.makePayment(hotelAddr, roomNum, checkInDate, customerID, money);

        if(flag){
        %>
        <p> Success! Payment completed</p>
        <%
        }
        else {
        %>
          <p> Error! Payment failed</p>
        <%
        }

    }
%>

    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->


</body>
</html>
