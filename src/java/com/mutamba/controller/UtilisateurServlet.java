/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.UtilisateurDao;
import com.mutamba.model.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cquenum
 */
public class UtilisateurServlet extends HttpServlet {

    private static Hashtable<Integer, Utilisateur> utilisateursTable = new Hashtable<Integer, Utilisateur>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        UtilisateurDao dao = new UtilisateurDao();
        utilisateursTable = dao.find();

        if ("POST".equals(request.getMethod())) {

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            String telephone = request.getParameter("telephone");
            String role = request.getParameter("role");
            String[] statut = request.getParameterValues("statut");
            
            

            Utilisateur newUtilisateur = new Utilisateur(nom, prenom,
                    email, pwd, role);

            //newUtilisateur.setId(utilisateursTable.size() + 1);

            newUtilisateur.setTelephone(telephone);
            
            LocalDateTime dateCreation = LocalDateTime.now();
            newUtilisateur.setDateCreation(dateCreation);
            
            newUtilisateur.setStatut(true);
            if (statut.length == 0) {
                newUtilisateur.setStatut(false);
            }
            
            utilisateursTable.put(utilisateursTable.size(), dao.create(newUtilisateur));
            response.sendRedirect(request.getContextPath() + "/succes.html");

        } else if ("GET".equals(request.getMethod())) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Liste des Utilisateurs</title>");
                out.println("<link rel=\"StyleSheet\" href=\"" + request.getContextPath() + "/css/style.css\" type=\"text/css\">");
                out.println("</head>");
                out.println("<body>");
                out.println("<div>");
                out.println("<div>");
                out.println("<ul>");
                out.println("<li><a class=\"active\" href=\"/Projet_SR03/index.html\">Accueil</a></li>");
                out.println("<li><a href=\"/Projet_SR03/ajout_utilisateur.html\">Ajouter un Utilisateur</a></li>");
                out.println("<li><a href=\"/Projet_SR03/ajout_competence.html\">Ajouter une Compétence</a></li>");
                out.println("<li><a href=\"/Projet_SR03/ajout_question.html\">Ajouter une Question</a></li>");
                out.println("<li><a href=\"/Projet_SR03/ajout_reponse.html\">Ajouter une Réponse</a></li>");
                out.println("<li><a href=\"/Projet_SR03/utilisateurs\">Liste des Utilisateurs</a></li>");
                out.println("<li><a href=\"/Projet_SR03/competences\">Liste des Compétences</a></li>");
                out.println("<li><a href=\"/Projet_SR03/questionnaires\">Liste des Questionnaires</a></li>");
                out.println("<li><a href=\"/Projet_SR03/questions\">Liste des Questions</a></li>");
                out.println("<li><a href=\"/Projet_SR03/reponses\">Liste des Réponses</a></li>");
                out.println("<li><a href=\"/Projet_SR03/parcours\">Liste des Parcours</a></li>");
                out.println("</ul>");
                out.println("</div>");
                out.println("<div class=\"container\" style=\"margin-left:25%;padding:1px 16px;height:1000px;\">");
                out.println("<h2>Liste des Utilisateurs: </h2>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Prénom</th>");
                out.println("<th>Nom</th>");
                out.println("<th>Email</th>");
                out.println("<th>Téléphone</th>");
                out.println("<th>Rôle</th>");
                out.println("<th>Date création</th>");
                out.println("<th>Statut</th>");
                out.println("<th></th>");
                out.println("<th></th>");
                out.println("</tr>");
                for (int i = 0; i < utilisateursTable.size(); i++) {
                    out.println("<tr>");
                    out.println("<td>" + utilisateursTable.get(i).getPrenom() + "</td>");
                    out.println("<td>" + utilisateursTable.get(i).getNom() + "</td>");
                    out.println("<td>" + utilisateursTable.get(i).getEmail() + "</td>");
                    out.println("<td>" + utilisateursTable.get(i).getTelephone() + "</td>");
                    out.println("<td>" + utilisateursTable.get(i).getRole() + "</td>");
                    out.println("<td>" + utilisateursTable.get(i).getDateCreation().format(formatter) + "</td>");
                    if (utilisateursTable.get(i).getStatut()) {
                        out.println("<td>Actif</td>");
                    } else {
                        out.println("<td>Inactif</td>");
                    }
                    out.println("<td><a href=\"" + request.getContextPath() + "/suppr_utilisateur?id=" + utilisateursTable.get(i).getId() + "\">Supprimer</a></td>");
                    out.println("<td><a href=\"" + request.getContextPath() + "/modif_utilisateur?id=" + utilisateursTable.get(i).getId() + "\">Modifier</a></td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                out.println("</div>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
