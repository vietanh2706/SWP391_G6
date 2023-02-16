/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.ENTDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.EntRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "ENT_medical", urlPatterns = {"/ENT_medical"})
public class ENT_medical extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ENT_medical</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ENT_medical at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ENTDAO dao = new ENTDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String hearing = request.getParameter("hearing");
        String nose = request.getParameter("nose");
        int select = Integer.parseInt(request.getParameter("select"));
        Type type = new Type();
        type = new TypeDAO().getOne(select);
        String code = "";
        HttpSession session = request.getSession();
        if (session.getAttribute("code") == null) {
            
            String characters = "ABCDEFGHIKLMNOPQRSTUVWXYZ123456789";
            int length = 8;
            Random generator = new Random();
            char[] text = new char[length];
            for (int i = 0; i < length; i++) {
                text[i] = characters.charAt(generator.nextInt(characters.length()));
            }
            for (int i = 0; i < text.length; i++) {
                code += text[i];
            }
            session.setAttribute("code", code);
        } else {
            code += session.getAttribute("code");
        }
        
        EntRecord ent = new EntRecord(id, hearing, nose, type,code);
        int ent_id = dao.createENT(ent);
        request.getSession().setAttribute("ent_id", ent_id);
        response.sendRedirect("create_medical_record?id=" + id);
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
