<%-- 
    Document   : modif_utilisateur
    Created on : 16 avr. 2019, 15:00:47
    Author     : cquenum
--%>

<%@page import="com.mutamba.model.Utilisateur"%>
<%@page import="com.mutamba.dao.UtilisateurDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Utilisateur utilisateur = new Utilisateur(); %>
<% String sid = request.getParameter("id");
if (sid == null)
    response.sendRedirect(request.getContextPath() + "/error.html");
else
    try {
        int id = Integer.parseInt(sid);
        UtilisateurDao dao = new UtilisateurDao();
        utilisateur = dao.find(id);
        if (utilisateur == null)
            response.sendRedirect(request.getContextPath() + "/error.html");
    }
    catch(Exception e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modifier Utilisateur</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/static/style.css"/>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <div style="margin-left:25%;padding:1px 16px;height:1000px;">
            <h1>Modifier Utilisateur</h1>
            <p>Veuillez remplir le formulaire avec les nouvelles informations</p>
            <form action="<%= request.getContextPath()%>/admin/modif_utilisateur" method="POST">
                <div class="container">
                    <input type="hidden" name="id" value="<%= utilisateur.getId() %>"/>
                    <label for="prenom"><b>Prénom</b>
                        <input type="text" placeholder="Prenom" name="prenom" value="<%= utilisateur.getPrenom() %>" required>
                    </label>
                    <label for="nom"><b>Nom</b>
                        <input type="text" placeholder="Nom" name="nom" value="<%= utilisateur.getNom() %>" required>
                    </label>
                    <label for="email"><b>Email</b>
                        <input type="email" placeholder="Email" name="email" value="<%= utilisateur.getEmail() %>" required>
                    </label>
                    <label for="pwd"><b>Mot de passe</b>
                        <input type="password" placeholder="Mot de passe" name="pwd" value="<%= utilisateur.getPwd() %>" pattern=".{6,}" required>
                    </label>

                    <label for="telephone"><b>Téléphone</b>
                        <input type="tel" placeholder="Téléphone" name="telephone" value="<%= utilisateur.getTelephone() %>" required pattern="(?:(?:\+|00)33|0)\s*?[1-9](?:[\s.-]*?\d{2}){4}">
                    </label>

                    <label>
                        <input type="radio" <% if("stagiaire".equals(utilisateur.getRole())) {out.print("checked=\"checked\"");} %> name="role" value="stagiaire" style="margin-bottom:15px"> <b>Stagiaire</b>
                    </label>
                    <br/>
                    <label>
                        <input type="radio" name="role" <% if("administrateur".equals(utilisateur.getRole())) {out.print("checked=\"checked\"");} %> value="administrateur" style="margin-bottom:15px"> <b>Administrateur</b>
                    </label>
                    <br/>
                    <label>
                        <input type="checkbox" <% if(utilisateur.getStatut()) {out.print("checked=\"checked\"");} %> name="statut" style="margin-bottom:15px"> <b>Actif</b>
                    </label>

                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Enregistrer</button>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>