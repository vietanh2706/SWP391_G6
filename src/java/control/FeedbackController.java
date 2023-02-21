/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Feedback;
import model.User;

@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
public class FeedbackController extends HttpServlet {

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
            out.println("<title>Servlet FeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String url = request.getParameter("url");
        String id_raw = request.getParameter("doctor_id");
        if (url.equals("admin")) {
            String service = request.getParameter("service");
            if (service.equals("view")) {
                int id_value = Integer.parseInt(id_raw);
                request.setAttribute("feedbacks", new FeedbackDAO().getList(id_value, -1));
                request.getRequestDispatcher("view/admin_doctor_feedback.jsp").forward(request, response);
            }
        } else {
            request.getSession().setAttribute("doctor_id", id_raw);
            request.getRequestDispatcher("view/doctor_feedback.jsp").forward(request, response);
        }

//        response.getWriter().print(id_raw);
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
        String content = request.getParameter("content");
        int doctor_id = Integer.parseInt((String) request.getSession().getAttribute("doctor_id"));
        int rate = Integer.parseInt(request.getParameter("rate"));
        System.out.println("content: " + content + ", doctor_id: " + doctor_id + ", rate: " + rate);
          User user = (User) request.getSession().getAttribute("acc");
          System.out.println("user_id: "+user.getId());
          user.setId(user.getId());
        Doctor d = new Doctor();
        d.setId(doctor_id);
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date date_created = new java.sql.Date(utilDate.getTime());
        try {
            new FeedbackDAO().giveFeedback(new Feedback(new FeedbackDAO().greatestID() + 1, user, d, content, date_created, rate));
        } catch (Exception e) {
        }
        response.sendRedirect("home");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
