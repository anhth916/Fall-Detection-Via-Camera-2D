<%-- 
    Document   : playvideo
    Created on : Apr 18, 2021, 12:03:22 AM
    Author     : dylan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String path = (String) request.getAttribute("path");
        %>
    </head>
    <body>
        <h3><%=path%></h3>
        <video width="1080" controls>
            <source src="DataOut/<%=path%>" type="video/mp4">
            <source src="mov_bbb.ogg" type="video/ogg">
            Your browser does not support HTML video.
        </video>
    </body>
</html>
