package control;

import dal.DepartmentDAO;
import dal.ReservationDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Department;
import model.Reservation;
import model.Type;
import model.User;

/**
 *
 * @author HuuTrinh
 */
@WebServlet(name = "reservation", urlPatterns = {"/reservation"})
public class ReservationServlet extends HttpServlet {

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
        DepartmentDAO dao = new DepartmentDAO();
        ArrayList<Department> list = dao.getAll();
        request.setAttribute("listType", new TypeDAO().getListType());
        request.getRequestDispatcher("view/reservation.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User u = ((User) session.getAttribute("acc"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        Date date = Date.valueOf(request.getParameter("date"));
        Date dob = Date.valueOf(request.getParameter("dob"));
        String phone = request.getParameter("phone");
        String insurance_code = request.getParameter("icode");
        String message = request.getParameter("message");
        String type[] = request.getParameterValues("type");
        ReservationDAO res = new ReservationDAO();
        java.sql.Date cdate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        //Valiadate date if you select date < today or your birthday > today 
        //you will responce a mess, mess is corresponding exception with each defect.
        if (cdate.compareTo(date) >= 0 || cdate.compareTo(dob) <= 0) {
            if (cdate.compareTo(date) >= 0) {
                request.setAttribute("mess", "Select date fail please select another day!!!");
            }
            if (cdate.compareTo(dob) <= 0) {
                request.setAttribute("mess", "Date of birth invalid please select again!!!");
            }
            DepartmentDAO dao = new DepartmentDAO();
            ArrayList<Department> list = dao.getAll();
            request.setAttribute("listType", new TypeDAO().getListType());
            request.getRequestDispatcher("view/reservation.jsp").forward(request, response);
        } else {
            Reservation reser = new Reservation();
            reser.setUser_id(u.getId());
            reser.setEmail(email);
            reser.setStatus(0);
            reser.setFull_name(name);
            reser.setGender((gender.equals("Male")));
            reser.setExam_date(date);
            reser.setPhone(phone);
            reser.setInsurance_code(insurance_code);
            reser.setDetail_note(message);
            reser.setDob(dob);
            reser.setCreated_date(cdate);

            res.insert(reser);
            Reservation newR = res.getNewReservation();
            for (String string : type) {
                String typeofType[] = string.split(",");
                Type types = new Type(Integer.parseInt(typeofType[0]), typeofType[1]);

                new TypeDAO().insertReservationType(newR.getId(), types.getId());
            }

            response.sendRedirect("home");
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
