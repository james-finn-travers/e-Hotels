<%@ page import="com.project.Query" %>
<%@ page import="com.project.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Rooms</title>
</head>
<body>
    <form method="post">
        <label for="startDate" >Start Date:</label>
        <input type="date" id="startDate" name="startDate" required>

        <br><br>

        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required>

        <br><br>

        <label for="numberPicker">Select a number (1-5):</label>
        <select id="numberPicker" name="numberPicker">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>

        <br><br>

        <label for="textInput">Area:</label>
        <input type="text" id="textInput" name="textInput">

        <br><br>

        <label for="dollarAmount">Enter a dollar amount:</label>
        <input type="number" id="dollarAmount" name="dollarAmount" step="0.01" min="0">

        <br><br>

        <label for="capacity">Enter capacity:</label>
        <input type="number" id="capacity" name="capacity" step="1" min="0">

        <br><br>

        <label for="totalRooms">Enter total number of rooms:</label>
        <input type="number" id="totalRooms" name="totalRooms" step="1" min="0">
                <br><br>

        <label for="hotelChain">Hotel Chain ID:</label>
        <input type="number" id="hotelChain" name="hotelChain" step="1" min="1">

        <br><br>

        <button type="submit" name="submit">Submit</button>
    </form>

    <br>

<%
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String selectedNumber = request.getParameter("numberPicker");
        String enteredText = request.getParameter("textInput");
        String dollarAmount = request.getParameter("dollarAmount");
        String capacity = request.getParameter("capacity");
        String totalRooms = request.getParameter("totalRooms");
        String hotelChainID = request.getParameter("hotelChain");


        boolean isValid = true;
        String errorMessage = "";

        try {
            java.time.LocalDate startDate = java.time.LocalDate.parse(startDateStr);
            java.time.LocalDate endDate = java.time.LocalDate.parse(endDateStr);

            if (startDate.isAfter(endDate)) {
                isValid = false;
                errorMessage = "Error: Start Date must be before End Date.";
            }
        } catch (Exception e) {
            isValid = false;
            errorMessage = "Invalid date format.";
        }
%>

    <% if (!isValid) { %>
        <p style="color: red;"><strong><%= errorMessage %></strong></p>
    <% } else { %>
        <h2>Submitted Values:</h2>
        <p><strong>Start Date:</strong> <%= startDateStr %></p>
        <p><strong>End Date:</strong> <%= endDateStr %></p>
        <p><strong>Selected Number:</strong> <%= selectedNumber %></p>
        <p><strong>Entered Text:</strong> <%= enteredText %></p>
        <p><strong>Dollar Amount:</strong> $<%= dollarAmount %></p>
        <p><strong>Capacity:</strong> <%= capacity %></p>
        <p><strong>Total Number of Rooms:</strong> <%= totalRooms %></p>
    <% Query q = new Query();
        List<Room> rs = q.searchAvailableRooms(startDateStr, endDateStr, selectedNumber, enteredText, dollarAmount, capacity, totalRooms, hotelChainID);
                if (!rs.isEmpty()) { %>
                    <h2>Available Rooms:</h2>
                    <table border="1">
                        <tr>
                            <th>Hotel Address</th>
                            <th>Room Number</th>
                            <th>Price</th>
                            <th>Capacity</th>
                            <th>View</th>
                            <th>Extendable</th>
                        </tr>
                        <% for (Room room : rs) { %>
                            <%= room.toString(startDateStr, endDateStr) %>
                        <% } %>
                    </table>
                <% } else { %>
                    <p>No available rooms found.</p>
                <% }
        } %>

<% } %>

</body>
</html>
