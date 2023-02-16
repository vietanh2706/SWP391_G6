/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.InternalRecordDAO;
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
import model.InternalRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "internal_medical", urlPatterns = {"/internal_medical"})
public class internal_medical extends HttpServlet {

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
            out.println("<title>Servlet internal_medical</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet internal_medical at " + request.getContextPath() + "</h1>");
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
        InternalRecordDAO dao = new InternalRecordDAO();
        response.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String blood_cycle = request.getParameter("blood");
        String respiratory = request.getParameter("respiratory");
        String GI = request.getParameter("gi");
        String kidneys_unary = request.getParameter("kidneys");
        String musculoskeletal = request.getParameter("musculo");
        String neurological = request.getParameter("logical");
        String neurospychiaric = request.getParameter("psychiaric");
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
        
        InternalRecord internal = new InternalRecord(blood_cycle, respiratory, GI, kidneys_unary, musculoskeletal, neurological, neurospychiaric, type,code);
        int internal_id = dao.createInternal(internal);
        request.getSession().setAttribute("internal_id", internal_id);
        response.sendRedirect("create_medical_record?id=" + id);
    }
 
  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
