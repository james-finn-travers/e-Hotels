<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Views</title>
</head>
<body>
    <%
        String SIN = request.getParameter("SIN");

        if (SIN != null) {

         %>
         <p> <%= SIN %> </p>
             <%
        } else {
          %>
                 <p> failed> </p>
                     <%
        }
    %>
</body>
</html>
