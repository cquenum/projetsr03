<%-- 
    Document   : questionnaires
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page import="com.mutamba.model.Reponse"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.ReponseDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mutamba.model.Question"%>

<% ReponseDao dao = new ReponseDao();
    Hashtable<Integer,Reponse> reponse = dao.find();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reponses</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Reponses</h2>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Réponse</th>
                        <th>Statut</th>
                        <th>Bonne réponse</th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < reponse.size(); i++) {%>
                    <tr>
                        <td><%=reponse.get(i).getQuestion().getValeur() %></td>
                        <td><%=reponse.get(i).getValeur() %></td>
                        
                        <% if (reponse.get(i).getStatut()) { %>
                        <td>Actif</td>
                        <% } else {
                        %>
                        <td>Inactif</td>
                        <% }
                        if (reponse.get(i).isBonne()) { %>
                        <td>Oui</td>
                        <% } else {
                        %>
                        <td>Non</td>
                        <% }%>
                        <td><a href="<%= request.getContextPath()%>/admin/suppr_reponse?id=<%=reponse.get(i).getId()%>">Supprimer</a><br/>
                        <a href="<%= request.getContextPath()%>/admin/modif_reponse.jsp?id=<%=reponse.get(i).getId()%>">Modifier</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>

