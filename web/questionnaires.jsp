<%-- 
    Document   : questionnaires
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.QuestionnaireDao"%>
<%@page import="com.mutamba.model.Questionnaire"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% QuestionnaireDao dao = new QuestionnaireDao();
    Hashtable<Integer, Questionnaire> questionnaires = dao.find();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Questionnaires</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Questionnaires</h2>
                <table>
                    <tr>
                        <th>Sujet</th>
                        <th>Question</th>
                        <th>Statut</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < questionnaires.size(); i++) {%>
                    <tr>
                        <td><%=questionnaires.get(i).getCompetence().getSujet() %></td>
                        <td><%=questionnaires.get(i).getValeur() %></td>
                        <% if (questionnaires.get(i).getStatut()) { %>
                        <td>Actif</td>
                        <% } else {
                        %>
                        <td>Inactif</td>
                        <% }%>
                        <td><a href="<%= request.getContextPath()%>/suppr_questionnaire?id=<%=questionnaires.get(i).getId()%>">Supprimer</a></td>
                        <td><a href="<%= request.getContextPath()%>/modif_questionnaire.jsp?id=<%=questionnaires.get(i).getId()%>">Modifier</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>

