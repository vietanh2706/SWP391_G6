/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.delete;

import dal.MedicalRecordDAO;
import dal.ReservationDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.MedicalRecord;

/**
 *
 * @author 
 */
@WebServlet(name = "list_delete", urlPatterns = {"/show_list_delete"})
public class list_delete extends HttpServlet {

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
            out.println("<title>Servlet list_delete</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet list_delete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MedicalRecordDAO dao = new MedicalRecordDAO();
        request.setAttribute("listMR", dao.getAllMedicalRecord());
        request.setAttribute("Doctor", new UserDAO().getAllUser());
        request.setAttribute("patient", new ReservationDAO().getAllReservation());
        request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String search = request.getParameter("search");
        MedicalRecordDAO mrDAO = new MedicalRecordDAO();
        String option = request.getParameter("option");
        if (option.equals("ID")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchById(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }
        if (option.equals("Doctor")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchByDoctorName(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }

        if (option.equals("Patient")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchByPatientName(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }
        if (option.equals("Diagnostic")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchByDiagnostic(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }
        if (option.equals("Conclusion")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchByConclusion(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }
        if (option.equals("Code")) {
            ArrayList<MedicalRecord> list = mrDAO.SearchByCode(search);
            request.setAttribute("listMR", list);
            request.setAttribute("Doctor", new UserDAO().getAllUser());
            request.setAttribute("patient", new ReservationDAO().getAllReservation());
            request.getRequestDispatcher("view/show_list_delete.jsp").forward(request, response);
        }

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
