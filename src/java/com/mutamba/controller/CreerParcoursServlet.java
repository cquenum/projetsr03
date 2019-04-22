/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.ParcoursDao;
import com.mutamba.dao.QuestionnaireDao;
import com.mutamba.model.Parcours;
import com.mutamba.model.Questionnaire;
import com.mutamba.model.Utilisateur;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cquenum
 */
public class CreerParcoursServlet extends HttpServlet {

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

        String sid = request.getParameter("questionnaire");
        HttpSession session = request.getSession(false);

        if (session == null) {   //checking whether the session exists
            response.sendRedirect(request.getContextPath() + "/index.html");
        } else {
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
            if (utilisateur != null && "stagiaire".equals(utilisateur.getRole())) {
                try {
                    Questionnaire questionnaire = new QuestionnaireDao().find(Integer.parseInt(sid));
                    Parcours parcours = new ParcoursDao()
                            .create(
                                    new Parcours(utilisateur, questionnaire)
                            );

                    session.setAttribute("parcours", parcours);
                    response.sendRedirect(request.getContextPath() + "/stagiaire/parcours.jsp");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/index.html");
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
