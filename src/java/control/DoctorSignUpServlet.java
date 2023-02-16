/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.DepartmentDAO;
import dal.DoctorDAO;
import dal.SendMail;
import dal.UserDAO;
import java.io.IOException;
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
import model.Doctor;
import model.User;

@WebServlet(name = "DoctorSignUpServlet", urlPatterns = {"/doctor-signup"})
public class DoctorSignUpServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Department> list = new DepartmentDAO().getAll();
        request.setAttribute("dept", list);
        request.getRequestDispatcher("view/signup-for-doctor.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("pass");
            String name = request.getParameter("name");
            Date dob = Date.valueOf(request.getParameter("dob"));
            boolean gender = request.getParameter("gender").equals("1");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String avatar = request.getParameter("avatar");
            avatar = "img/doctor/" + avatar;
            int dept = Integer.parseInt(request.getParameter("department"));
            int room = Integer.parseInt(request.getParameter("room"));
            String year = request.getParameter("year");
            String description = request.getParameter("description");
            UserDAO dao = new UserDAO();
            User u = dao.checkUser(user);
            if (u != null) {
                String mess = "User name existed, please try again!";
                request.setAttribute("mess", mess);
                ArrayList<Department> list = new DepartmentDAO().getAll();
                request.setAttribute("dept", list);
                request.getRequestDispatcher("view/signup-for-doctor.jsp").forward(request, response);
            } else {
                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                User uu = new User(2, user, dao.toMD5(pass), email, phone, name, dob, gender, avatar, 1, date);
                dao.insertAll(uu);
                User newUser = dao.GetNewUser();
                new DoctorDAO().insert(new Doctor(newUser, newUser.getId(), dept, room, year, description));

                //send mail to new doctor
                SendMail mail = new SendMail();
                mail.sentEmail(email, "General Hospital of Agriculture notify", "Hi " + name
                        + "\nWe are very pleased that you have submitted your application to my company, hereby I would like to congratulate you on being accepted to work in my company.\n"
                        + "This is your account and password, please do not share with others if we find out we will delete your account."
                        + "\nUsername: " + user
                        + "\nPassword: " + pass);
                response.sendRedirect("doctorlist?url=admin");
            }
        } catch (Exception e) {
            ArrayList<Department> list = new DepartmentDAO().getAll();
            request.setAttribute("dept", list);
            request.getRequestDispatcher("view/signup-for-doctor.jsp").forward(request, response);
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
