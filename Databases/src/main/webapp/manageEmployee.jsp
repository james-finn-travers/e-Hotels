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
                    let formInputs = document.querySelectorAll("#employeeForm input");

                    formInputs.forEach(input => {
                        if (input.id !== "sinOrSsn") {
                            input.disabled = isDelete;
                        }
                    });
                });
            });
        </script>
</head>
<body>
      </form><h1>Employee Registration Form</h1>
                 <form id="employeeForm">

                         <label for="sinOrSsn">SIN/SSN:</label>
                         <input type="number" id="sinOrSsn" name="sinOrSsn" required min="100000000" max="999999999">

                            <br>                            <br>


                         <label for="firstName">First Name:</label>
                         <input type="text" id="firstName" name="firstName" required maxlength="20">

                            <br>                            <br>


                         <label for="middleName">Middle Name:</label>
                         <input type="text" id="middleName" name="middleName" required maxlength="20">
                            <br>                            <br>

                         <label for="lastName">Last Name:</label>
                         <input type="text" id="lastName" name="lastName" required maxlength="20">
                            <br>                            <br>

                         <label for="address">Address:</label>
                         <input type="text" id="address" name="address" required maxlength="20">
                            <br>                            <br>

                         <label for="role">Role:</label>
                         <input type="text" id="role" name="role" required maxlength="20">
                            <br>                            <br>

                         <label for="hotelAddr">Hotel Address:</label>
                         <input type="text" id="hotelAddr" name="hotelAddr" required maxlength="20">
                            <br>                            <br>

                                    <label for="operation">Select Operation:</label>
                                     <select id="operation" name="operation">
                                         <option value="insert">Insert New Employee</option>
                                         <option value="update">Update Existing Employee</option>
                                         <option value="delete">Delete Employee</option>
                                     </select>
                            <br>                            <br>

                     <button type="submit">Register Employee</button>
                 </form>


                 <%
                  if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
                                String sinOrSsn = request.getParameter("sinOrSsn");
                                String firstName = request.getParameter("firstName");
                                String middleName = request.getParameter("middleName");
                                String lastName = request.getParameter("lastName");
                                String role = request.getParameter("role");
                                String hotelAddr = request.getParameter("hotelAddr");
                                String address = request.getParameter("address");
                                String operation = request.getParameter("operation");

                                if(operation.equals("insert")){
                                    boolean flag1 = Query.empInsert(sinOrSsn,firstName,middleName,lastName,address, role,hotelAddr);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Employee Registered</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Employee Registration failed</p>
                                                           <%
                                                           }
                                }
                                else if(operation.equals("delete")){
                                    boolean flag1 = Query.empDelete(sinOrSsn);
                                    if(flag1){
                                                           %>
                                                           <p> Success! Employee Deleted</p>
                                                           <%
                                                           }
                                                           else {
                                                           %>
                                                             <p> Error! Employee Deletion failed</p>
                                                           <%
                                                           }
                                }
                                else if(operation.equals("update")){
                                     boolean flag1 = Query.empUpdate(sinOrSsn,firstName,middleName,lastName,address,role,hotelAddr);
                                     if(flag1){
                                                            %>
                                                            <p> Success! Employee Info Updated </p>
                                                            <%
                                                            }
                                                            else {
                                                            %>
                                                              <p> Error! Employee Update failed</p>
                                                            <%
                                                            }
                                }
                    }
                 %>
    <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->

</body>
</html>
