<%-- 
    Document   : utilisateurs
    Created on : 12 avr. 2019, 23:48:49
    Author     : cquenum
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.mutamba.dao.UtilisateurDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mutamba.model.Utilisateur"%>

<% UtilisateurDao dao = new UtilisateurDao();
    Hashtable<Integer, Utilisateur> utilisateurs = dao.find();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Utilisateurs</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <div>
            <%@include file="menu.jsp" %>
            <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
                <h2>Liste des Utilisateurs</h2>
                <table>
                    <tr>
                        <th>Prénom</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Téléphone</th>
                        <th>Rôle</th>
                        <th>Date création</th>
                        <th>Status</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <% for (int i = 0; i < utilisateurs.size(); i++) {%>
                    <tr>
                        <td><%=utilisateurs.get(i).getPrenom() %></td>
                        <td><%=utilisateurs.get(i).getNom() %></td>
                        <td><%=utilisateurs.get(i).getEmail() %></td>
                        <td><%=utilisateurs.get(i).getTelephone() %></td>
                        <td><%=utilisateurs.get(i).getRole() %></td>
                        <td><%=utilisateurs.get(i).getDateCreation().format(formatter) %></td>
                        <% if (utilisateurs.get(i).getStatut()) { %>
                        <td>Actif</td>
                        <% } else {
                        %>
                        <td>Inactif</td>
                        <% }%>
                        <td><a href="<%= request.getContextPath()%>/admin/suppr_utilisateur?id=<%=utilisateurs.get(i).getId()%>">Supprimer</a></td>
                        <td><a href="<%= request.getContextPath()%>/admin/modif_utilisateur.jsp?id=<%=utilisateurs.get(i).getId()%>">Modifier</a></td>
                    </tr>
                        <% }%>
                </table>
            </div>
        </div>
    </body>
</html>

