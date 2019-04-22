/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.UtilisateurDao;
import com.mutamba.model.Utilisateur;
import java.io.IOException;
import java.time.LocalDateTime;
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
        if (statut == null || statut.length == 0) {
            newUtilisateur.setStatut(false);
        }
        
        newUtilisateur = dao.create(newUtilisateur);

        utilisateursTable.put(utilisateursTable.size(), newUtilisateur);
        response.sendRedirect(request.getContextPath() + "/admin/succes.html");

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
        //processRequest(request, response);
        response.sendRedirect(request.getContextPath() + "/utilisateurs.jsp");
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
