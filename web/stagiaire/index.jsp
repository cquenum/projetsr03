<%-- 
    Document   : index
    Created on : 20 avr. 2019, 15:10:03
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Parcours</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="navbar.jsp" %>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Bienvenu.e ${sessionScope.utilisateur.prenom } !</h2>
                <a href="<%= request.getContextPath()%>/stagiaire/creer_parcours.jsp">Commencer un nouveau parcours</a>
                
            </div>
        </div>
    </body>
</html>
