<%-- 
    Document   : parcours
    Created on : 20 avr. 2019, 15:40:06
    Author     : cquenum
--%>

<%@page import="com.mutamba.model.Utilisateur"%>
<%@page import="com.mutamba.dao.ParcoursDao"%>
<%@page import="com.mutamba.dao.ReponseDao"%>
<%@page import="com.mutamba.model.Reponse"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page import="com.mutamba.model.Question"%>
<%@page import="com.mutamba.model.Parcours"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("utilisateur");
    Hashtable<Integer, Parcours> parcours = new Hashtable<>();

    if (utilisateur != null) {
        parcours = new ParcoursDao().find(utilisateur);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Parcours</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%@include file="menu.jsp" %>
        <div>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">

                <h2>Liste des vos Parcours</h2>
                <% if ((parcours == null) || (parcours.isEmpty())) {%>
                <br/>
                <br/>
                <h2>Vous n'avez aucun Parcours pour l'instant</h2>
                <p>
                    Vous pouvez commencer en cliquant <a href="<%= request.getContextPath()%>/stagiaire/creer_parcours.jsp">ici</a>
                </p>
                <% } else { %>
                <table>
                    <tr>
                        <th>Score</th>
                        <th>Durée (secondes)</th>
                        <th>Reponses</th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < parcours.size(); i++) {%>
                    <tr>
                        <td><%=parcours.get(i).getScore()%></td>
                        <td><%=parcours.get(i).getDuree()%></td>

                        <% if ((parcours.get(i).getReponses() == null) || parcours.get(i).getReponses().isEmpty()) {%>
                        <td><a href="<%= request.getContextPath()%>/stagiaire/parcours_reponses.jsp?id=<%=parcours.get(i).getId()%>">Démarrer le parcours</a></td>
                        <% } else {%>
                        <td><a href="<%= request.getContextPath()%>/stagiaire/parcours_reponses?id=<%=parcours.get(i).getId()%>">Voir les réponses</a></td>
                        <% } %>
                    </tr>
                    <% }%>
                </table>
                <% }%>
            </div>
        </div>
    </body>
</html>
