<%-- 
    Document   : ajout_competence
    Created on : 22 avr. 2019, 01:32:11
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter une nouvelle Compétence</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouvelle Compétence</h1>
            <p>Veuillez remplir le formulaire pour créer une nouvelle compétence</p>
            <form action="<%= request.getContextPath() %>/admin/competences" method="POST">
                <div class="container">
                    <label for="sujet"><b>Compétence</b>
                        <input type="text" placeholder="Sujet" name="sujet" required>
                    </label>
                    
                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>
