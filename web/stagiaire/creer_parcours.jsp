<%-- 
    Document   : creer_parcours
    Created on : 22 avr. 2019, 01:24:56
    Author     : cquenum
--%>

<%@page import="com.mutamba.dao.QuestionnaireDao"%>
<%@page import="com.mutamba.model.Questionnaire"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
        <title>Nouveau Parcours</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%@include file="menu.jsp" %>
        
        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Nouveau Parcours</h1>
            <p>Choisissez le questionnaire pour commencer votre évaluation</p>
            <form action="<%= request.getContextPath()%>/stagiaire/creer_parcours" method="POST">
                <div class="container">
                    <label for="questionnaire"><b>Questionnaires: </b>
                        <select name="questionnaire">
                            <% Hashtable<Integer, Questionnaire> questionnaires = new QuestionnaireDao().find();
                                for (int i = 0; i < questionnaires.size(); i++) {
                                    if (questionnaires.get(i).isActive()){
                            %>
                            <option value="<%= questionnaires.get(i).getId()%>"><%= questionnaires.get(i).getValeur()%></option>
                            <%
                                    }
                                }%>
                        </select>
                    </label>
                    <br/>
                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Commencer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>
