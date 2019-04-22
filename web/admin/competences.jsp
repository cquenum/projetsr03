<%-- 
    Document   : competences
    Created on : 17 avr. 2019, 18:16:28
    Author     : albertmutamba
--%>


<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.CompetenceDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mutamba.model.Competence"%>

<% CompetenceDao dao = new CompetenceDao();
    Hashtable<Integer, Competence> competences = dao.find();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Competences</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Competences</h2>
                <table>
                    <tr>
                        <th>Sujet</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < competences.size(); i++) {%>
                    <tr>
                        <td><%=competences.get(i).getSujet() %></td>
                        
                        <td><a href="<%= request.getContextPath()%>/admin/suppr_competence?id=<%=competences.get(i).getId()%>">Supprimer</a></td>
                        <td><a href="<%= request.getContextPath()%>/admin/modif_competence.jsp?id=<%=competences.get(i).getId()%>">Modifier</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>