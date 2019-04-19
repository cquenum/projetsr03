<%-- 
    Document   : ajout_reponse
    Created on : 18 avr. 2019, 15:20:41
    Author     : cquenum
--%>

<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page import="com.mutamba.model.Question"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter une nouvelle Réponse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouvelle Réponse</h1>
            <p>Veuillez remplir le formulaire pour créer une nouvelle réponse</p>
            <form action="<%= request.getContextPath() %>/reponses" method="POST">
                <div class="container">
                    <label for="questions"><b>Question: </b>
                        <select name="questions">
                            <% Hashtable<Integer, Question> question = new QuestionDao().find();
                                for (int i = 0; i < question.size(); i++) {%>
                            <option value="<%= question.get(i).getId()%>"><%= question.get(i).getValeur()%></option>
                            <%
                                }%>
                        </select>
                    </label>
                    <br/>
                    <br/>
                    <label for="reponse"><b>Réponse</b>
                        <input type="text" placeholder="Réponse" name="reponse" required>
                    </label>
                    <label>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                    </label>
                    <br/>
                    <label>
                        <input type="checkbox" name="bonne" style="margin-bottom:15px"> <b>Est bonne</b>
                    </label>
                    <br/>
                    <div class="clearfix">
                        <input type="reset" class="cancelbtn" value="Effacer">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>