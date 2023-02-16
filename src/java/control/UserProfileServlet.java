/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.UserDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
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
@WebServlet(name = "profile", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("acc");
        UserDAO dao = new UserDAO();
        User user = dao.getUser(acc.getUsername());
        request.setAttribute("user", user);
        request.getRequestDispatcher("view/profile.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("acc");
        String full_name = request.getParameter("full_name");
        System.out.println("full_name: " + full_name);
        Date dob = Date.valueOf(request.getParameter("dob"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("avatar");
        String avatar_now = request.getParameter("avatar_now");
        if (avatar == null || avatar.equals("")) {
            avatar = avatar_now;
        } else {
            avatar = "img/doctor/" + avatar;
        }
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        Date c_date = Date.valueOf(request.getParameter("c_date"));
        UserDAO db = new UserDAO();
        Long phoneNumber;
        try {
            phoneNumber = Long.parseLong(phone);
            if (phone.length() != 10) {
                request.setAttribute("PhoneErr", "Phone error format length phone");
                request.setAttribute("user", new User(acc.getId(), acc.getRole_id(), acc.getUsername(), acc.getPassword(), email, phone, full_name, dob, gender, acc.getAvatar(), 1, c_date));
                request.getRequestDispatcher("view/profile.jsp").forward(request, response);
            } else {
                db.edit(email, phone, avatar, full_name, dob, gender, c_date, acc.getUsername());
                request.setAttribute("user", new User(acc.getId(), acc.getRole_id(), acc.getUsername(), acc.getPassword(), email, phone, full_name, dob, gender, acc.getAvatar(), 1, c_date));
                session.setAttribute("acc", new User(acc.getId(), acc.getRole_id(), acc.getUsername(), acc.getPassword(), email, phone, full_name, dob, gender, avatar, 1, c_date));
                request.getRequestDispatcher("view/profile.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("PhoneErr", "Phone error format phone");
            request.setAttribute("user", new User(acc.getId(), acc.getRole_id(), acc.getUsername(), acc.getPassword(), email, phone, full_name, dob, gender, acc.getAvatar(), 1, c_date));
            request.getRequestDispatcher("view/profile.jsp").forward(request, response);
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
