<%-- 
    Document   : logout
    Created on : 16-abr-2020, 11:51:52
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            request.getSession().invalidate();
            out.print("<script>location.replace('index.jsp');</script>");
        %>
    </body>
</html>
