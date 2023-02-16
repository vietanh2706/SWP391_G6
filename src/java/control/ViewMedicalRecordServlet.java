package control;

import dal.DepartmentDAO;
import dal.DoctorDAO;
import dal.NewsDAO;
import dal.PatientDAO;
import dal.RecordDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MedicalRecord;
import model.Reservation;
import model.Service;
import model.User;

/**
 *
 * @author HuuTrinh
 */
@WebServlet(name = "ViewMedicalRecord", urlPatterns = {"/search"})
public class ViewMedicalRecordServlet extends HttpServlet {

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
        String code = request.getParameter("code");
        RecordDAO dao = new RecordDAO();

        MedicalRecord mr = dao.GetRecordByCode(code);
        if (mr == null || mr.getStatus() != 1) {
            request.setAttribute("mess", "Code is not available");
            request.setAttribute("onload", "exampleModalCenter");
            request.setAttribute("NewsList", new NewsDAO().getList());
            ArrayList<Service> service = new ArrayList<>();
            service = new ServiceDAO().getListService();
            request.setAttribute("service", service);
            request.setAttribute("DoctorList", new DoctorDAO().getDoctor());
            request.setAttribute("DepartmentList", new DepartmentDAO().getAll());
            request.getRequestDispatcher("view/home.jsp").forward(request, response);
        } else {
             MedicalRecord r = dao.GetRecordByCode(code);
            //Patient p = new PatientDAO().getPatientByIdd(r.getPatient_id());
            HttpSession session = request.getSession();
            session.setAttribute("rid", r.getReservation_id());
//            session.setAttribute("pid", r.getPatient_id());
            session.setAttribute("medical_code", code);
            response.sendRedirect("result");
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
