<%-- 
    Document   : modif_questionnaire
    Created on : 17 avr. 2019, 18:56:48
    Author     : albertmutamba
--%>

<%@page import="com.mutamba.dao.CompetenceDao"%>
<%@page import="com.mutamba.model.Competence"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.model.Questionnaire"%>
<%@page import="com.mutamba.dao.QuestionnaireDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! Questionnaire questionnaire = new Questionnaire();%>

<% String sid = request.getParameter("id");
    if (sid == null) {
        response.sendRedirect(request.getContextPath() + "/error.html");
    } else {
        try {
            int id = Integer.parseInt(sid);
            QuestionnaireDao dao = new QuestionnaireDao();
            questionnaire = dao.find(id);
            if (questionnaire == null) {
                response.sendRedirect(request.getContextPath() + "/error.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modifier Questionnaire</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Modifier Questionnaire</h1>
            <p>Veuillez remplir le formulaire avec les nouvelles informations</p>
            <form action="<%= request.getContextPath()%>/modif_questionnaire" method="POST">
                <div class="container">
                    <input type="hidden" name="id" value="<%= questionnaire.getId()%>"/>
                    <select name="competences">
                        <% Hashtable<Integer, Competence> competences = new CompetenceDao().find();
                            for (int i = 0; i < competences.size(); i++) {%>
                        <option value="<%= competences.get(i).getId()%>"><%= competences.get(i).getSujet()%></option>
                        <%
                            }%>
                    </select>
                    <label for="valeur"><b>Questionnaire</b>
                        <input type="text" placeholder="Questionnaire" name="valeur" value="<%= questionnaire.getValeur()%>" required>
                    </label>

                    <label>
                        <% if (questionnaire.getStatut()) { %>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                        <% } else {
                        %>
                        <input type="checkbox" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                        <% }%>
                    </label>

                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>