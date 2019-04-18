<%-- 
    Document   : menu
    Created on : 16 avr. 2019, 21:10:38
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <ul>
        <li><a class="active" href="/Projet_SR03/index.html">Accueil</a></li>
        <li><a href="<%= request.getContextPath()%>/ajout_utilisateur.html">Ajouter un Utilisateur</a></li>
        <li><a href="<%= request.getContextPath()%>/ajout_competence.html">Ajouter une Compétence</a></li>
        <li><a href="<%= request.getContextPath()%>/ajout_questionnaire.jsp">Ajouter un Questionnaire</a></li>
        <li><a href="<%= request.getContextPath()%>/ajout_question.jsp">Ajouter une Question</a></li>
        <li><a href="<%= request.getContextPath()%>/ajout_reponse.jsp">Ajouter une Réponse</a></li>
        <li><a href="<%= request.getContextPath()%>/utilisateurs.jsp">Liste des Utilisateurs</a></li>
        <li><a href="<%= request.getContextPath()%>/competences.jsp">Liste des Compétences</a></li>
        <li><a href="<%= request.getContextPath()%>/questionnaires.jsp">Liste des Questionnaires</a></li>
        <li><a href="<%= request.getContextPath()%>/questions.jsp">Liste des Questions</a></li>
        <li><a href="<%= request.getContextPath()%>/reponses.jsp">Liste des Réponses</a></li>
        <li><a href="<%= request.getContextPath()%>/parcours.jsp">Liste des Parcours</a></li>
    </ul>
</div>
