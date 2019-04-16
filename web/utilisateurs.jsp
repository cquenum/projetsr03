<%-- 
    Document   : utilisateurs
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mutamba.model.Utilisateur"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Utilisateurs</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div>
            <div>
                <ul>
                    <li><a class="active" href="/Projet_SR03/index.html">Accueil</a></li>
                    <li><a href="/Projet_SR03/ajout_utilisateur.html">Ajouter un Utilisateur</a></li>
                    <li><a href="/Projet_SR03/ajout_competence.html">Ajouter une Compétence</a></li>
                    <li><a href="/Projet_SR03/ajout_question.html">Ajouter une Question</a></li>
                    <li><a href="/Projet_SR03/ajout_reponse.html">Ajouter une Réponse</a></li>
                    <li><a href="/Projet_SR03/utilisateurs">Liste des Utilisateurs</a></li>
                    <li><a href="/Projet_SR03/competences">Liste des Compétences</a></li>
                    <li><a href="/Projet_SR03/questionnaires">Liste des Questionnaires</a></li>
                    <li><a href="/Projet_SR03/questions">Liste des Questions</a></li>
                    <li><a href="/Projet_SR03/reponses">Liste des Réponses</a></li>
                    <li><a href="/Projet_SR03/parcours">Liste des Parcours</a></li>
                </ul>
            </div>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Utilisateurs</h2>
                <table>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom/th>
                        <th>Email</th>
                        <th>Téléphone</th>
                        <th>Rôle</th>
                        <th>Status</th>
                    </tr>
                    <tr>
                        <td>Jill</td>
                        <td>Smith</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>Eve</td>
                        <td>Jackson</td>
                        <td>94</td>
                    </tr>
                    <tr>
                        <td>Adam</td>
                        <td>Johnson</td>
                        <td>67</td>
                    </tr>
                </table>

            </div>
        </div>
    </body>
</html>

