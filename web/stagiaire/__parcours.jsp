<%-- 
    Document   : parcours
    Created on : 20 avr. 2019, 15:40:06
    Author     : cquenum
--%>

<%@page import="com.mutamba.dao.ReponseDao"%>
<%@page import="com.mutamba.model.Reponse"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page import="com.mutamba.model.Question"%>
<%@page import="com.mutamba.model.Parcours"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Parcours parcours = (Parcours) request.getSession().getAttribute("parcours");
    Hashtable<Integer, Question> questions = new Hashtable<>();

    if (parcours != null) {
        questions = new QuestionDao().find(parcours.getQuestionnaire());
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Parcours</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
        <script src="<%= request.getContextPath()%>/static/script.js"></script>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%@include file="menu.jsp" %>
        <div>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <form id="regForm" action="/stagiaire/parcours">

                    <h1>Choisissez une réponse:</h1>
                    <!-- One "tab" for each step in the form: -->
                    <% for (int i = 0; i < questions.size(); i++) {%>
                    <div class="tab"><%= questions.get(i).getValeur()%>:
                        <select name="reponses">
                            <% Hashtable<Integer, Reponse> reponses = new ReponseDao().find(questions.get(i));
                                for (int j = 0; j < reponses.size(); j++) {
                            %>
                            <option value="<%= reponses.get(j).getId()%>"><%= reponses.get(j).getValeur()%></option>
                            <%}%>
                        </select>
                    </div>
                    <% }%>
                    <div style="overflow:auto;">
                        <div style="float:right;">
                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Précédent</button>
                            <button type="button" id="nextBtn" onclick="nextPrev(1)">Suivant</button>
                        </div>
                    </div>

                    <!-- Circles which indicates the steps of the form: -->
                    
                    <div style="text-align:center;margin-top:40px;">
                        <% for (int i = 0; i < questions.size(); i++) {%>
                        <span class="step"></span>
                        <%}%>
                    </div>

                </form>
            </div>
        </div>
    </body>
</html>
