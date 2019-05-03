<%-- 
    Document   : questionnaires
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mutamba.model.Question"%>

<% QuestionDao dao = new QuestionDao();
    Hashtable<Integer,Question> questions = dao.find();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Questions</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Questions</h2>
                <table>
                    <tr>
                        <th>Questionnaire</th>
                        <th>Question</th>
                        <th>Statut</th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < questions.size(); i++) {%>
                    <tr>
                        <td><%=questions.get(i).getQuestionnaire().getValeur() %></td>
                        <td><%=questions.get(i).getValeur() %></td>
                        <% if (questions.get(i).getStatut()) { %>
                        <td>Actif</td>
                        <% } else {
                        %>
                        <td>Inactif</td>
                        <% }%>
                        <td><a href="<%= request.getContextPath()%>/admin/suppr_question?id=<%=questions.get(i).getId()%>">Supprimer</a>
                        <br/><a href="<%= request.getContextPath()%>/admin/modif_question.jsp?id=<%=questions.get(i).getId()%>">Modifier</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>

