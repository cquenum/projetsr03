/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.QuestionDao;
import com.mutamba.dao.QuestionnaireDao;
import com.mutamba.dao.ReponseDao;
import com.mutamba.model.Question;
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
public class QuestionServlet extends HttpServlet {

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
        QuestionDao dao = new QuestionDao();
        Question question = new Question();

        String sid_competence = request.getParameter("questionnaires");
        String valeur = request.getParameter("question");
        String[] statut = request.getParameterValues("statut");
        
        String[] params = {"reponse1", "reponse2", "reponse3", "reponse4"};

        String[] valeursReponse = new String[params.length];;
        boolean reponseStatut = true;
        int bonneReponse = Integer.parseInt(request.getParameter("bonne")) ;
        
        int j = 0;
        for (String param : params){
            valeursReponse[j] = request.getParameter(param);
            j++;
        }

        try {
            int id_competence = Integer.parseInt(sid_competence);
            question.setQuestionnaire(
                    new QuestionnaireDao()
                            .find(id_competence)
            );

            question.setValeur(valeur);

            question.setStatut(true);
            
            if (statut == null || statut.length == 0) {
                question.setStatut(false);
                reponseStatut = false;
            }
            
            question = dao.create(question);
            
            
            for (int i=0; i<valeursReponse.length; i++) {
                Reponse reponse = new Reponse(valeursReponse[i]);
                reponse.setQuestion(question);
                reponse.setStatut(reponseStatut);
                
                if (i == bonneReponse - 1)
                    reponse.setBonne(true);
                else
                    reponse.setBonne(false);
                
                reponse = new ReponseDao().create(reponse);
            }
            
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
