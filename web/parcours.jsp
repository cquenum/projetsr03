<%-- 
    Document   : questionnaires
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page import="com.mutamba.model.Parcours"%>
<%@page import="com.mutamba.dao.ParcoursDao"%>
<%@page import="java.util.Hashtable"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% ParcoursDao dao = new ParcoursDao();
    Hashtable<Integer,Parcours> parcours = dao.find();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Parcours</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Parcours</h2>
                <table>
                    <tr>
                        <th>Stagiaire</th>
                        <th>Score</th>
                        <th>Durée</th>
                        <th>Reponses</th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < parcours.size(); i++) {%>
                    <tr>
                        <td><%=parcours.get(i).getStagiaire().getPrenom() 
                                +  " " 
                                + parcours.get(i).getStagiaire().getNom() %></td>
                        <td><%=parcours.get(i).getScore() %></td>
                        <td><%=parcours.get(i).getDuree() %></td>
                        
                        <td><a href="<%= request.getContextPath()%>/parcours_reponses?id=<%=parcours.get(i).getId()%>">Voir les réponses</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>

