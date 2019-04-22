/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.controller;

import com.mutamba.model.Utilisateur;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cquenum
 */
public class AuthenticationFilter implements Filter {

    private ServletContext context;
    private static final String RESOURCE_PATH = "/static/";

    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String path = ((HttpServletRequest) request).getServletPath();

        if (path.toLowerCase().startsWith(RESOURCE_PATH)) {
            request.getRequestDispatcher(path).forward(request, response);

        } else if (session == null) {   //checking whether the session exists
            this.context.log("Unauthorized access request");
            res.sendRedirect(req.getContextPath() + "/index.html");
            
        } else {
            
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
            
            if (utilisateur != null 
                    && "stagiaire".equals(utilisateur.getRole()) 
                    && path.toLowerCase().startsWith("/admin/")
                    )
                res.sendRedirect(req.getContextPath() + "/statgiaire/index.jsp");
            else
                // pass the request along the filter chain
                chain.doFilter(request, response);
        }
    }

    public void destroy() {
        //close any resources here
    }

}
