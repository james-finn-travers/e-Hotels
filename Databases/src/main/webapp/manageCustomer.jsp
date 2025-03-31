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
                             if (input.id !== "id") {
                                 input.disabled = isDelete;
                             }
                         });
                     });
                 });
             </script>
    </head>
    <body>
        <h1> Customer Form</h1>
        <form id="employeeForm">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id">
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

            <label for="idType">Role:</label>
            <input type="text" id="idType" name="idType" required maxlength="20">
            <br><br>



            <label for="operation">Select Operation:</label>
            <select id="operation" name="operation">
                <option value="update">Update Existing Employee</option>
                <option value="delete">Delete Employee</option>
            </select>
            <br><br>

            <button name ="submitButton" type="submit">Submit</button>


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
                                    boolean flag1 = Query.customerDelete(id);
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
                                else if(operation.equals("update")){
                                     boolean flag1 = Query.customerUpdate(id,firstName,middleName,lastName,address,idType);
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

                  }
                 %>

                     <a href="index.jsp">Go Back</a> <!-- Adjust this if your main page has a different name -->


</body>
</html>
