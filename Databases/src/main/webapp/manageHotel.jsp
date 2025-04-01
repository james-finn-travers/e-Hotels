<%@ page import="com.project.Query" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Hotel</title>
    <script>
                document.addEventListener("DOMContentLoaded", function() {
                    document.getElementById("operation").addEventListener("change", function() {
                        let isDelete = this.value === "delete";
                        let formInputs = document.querySelectorAll("#hotelForm input");

                        formInputs.forEach(input => {
                            if (input.id !== "hotelAddr") {
                                input.disabled = isDelete;
                            }
                        });
                    });
                });
            </script>
</head>
<body>
      <h1>Hotel Management System</h1>
          <form id="hotelForm" method="post">
              <label for="hotelAddr">Hotel Address:</label>
              <input type="text" id="hotelAddr" name="hotelAddr" required maxlength="20">
              <br><br>

              <label for="city">City:</label>
              <input type="text" id="city" name="city"  maxlength="20">
              <br><br>

              <label for="starRating">Star Rating:</label>
              <input type="number" id="starRating" name="starRating"  min="1" max="5">
              <br><br>

              <label for="hotelChainID">Hotel Chain ID:</label>
              <input type="number" id="hotelChainID" name="hotelChainID"  min="1">
              <br><br>

              <label for="operation">Select Operation:</label>
              <select id="operation" name="operation">
                  <option value="insert">Insert New Hotel</option>
                  <option value="update">Update Existing Hotel</option>
                  <option value="delete">Delete Hotel</option>
              </select>
              <br><br>

              <button type="submit" id="submitButton" name = "submitButton">submit</button>
          </form>


                 <%
                  if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submitButton") != null) {
                                String hotelAddr = request.getParameter("hotelAddr");
                                String city = request.getParameter("city");
                                String starRating = request.getParameter("starRating");
                                String hotelChainID = request.getParameter("hotelChainID");
                                String operation = request.getParameter("operation");

                                if(operation.equals("insert")){
                                    boolean flag1 = Query.hotelInsert(hotelAddr,city,starRating,hotelChainID);
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
                                    boolean flag1 = Query.hotelDelete(hotelAddr);
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
                                else if(operation.equals("update")){
                                     boolean flag1 = Query.hotelUpdate(hotelAddr,city,starRating,hotelChainID);
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
                  }
                 %>
    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->

</body>
</html>
