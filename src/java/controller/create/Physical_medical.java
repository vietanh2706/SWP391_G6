/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.PhysicalRecordDAO;
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
import model.PhysicalRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "Physical_medical", urlPatterns = {"/Physical_medical"})
public class Physical_medical extends HttpServlet {

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
            out.println("<title>Servlet Physical_medical</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Physical_medical at " + request.getContextPath() + "</h1>");
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
        PhysicalRecordDAO dao = new PhysicalRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        Double height = Double.parseDouble(request.getParameter("Height"));
        Double weight = Double.parseDouble(request.getParameter("Weight"));
        Double bmi = Double.parseDouble(request.getParameter("BMI"));
        int pulse_tate = Integer.parseInt(request.getParameter("Pulse"));
        int blood_pressure = Integer.parseInt(request.getParameter("Blood"));
        String physical_type = request.getParameter("Physical");
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
        
        PhysicalRecord physical = new PhysicalRecord(id, height, weight, bmi, pulse_tate, blood_pressure, physical_type, type,code);
        int physical_id = dao.createPhysical(physical);
        request.getSession().setAttribute("physical_id", physical_id);
        response.sendRedirect("create_medical_record?id=" + id);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
