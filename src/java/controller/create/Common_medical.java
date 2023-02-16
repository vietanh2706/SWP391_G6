/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.EyeRecordDAO;
import dal.MedicalRecordDAO;
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
import model.MedicalRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "Common_medical", urlPatterns = {"/Common"})
public class Common_medical extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Common_medical</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Common_medical at " + request.getContextPath() + "</h1>");
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
        MedicalRecordDAO dao = new MedicalRecordDAO();
        int internal_id = 0, physical_id = 0, eye_id = 0, ent_id = 0, maxillofacial_id = 0;
        int id = Integer.parseInt(request.getParameter("id"));
        int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
        int patient_id = Integer.parseInt(request.getParameter("patient_id"));

        if (request.getSession().getAttribute("internal_id") != null) {
            internal_id = (int) request.getSession().getAttribute("internal_id");
        }
        if (request.getSession().getAttribute("physical_id") != null) {
            physical_id = (int) request.getSession().getAttribute("physical_id");
        }
        if (request.getSession().getAttribute("eye_id") != null) {
            eye_id = (int) request.getSession().getAttribute("eye_id");
        }
        if (request.getSession().getAttribute("ent_id") != null) {
            ent_id = (int) request.getSession().getAttribute("ent_id");
        }
        if (request.getSession().getAttribute("maxi_id") != null) {
            maxillofacial_id = (int) request.getSession().getAttribute("maxi_id");
        }
        String diag = request.getParameter("diagnostic");
        String conclusion = request.getParameter("conclusion");
   
        //Code random
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
        
        MedicalRecord medical = new MedicalRecord(doctor_id, id, physical_id, internal_id, eye_id, ent_id, maxillofacial_id, diag, conclusion, code,1);
        dao.createMedical(medical);
        
        session.removeAttribute("code");
        session.removeAttribute("internal_id");
        session.removeAttribute("eye_id");
        session.removeAttribute("physical_id");
        session.removeAttribute("ent_id");
        session.removeAttribute("maxi_id");
        response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
