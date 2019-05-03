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

<%! Question questionnaire = new Question();%>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter une nouvelle Question</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouvelle Question</h1>
            <p>Veuillez remplir le formulaire pour créer une nouvelle question.
                <br/>
                - Choisissez un questionnaire;<br/>
                - Saisissez la question;<br/>
                - Saissisez au moins deux réponses, tout en indiquant laquelle est la bonne.<br/>
            </p>
            <br/>
            <form action="<%= request.getContextPath()%>/admin/questions" method="POST">
                <div class="container">
                    <label for="questionnaires"><b>Questionnaire: </b> 
                        <select name="questionnaires">
                            <% Hashtable<Integer, Questionnaire> questionnaires = new QuestionnaireDao().find();
                                for (int i = 0; i < questionnaires.size(); i++) {%>
                            <option value="<%= questionnaires.get(i).getId()%>"><%= questionnaires.get(i).getValeur()%></option>
                            <%
                                }%>
                        </select>
                    </label>
                    <br/>
                    <br/>
                    <label for="question"><b>Question</b>
                        <input type="text" placeholder="Question" name="question" required title="Vous devez fournir une question">
                    </label>
                    <label>
                        <input type="checkbox" checked="checked" name="statut" style="margin-bottom:15px"> <b>Actif</b>
                    </label>
                    <br/>
                    <div>
                        <label><b><i>Réponses: </i></b></label>
                        <input type="text" placeholder="Réponse 1" name="reponse1" required title="Vous devez fournir une réponse à la question">
                        <input type="radio" name="bonne" value="1" style="margin-bottom:15px" required> <b>Est la bonne réponse</b>
                        <input type="text" placeholder="Réponse 2" name="reponse2" required title="Vous devez fournir une réponse à la question">
                        <input type="radio" name="bonne" value="2" style="margin-bottom:15px"> <b>Est la bonne réponse</b>
                        <input type="text" placeholder="Réponse 3" name="reponse3" required title="Vous devez fournir une réponse à la question">
                        <input type="radio" name="bonne" value="3" style="margin-bottom:15px"> <b>Est la bonne réponse</b>
                        <input type="text" placeholder="Réponse 4" name="reponse4" required title="Vous devez fournir une réponse à la question">
                        <input type="radio" name="bonne" value="4" style="margin-bottom:15px"> <b>Est la bonne réponse</b>
                    </div>
                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>