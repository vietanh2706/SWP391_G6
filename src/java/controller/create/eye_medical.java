/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.EyeRecordDAO;
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
import model.EyeRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "eye_medical", urlPatterns = {"/eye_medical"})
public class eye_medical extends HttpServlet {

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
            out.println("<title>Servlet eye_medical_record</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet eye_medical_record at " + request.getContextPath() + "</h1>");
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
        EyeRecordDAO dao = new EyeRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String vision = request.getParameter("vision");
        String Eye_Disease = request.getParameter("eye1");
        String Eye_Type = request.getParameter("eye2");
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
        
        EyeRecord eye = new EyeRecord(id, vision, Eye_Disease, Eye_Type, type,code);
        int eye_id = dao.createEye(eye);
        request.getSession().setAttribute("eye_id", eye_id);
        response.sendRedirect("create_medical_record?id=" + id);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
