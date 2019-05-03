/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.QuestionDao;
import com.mutamba.dao.ReponseDao;
import com.mutamba.model.Reponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cquenum
 */
public class ReponseServlet extends HttpServlet {

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
        ReponseDao dao = new ReponseDao();
        Reponse reponse = new Reponse();

        String sid_question = request.getParameter("questions");
        String valeur = request.getParameter("reponse");
        String[] statut = request.getParameterValues("statut");
        String[] bonne = request.getParameterValues("bonne");

        try {
            int id_question = Integer.parseInt(sid_question);
            reponse.setQuestion(
                    new QuestionDao()
                            .find(id_question)
            );

            reponse.setValeur(valeur);

            reponse.setStatut(true);
            if (statut == null || statut.length == 0) {
                reponse.setStatut(false);
            }
            reponse.setBonne(false);
            if (bonne != null && bonne.length != 0) {
                reponse.setBonne(true);
            }

            dao.create(reponse);
            response.sendRedirect(request.getContextPath() + "/admin/succes.html");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/error.html");
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
