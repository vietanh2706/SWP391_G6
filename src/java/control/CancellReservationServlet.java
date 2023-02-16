package control;

//import common.sendfile.Action;
//import common.sendfile.SendMail;
import dal.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HuuTrinh
 */
@WebServlet(name = "CancellReservationServlet", urlPatterns = {"/cancellreservation"})
public class CancellReservationServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            User user = (User) session.getAttribute("acc");
            int role_id = user.getRole_id();
            if (role_id == 1 || role_id == 3 || role_id ==5) {
                int id = Integer.parseInt(request.getParameter("id"));
                new ReservationDAO().AdminUpdateStatusByID(3, id);
            }

            if (role_id == 2) {
                int id = Integer.parseInt(request.getParameter("id"));
                new ReservationDAO().UpdateStatusByID(1, user.getId(), id);
            }
        dal.SendMail mail = new dal.SendMail();
        mail.sentEmail(email, "General Hospital of Agriculture notify", "Your reservation has been canceled");
            //sendMail(email);
            response.sendRedirect("reservation-list");
        }
    }

//    public void sendMail(String mail) {
//        Session sess = Action.Login("habvhe150265@fpt.edu.vn", "741751=dat");
//        SendMail sender = new SendMail(sess);
//        String[] list1 = {mail};
//        String[] list2 = null;
//        String[] list3 = null;
//        String msg = "Your reservation has been canceled";
//        sender.sendEmail(list1, list2, list3, msg, "", "[Re-Confirmation] Doctor Booking System");
//    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
