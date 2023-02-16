/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.create;

import dal.InternalRecordDAO;
import dal.ReservationDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.InternalRecord;
import model.Reservation;
import model.Type;

/**
 *
 * @author Duc Anh
 */
public class create_medical_record extends HttpServlet {

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
            out.println("<title>Servlet create_medical_record</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet create_medical_record at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Reservation re = new ReservationDAO().getOne(id);

        ArrayList<Type> type = new ArrayList<>();
        type = new TypeDAO().getAllByReservation(re);

        
        request.setAttribute("type", type);
        request.setAttribute("re", re);
        
        request.getRequestDispatcher("view/create-medical-record.jsp").forward(request, response);

        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        int select = Integer.parseInt(request.getParameter("select"));

        Reservation re = new ReservationDAO().getOne(id);
        ArrayList<Type> type = new ArrayList<>();
        type = new TypeDAO().getAllByReservation(re);
        request.setAttribute("type", type);
        request.setAttribute("re", re);
        request.setAttribute("select", select);
        request.getRequestDispatcher("view/create-medical-record.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
