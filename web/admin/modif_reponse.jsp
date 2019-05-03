<%-- 
    Document   : modif_questionnaire
    Created on : 17 avr. 2019, 18:56:48
    Author     : albertmutamba
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.ReponseDao"%>
<%@page import="com.mutamba.model.Reponse"%>
<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page import="com.mutamba.model.Question"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! Reponse reponse = new Reponse();%>

<% String sid = request.getParameter("id");
    if (sid == null) {
        response.sendRedirect(request.getContextPath() + "/error.html");
    } else {
        try {
            int id = Integer.parseInt(sid);
            ReponseDao dao = new ReponseDao();
            reponse = dao.find(id);
            if (reponse == null) {
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
        <title>Modifier Réponse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Modifier Réponse</h1>
            <p>Veuillez remplir le formulaire avec les nouvelles informations</p>
            <form action="<%= request.getContextPath() %>/admin/modif_reponse" method="POST">
                <div class="container">
                    <input type="hidden" name="id" value="<%= reponse.getId()%>"/>
                    <select name="question">
                        <% Hashtable<Integer,Question> questions = new QuestionDao().find();
                        for (int i = 0; i < questions.size(); i++) {%>
                        <option value="<%= questions.get(i).getId()%>"><%= questions.get(i).getValeur()%></option>
                        <%
                        }%>
                    </select>
                    <label for="valeur"><b>Réponse</b>
                        <input type="text" placeholder="Réponse" name="valeur" value="<%= reponse.getValeur()%>" required>
                    </label>
                    
                    <label>
                        <% if (reponse.getStatut()) { %>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                        <% } else {
                        %>
                        <input type="checkbox" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                        <% }%>
                    </label>
                    <label>
                        <% if (reponse.isBonne()) { %>
                        <input type="checkbox" checked="checked" name="bonne" style="margin-bottom:15px"> <b>Est bonne</b>
                        <% } else {
                        %>
                        <input type="checkbox" name="bonne" style="margin-bottom:15px"> <b>Est bonne</b>
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