<%-- 
    Document   : modif_questionnaire
    Created on : 17 avr. 2019, 18:56:48
    Author     : albertmutamba
--%>

<%@page import="com.mutamba.dao.QuestionnaireDao"%>
<%@page import="com.mutamba.model.Questionnaire"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.model.Question"%>
<%@page import="com.mutamba.dao.QuestionDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! Question question = new Question();%>

<% String sid = request.getParameter("id");
    if (sid == null) {
        response.sendRedirect(request.getContextPath() + "/error.html");
    } else {
        try {
            int id = Integer.parseInt(sid);
            QuestionDao dao = new QuestionDao();
            question = dao.find(id);
            if (question == null) {
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
        <title>Modifier Question</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Modifier Question</h1>
            <p>Veuillez remplir le formulaire avec les nouvelles informations</p>
            <form action="<%= request.getContextPath()%>/admin/modif_question" method="POST">
                <div class="container">
                    <input type="hidden" name="id" value="<%= question.getId()%>"/>
                    <select name="questionnaire">
                        <% Hashtable<Integer, Questionnaire> questionnaires = new QuestionnaireDao().find();
                            for (int i = 0; i < questionnaires.size(); i++) {%>
                        <option value="<%= questionnaires.get(i).getId()%>"><%= questionnaires.get(i).getValeur()%></option>
                        <%
                            }%>
                    </select>
                    <label for="valeur"><b>Question</b>
                        <input type="text" placeholder="Question" name="valeur" value="<%= question.getValeur()%>" required>
                    </label>

                    <label>
                        <% if (question.getStatut()) { %>
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