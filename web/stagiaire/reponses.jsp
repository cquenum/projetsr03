<%-- 
    Document   : reponses
    Created on : 6 juin 2019, 12:21:03
    Author     : cquenum
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mutamba.model.Utilisateur"%>
<%@page import="com.mutamba.dao.ParcoursDao"%>
<%@page import="com.mutamba.dao.ReponseDao"%>
<%@page import="com.mutamba.model.Reponse"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.QuestionDao"%>
<%@page import="com.mutamba.model.Question"%>
<%@page import="com.mutamba.model.Parcours"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String idParcours = request.getParameter("id");

    HttpSession aSession = request.getSession(false);
    Utilisateur utilisateur = new Utilisateur();

    if (aSession == null) {
        response.sendRedirect(request.getContextPath() + "/index.html");
    }

    utilisateur = (Utilisateur) aSession.getAttribute("utilisateur");

    if (utilisateur == null) {
        response.sendRedirect(request.getContextPath() + "/index.html");
    }

    Parcours parcours = new Parcours();

    try {
        parcours = new ParcoursDao().find(Integer.parseInt(idParcours));

    } catch (Exception e) {
        e.printStackTrace();
    }
    
    Hashtable<Integer, Reponse> reponses = parcours.getReponses();
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
                <% if ((reponses == null) || (reponses.isEmpty())) {%>
                <br/>
                <br/>
                <h2>Vous n'avez aucune réponse pour l'instant</h2>
                <p>
                    Vous pouvez commencer en cliquant <a href="<%= request.getContextPath()%>/stagiaire/do_parcours.jsp?id=<%=parcours.getId()%>">ici</a>
                </p>
                <% } else { %>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Votre réponses</th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < reponses.size(); i++) {%>
                    <tr>
                        <td><%=reponses.get(i).getQuestion().getValeur()%></td>
                        <td><%=reponses.get(i).getValeur()%></td>
                        <td><%=reponses.get(i).isBonne()%></td>
                    </tr>
                    <% }%>
                </table>
                <% }%>
            </div>
        </div>
    </body>
</html>
