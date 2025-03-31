<%@ page import="com.project.Query" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
</head>
<body>
       <h1>Customer Management System</h1>
           <form id="customerForm">
               <label for="id">Customer ID:</label>
               <input type="text" id="id" name="id" required maxlength="20">
               <br><br>

               <label for="firstName">First Name:</label>
               <input type="text" id="firstName" name="firstName" required maxlength="20">
               <br><br>

               <label for="middleName">Middle Name:</label>
               <input type="text" id="middleName" name="middleName" required maxlength="20">
               <br><br>

               <label for="lastName">Last Name:</label>
               <input type="text" id="lastName" name="lastName" required maxlength="20">
               <br><br>

               <label for="address">Address:</label>
               <input type="text" id="address" name="address" required maxlength="20">
               <br><br>

               <label for="idType">ID Type:</label>
               <input type="text" id="idType" name="idType" required maxlength="20">
               <br><br>

               <br><br>

               <label for="operation">Select Operation:</label>
               <select id="operation" name="operation">
                   <option value="insert">Insert New Customer</option>
                   <option value="update">Update Existing Customer</option>
                   <option value="delete">Delete Customer</option>
               </select>
               <br><br>

               <button type="submit" id="submitButton">Register Customer</button>
           </form>


                 <%
                  if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submitButton") != null) {
                                String id = request.getParameter("id");
                                String firstName = request.getParameter("firstName");
                                String middleName = request.getParameter("middleName");
                                String lastName = request.getParameter("lastName");
                                String address = request.getParameter("address");
                                String idType = request.getParameter("idType");
                                String operation = request.getParameter("operation");

                                if(operation.equals("delete")){
                                    boolean flag1 = Query.customerDelete(hotelAddr, roomNum);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Customer Deleted</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Customer Deletion failed</p>
                                                           <%
                                                           }
                                }
                                else if if(operation.equals("update")){
                                     boolean flag1 = Query.customerUpdate(hotelAddr,roomNum,price,capacity,view, extendable);
                                     if(flag1){
                                                            %>
                                                            <p> Success! Customer Info Updated </p>
                                                            <%
                                                            }
                                                            else {
                                                            %>
                                                              <p> Error! Customer Update failed</p>
                                                            <%
                                                            }
                                }
                 %>

</body>
</html>
