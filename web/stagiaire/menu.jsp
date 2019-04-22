<%-- 
    Document   : menu
    Created on : 16 avr. 2019, 21:10:38
    Author     : cquenum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <ul>
        <li><a class="active" href="<%= request.getContextPath()%>/stagiaire/index.jsp">Accueil</a></li>
        <li><a href="<%= request.getContextPath()%>/stagiaire/parcours.jsp">Liste de vos Parcours</a></li>
    </ul>
</div>
