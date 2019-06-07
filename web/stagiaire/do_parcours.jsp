<%-- 
    Document   : do_parcours
    Created on : 22 avr. 2019, 19:04:34
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

    Hashtable<Integer, Reponse> reponsesPrecedantes = parcours.getReponses();
    Hashtable<Integer, Question> questions = new QuestionDao().find(parcours.getQuestionnaire());
    Question nouvelleQuestion = null;
    
    for (int j = 0; j < questions.size(); j++) {
        boolean questionDejaPose = false;
        
        for (int i = 0; i < reponsesPrecedantes.size(); i++) {
            Question quest = reponsesPrecedantes.get(i).getQuestion();
            
            if (questions.get(j).equals(quest)) {
                questionDejaPose = true;
                break;
            }
        }
        
        if(!questionDejaPose){
            nouvelleQuestion = questions.get(j);
            break;
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Evaluation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/style.css"/>
        <script language="JavaScript">
            var totalSeconds = 0;
            setInterval(setTime, 1000);

            function setTime() {
                ++totalSeconds;
                document.getElementById("seconds").innerHTML = pad(totalSeconds % 60);
                document.getElementById("minutes").innerHTML = pad(parseInt(totalSeconds / 60));
                document.getElementById("duree").value = totalSeconds;
            }

            function pad(val) {
                var valString = val + "";
                if (valString.length < 2) {
                    return "0" + valString;
                } else {
                    return valString;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%@include file="menu.jsp" %>
        <div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
            <% if (nouvelleQuestion == null) {%>
            <br/>
            <h2>Vous avez terminé le Parcours</h2>
            <p>
                Vous pouvez consulter vos réponses en cliquant <a href="<%= request.getContextPath()%>/stagiaire/reponses.jsp?id=<%=parcours.getId()%>">ici</a>
            </p>
            <% } else {%>
            <h1>Choisissez une réponse:</h1>
            <form action="<%= request.getContextPath()%>/stagiaire/parcours" method="POST">
                <div>
                    <input type="hidden" name="id_parcours" value="<%= parcours.getId()%>">
                    <input type="hidden" name="duree" id="duree">
                    <strong>Temps: </strong> <label id="minutes">00</label>:<label id="seconds">00</label>

                    <h2><%= nouvelleQuestion.getValeur()%>:</h2>
                    <% Hashtable<Integer, Reponse> reponses = new ReponseDao().find(nouvelleQuestion);
                        for (int j = 0; j < reponses.size(); j++) {
                    %>
                    <input type="radio" value="<%= reponses.get(j).getId()%>" name="id_reponse"> <%= reponses.get(j).getValeur()%>
                    <br/>
                    <% }%>
                </div>
                <div class="clearfix">
                    <button type="submit" class="signupbtn">Suivant</button>
                </div>
            </form>
            <%}%>
        </div>
    </body>
</html>
