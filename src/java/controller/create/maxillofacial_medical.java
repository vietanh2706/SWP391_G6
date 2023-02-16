/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.MaxillofacialRecordDAO;
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
import model.MaxillofacialRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "maxillofacial_medical", urlPatterns = {"/maxillofacial_medical"})
public class maxillofacial_medical extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet maxillofacial_medical</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet maxillofacial_medical at " + request.getContextPath() + "</h1>");
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
        MaxillofacialRecordDAO dao = new MaxillofacialRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String upper = request.getParameter("upper");
        String lower = request.getParameter("lower");
        String dental = request.getParameter("dental");
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
        
        MaxillofacialRecord maxi = new MaxillofacialRecord(id, upper, lower, dental, type,code);
        int maxi_id = dao.createMaxillofacial(maxi);
        request.getSession().setAttribute("maxi_id", maxi_id);
        response.sendRedirect("create_medical_record?id=" +id);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
