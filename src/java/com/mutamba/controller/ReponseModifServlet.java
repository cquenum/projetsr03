/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.QuestionDao;
import com.mutamba.dao.ReponseDao;
import com.mutamba.model.Question;
import com.mutamba.model.Reponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cquenum
 */
public class ReponseModifServlet extends HttpServlet {

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

        String sid = request.getParameter("id");
        int id;

        if (sid.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/error.html");
        } else {
            try {
                id = Integer.parseInt(sid);

                ReponseDao dao = new ReponseDao();
                Reponse reponse = dao.find(id);

                Question question = new QuestionDao().find(Integer.parseInt(request.getParameter("question")));
                reponse.setQuestion(question);
                
                String[] statut = request.getParameterValues("statut");
                if (statut.length == 0)
                    reponse.setStatut(false);
                else
                    reponse.setStatut(true);
                
                dao.update(reponse);
                response.sendRedirect(request.getContextPath() + "/admin/succes.html");
                
            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/admin/error.html");
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
        //processRequest(request, response);
        response.sendRedirect(request.getContextPath() + "/index.html");
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
