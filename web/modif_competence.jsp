<%-- 
    Document   : modif_competence
    Created on : 17 avr. 2019, 18:56:48
    Author     : albertmutamba
--%>



<%@page import="com.mutamba.model.Competence"%>
<%@page import="com.mutamba.dao.CompetenceDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Competence competence = new Competence(); %>
<% String sid = request.getParameter("id");
if (sid == null)
    response.sendRedirect(request.getContextPath() + "/error.html");
else
    try {
        int id = Integer.parseInt(sid);
        CompetenceDao dao = new CompetenceDao();
        competence = dao.find(id);
        if (competence == null)
            response.sendRedirect(request.getContextPath() + "/error.html");
    }
    catch(Exception e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modifier Competence</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>

        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Modifier Competence</h1>
            <p>Veuillez remplir le formulaire avec les nouvelles informations</p>
            <form action="/Projet_SR03/modif_competence" method="POST">
                <div class="container">
                    <input type="hidden" name="id" value="<%= competence.getId()%>"/>
                    <label for="sujet"><b>Sujet</b>
                        <input type="text" placeholder="Sujet" name="sujet" value="<%= competence.getSujet()%>" required>
                    </label>

                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>