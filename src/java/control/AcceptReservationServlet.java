package control;


import common.CBLog;
import dal.DoctorDAO;
import dal.ReservationDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reservation;
import model.User;

/**
 *
 * @author HuuTrinh
 */
@WebServlet(urlPatterns = {"/acceptreservation"})
public class AcceptReservationServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            new ReservationDAO().AdminUpdateStatusByID(2, id);
            response.sendRedirect("reservation-list");
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
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("DoctorList", new DoctorDAO().getDoctor());
        request.setAttribute("reservation", new ReservationDAO().getReservationByID(id));
        
        request.getRequestDispatcher("view/confirm-schedule.jsp").forward(request, response);
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
        int department_time_hours = 0;
        int department_time_minutes = 0;
        int reservationId = 0;
        String email = request.getParameter("userEmail");
        String examDate = request.getParameter("exam_date");
        int Doctor = Integer.parseInt(request.getParameter("Doctor"));
        HttpSession session = request.getSession();
        User acc = (User)session.getAttribute("acc");
        int userid = acc.getId();
        try {
            int hours = Integer.parseInt(request.getParameter("department_time_hours"));
            department_time_hours = hours;
        } catch (NumberFormatException ex) {
            CBLog.normalLog("Department time hours is invalid");
            response.sendRedirect("reservation-list");
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("reservationId"));
            reservationId = id;
        } catch (NumberFormatException ex) {
            response.sendRedirect("reservation-list");
            CBLog.normalLog("Reservation id is invalid");
            return;
        }

        try {
            int minutes = Integer.parseInt(request.getParameter("department_time_minutes"));
            department_time_minutes = minutes;
        } catch (NumberFormatException ex) {
            CBLog.normalLog("Department time minutes is invalid");
        }

        CBLog.normalLog(
                "Update reservation: id: " + reservationId
                + "depBLog.normalLogartment_time_minutes: " + department_time_minutes
                + "department_time_hours" + department_time_hours);

        ReservationDAO dao = new ReservationDAO();
        //Insert into confirm schedule chèn vào bảng confirm
        Reservation newReservation = dao.getNewReservation();
        dao.insertConfirmSchedule(reservationId,Doctor,userid,department_time_hours,department_time_minutes);
//        dao.updateReservation(assigned_doctor_id, department_time_minutes, department_time_hours, reservationId);
        
        Reservation reservation = dao.getReservationByID(reservationId);
        dao.AdminUpdateStatusByID(2, reservationId);
        dal.SendMail mail = new dal.SendMail();
        mail.sentEmail(email, "General Hospital of Agriculture notify", "Hi " + new UserDAO().getUserByUserId(reservation.getUser_id()).getFull_name() + "\nYour reservation has been changed from: " + examDate + " to: " + department_time_hours + ": " + department_time_minutes);
        response.sendRedirect("reservation-list");
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
