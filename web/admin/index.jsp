<%-- 
    Document   : index
    Created on : 22 avr. 2019, 01:38:33
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Evaluation des stagiaires</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Bienvenu.e ${sessionScope.utilisateur.prenom } !</h2>
                <h3>Fonctionnalités de l'application :</h3>
                <p>Gestion des utilisateurs </p>
                <p>Gestion des questionnaires</p>
                <p>Gestion des résultats</p>
                <p>Evaluation des compétences.</p>
            </div>
        </div>
    </body>
</html>
