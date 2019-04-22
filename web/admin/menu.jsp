<%-- 
    Document   : menu
    Created on : 16 avr. 2019, 21:10:38
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar">
    <a class="active right" href="<%= request.getContextPath()%>/logout">Se déconnecter</a>
    <a class="right" href="<%= request.getContextPath()%>/admin/index.jsp">${sessionScope.utilisateur.prenom }</a>
</div>
<div>
    <ul>
        <li><a class="active" href="<%= request.getContextPath()%>/admin/index.jsp">Accueil</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ajout_utilisateur.jsp">Ajouter un Utilisateur</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ajout_competence.jsp">Ajouter une Compétence</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ajout_questionnaire.jsp">Ajouter un Questionnaire</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ajout_question.jsp">Ajouter une Question</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ajout_reponse.jsp">Ajouter une Réponse</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/utilisateurs.jsp">Liste des Utilisateurs</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/competences.jsp">Liste des Compétences</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/questionnaires.jsp">Liste des Questionnaires</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/questions.jsp">Liste des Questions</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/reponses.jsp">Liste des Réponses</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/parcours.jsp">Liste des Parcours</a></li>
    </ul>
</div>
