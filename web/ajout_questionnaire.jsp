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

<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter un nouveau Questionnaire</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouveau Questionnaire</h1>
            <p>Veuillez remplir le formulaire pour créer un nouveau questionnaire</p>
            <form action="<%= request.getContextPath() %>/questionnaires" method="POST">
                <div class="container">
                    <label for="competences"><b>Competence: </b>
                        <select name="competences">
                            <% Hashtable<Integer, Competence> competences = new CompetenceDao().find();
                                for (int i = 0; i < competences.size(); i++) {%>
                            <option value="<%= competences.get(i).getId()%>"><%= competences.get(i).getSujet()%></option>
                            <%
                                }%>
                        </select>
                    </label>
                    <br/>
                    <br/>
                    <label for="questionnaire"><b>Questionnaire</b>
                        <input type="text" placeholder="Questionnaire" name="questionnaire" required>
                    </label>
                    <label>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                    </label>
                    <br/>
                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>