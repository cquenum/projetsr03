<%-- 
    Document   : ajout_utilisateur
    Created on : 22 avr. 2019, 01:30:15
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter un nouveau Utilisateur</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouvel Utilisateur</h1>
            <p>Veuillez remplir le formulaire pour créer un nouvel utilisateur</p>
            <form action="<%= request.getContextPath() %>/admin/utilisateurs" method="POST">
                <div class="container">
                    <label for="prenom"><b>Prénom</b>
                        <input type="text" placeholder="Prenom" name="prenom" required title="Entrez le prénom de l'utilisateur">
                    </label>
                    <label for="nom"><b>Nom</b>
                        <input type="text" placeholder="Nom" name="nom" required title="Entrez le nom de l'utilisateur">
                    </label>
                    <label for="email"><b>Email</b>
                        <input type="email" placeholder="email@exemple.com" name="email" required title="Entrez une adresse email valide">
                    </label>
                    <label for="pwd"><b>Mot de passe</b>
                        <input type="password" placeholder="Mot de passe" name="pwd" required pattern=".{6,}" title="Six caractères pu plus">
                    </label>

                    <label for="telephone"><b>Téléphone</b>
                        <input type="tel" placeholder="Téléphone" name="telephone" required pattern="(?:(?:\+|00)33|0)\s*?[1-9](?:[\s.-]*?\d{2}){4}">
                    </label>

                    <label>
                        <input type="radio" checked="checked" name="role" value="stagiaire" style="margin-bottom:15px"> <b>Stagiaire</b>
                    </label>
                    <br/>
                    <label>
                        <input type="radio" name="role" value="administrateur" style="margin-bottom:15px"> <b>Administrateur</b>
                    </label>
                    <br/>
                    <label>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                    </label>

                    <div class="clearfix">
                        <input type="reset" class="cancelbtn" value="Effacer">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>
