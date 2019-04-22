<%-- 
    Document   : navbar
    Created on : 20 avr. 2019, 18:04:42
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar">
    <a class="active right" href="<%= request.getContextPath()%>/logout">Se déconnecter</a>
    <a class="right" href="#">${sessionScope.utilisateur.prenom }</a>
</div>
