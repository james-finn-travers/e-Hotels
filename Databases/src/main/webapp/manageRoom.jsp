<%@ page import="com.project.Query" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
    <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        document.getElementById("operation").addEventListener("change", function() {
                            let isDelete = this.value === "delete";
                            let formInputs = document.querySelectorAll("#roomForm input");
                            let formSelects = document.querySelectorAll("#roomForm select");

                            formSelects.forEach(select => {
                                  if (select.id !== "operation") {
                                      select.disabled = isDelete;
                                                      }
                              });


                            formInputs.forEach(input => {
                                if (input.id !== "hotelAddr" && input.id !== "roomNum") {
                                                        input.disabled = isDelete;
                                                    }
                            });
                        });
                    });
                </script>
</head>
<body>
       <h1>Room Management System</h1>
          <form id="roomForm" method="post">
              <label for="hotelAddr">Hotel Address:</label>
              <input type="text" id="hotelAddr" name="hotelAddr" required maxlength="20">
              <br><br>

              <label for="roomNum">Room Number:</label>
              <input type="number" id="roomNum" name="roomNum" required min="1">
              <br><br>

              <label for="price">Price:</label>
              <input type="number" id="price" name="price" min="0" step="0.01">
              <br><br>

              <label for="capacity">Capacity:</label>
              <input type="number" id="capacity" name="capacity" min="1">
              <br><br>

              <label for="view">View:</label>
              <select id="view" name="view">
                  <option value="Mountain">Mountain</option>
                  <option value="Sea">Sea</option>
                  <option value="None">None</option>
              </select>
              <br><br>

              <label for="extendable">Extendable:</label>
              <select id="extendable" name="extendable">
                  <option value="true">Yes</option>
                  <option value="false">No</option>
              </select>
              <br><br>

              <label for="operation">Select Operation:</label>
              <select id="operation" name="operation">
                  <option value="insert">Insert New Room</option>
                  <option value="update">Update Existing Room</option>
                  <option value="delete">Delete Room</option>
              </select>
              <br><br>

              <button type="submit" id="submitButton">Register Room</button>
          </form>


                 <%
                  if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submitButton") != null) {
                                String hotelAddr = request.getParameter("hotelAddr");
                                String roomNum = request.getParameter("roomNum");
                                String price = request.getParameter("price");
                                String capacity = request.getParameter("capacity");
                                String view = request.getParameter("view");
                                String extendable = request.getParameter("extendable");
                                String operation = request.getParameter("operation");

                                if(operation.equals("insert")){
                                    boolean flag1 = Query.roomInsert(hotelAddr,roomNum,price,capacity,view, extendable);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Room Registered</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Room Registration failed</p>
                                                           <%
                                                           }
                                }
                                else if(operation.equals("delete")){
                                    boolean flag1 = Query.roomDelete(hotelAddr, roomNum);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Room Deleted</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Room Deletion failed</p>
                                                           <%
                                                           }
                                }
                                else if (operation.equals("update")){
                                     boolean flag1 = Query.roomUpdate(hotelAddr,roomNum,price,capacity,view, extendable);
                                     if(flag1){
                                                            %>
                                                            <p> Success! Room Info Updated </p>
                                                            <%
                                                            }
                                                            else {
                                                            %>
                                                              <p> Error! Room Update failed</p>
                                                            <%
                                                            }
                                }
                  }
                 %>
    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->

</body>
</html>
