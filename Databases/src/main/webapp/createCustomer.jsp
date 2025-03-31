<%@ page import="com.project.Query" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Form</title>
</head>
<body>
<h2> No Customer Found </h2>
<h3> Register New Customer </h3>

    <form method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br><br>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required><br><br>

        <label for="middleName">Middle Name:</label>
        <input type="text" id="middleName" name="middleName"><br><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>

        <label for="idType">ID Type:</label>
        <input type="text" id="idType" name="idType" required><br><br>

        <button name="submit"type="submit">Submit</button>
    </form>

    <%

       if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("submit") != null) {
               String ID = request.getParameter("id");
               String firstName = request.getParameter("firstName");
               String middleName = request.getParameter("middleName");
               String lastName = request.getParameter("lastName");
               String address = request.getParameter("address");
               String idType = request.getParameter("idType");

               boolean flag = Query.createCustomer(ID, firstName, middleName, lastName, address,idType);
                   if(flag){
                       %>
                       <p> Success! Customer Registered</p>
                       <%
                       }
                       else {
                       %>
                         <p> Error! Customer Registration failed</p>
                       <%
                       }

}
    %>
</body>
</html>