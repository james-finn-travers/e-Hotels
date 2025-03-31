<%@ page import="com.project.Query" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
</head>
<body>
      <h1>Hotel Management System</h1>
          <form id="hotelForm">
              <label for="hotelAddr">Hotel Address:</label>
              <input type="text" id="hotelAddr" name="hotelAddr" required maxlength="20">
              <div id="hotelAddrError" class="error">Hotel Address is required (max 20 characters)</div>
              <br><br>

              <label for="numRooms">Number of Rooms:</label>
              <input type="number" id="numRooms" name="numRooms" required min="1">
              <div id="numRoomsError" class="error">Number of rooms must be a positive number</div>
              <br><br>

              <label for="city">City:</label>
              <input type="text" id="city" name="city" required maxlength="20">
              <div id="cityError" class="error">City is required (max 20 characters)</div>
              <br><br>

              <label for="starRating">Star Rating:</label>
              <input type="number" id="starRating" name="starRating" required min="0" max="5">
              <div id="starRatingError" class="error">Star rating must be between 0 and 5</div>
              <br><br>

              <label for="hotelChainID">Hotel Chain ID:</label>
              <input type="number" id="hotelChainID" name="hotelChainID" required min="1">
              <br><br>

              <label for="operation">Select Operation:</label>
              <select id="operation" name="operation" onchange="updateFormForOperation()">
                  <option value="insert">Insert New Hotel</option>
                  <option value="update">Update Existing Hotel</option>
                  <option value="delete">Delete Hotel</option>
              </select>
              <br><br>

              <button type="submit" id="submitButton">Register Hotel</button>
          </form>


                 <%
                  if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submitButton") != null) {
                                String hotelAddr = request.getParameter("hotelAddr");
                                String numRooms = request.getParameter("numRooms");
                                String city = request.getParameter("city");
                                String starRating = request.getParameter("starRating");
                                String hotelChainID = request.getParameter("hotelChainID");
                                String operation = request.getParameter("operation");

                                if(operation.equals("insert")){
                                    boolean flag1 = Query.hotelInsert(hotelAddr,numRooms,city,starRating,hotelChainID);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Hotel Registered</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Hotel Registration failed</p>
                                                           <%
                                                           }
                                }
                                else if(operation.equals("delete")){
                                    boolean flag1 = Query.hotelDelete(hotelChainID);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Hotel Deleted</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Hotel Deletion failed</p>
                                                           <%
                                                           }
                                }
                                else if if(operation.equals("update")){
                                     boolean flag1 = Query.hotelInsert(hotelAddr,numRooms,city,starRating,hotelChainID);
                                     if(flag1){
                                                            %>
                                                            <p> Success! Hotel Info Updated </p>
                                                            <%
                                                            }
                                                            else {
                                                            %>
                                                              <p> Error! Hotel Update failed</p>
                                                            <%
                                                            }
                                }
                 %>

</body>
</html>
