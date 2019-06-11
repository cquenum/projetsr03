<%-- 
    Document   : stagiaire.jsp
    Created on : 19 avr. 2019, 23:52:23
    Author     : cquenum
--%>

<%@page import="com.mutamba.model.Parcours"%>
<%@page import="com.mutamba.dao.ParcoursDao"%>
<%@page import="java.util.Hashtable"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Erreur</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Erreur !</h2>
                <h3><%=errorMessage%></h3>
                <br/>
            </div>
        </div>
    </body>
</html>
