/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.dao.UtilisateurDao;
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
public class LoginServlet extends HttpServlet {

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

        // get request parameters for username and password
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        String[] remember = request.getParameterValues("remember");
        
        Utilisateur utilisateur = new UtilisateurDao().checkLogin(email, pwd);

        if (utilisateur != null) {
            //get the old session and invalidate
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            //generate a new session
            HttpSession newSession = request.getSession(true);
            newSession.setAttribute("utilisateur", utilisateur);

            //setting session to expiry 
            if (remember == null)
                // in 5 mins
                newSession.setMaxInactiveInterval(5 * 60);
            else
                // in 30 mins
                newSession.setMaxInactiveInterval(30 * 60);
            
            // create cookies
            /*
            Cookie cookie = new Cookie("token", "Bearer " + "Welcome");
            cookie.setSecure(true);
            cookie.setHttpOnly(true);
            
            response.addCookie(cookie);
            */
            if ("stagiaire".equals(utilisateur.getRole()))
                response.sendRedirect(request.getContextPath() + "/stagiaire/index.jsp");
            else
               response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
            
        } else {
            response.sendRedirect(request.getContextPath() + "/login_error.html");
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
