/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor...
 */
package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;


@WebServlet(name = "SignUpServlet", urlPatterns = {"/signup"})
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/signup.jsp").forward(request, response);
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String re_password = request.getParameter("re-pass");
        String email = request.getParameter("email");
        UserDAO db = new UserDAO();

        User a = new User();
        a.setUsername(username);
        a.setPassword(password);
        if(username.isEmpty() || password.isEmpty()|| email.isEmpty()){
            if(username.isEmpty()){
                request.setAttribute("empties", "UserName is empty");
            }else if(password.isEmpty()){
                request.setAttribute("empties", "Password is empty");
            }else if(email.isEmpty()){
                request.setAttribute("empties", "Email is empty");
            }
            request.getRequestDispatcher("view/signup.jsp").forward(request, response);
        }
         else if(db.checkUser(username) != null) {
            request.setAttribute("w_username", "Username " + username + " has already existed!");
//            response.getWriter().println("Tai khoan " + username + " da ton tai!");
            request.getRequestDispatcher("view/signup.jsp").forward(request, response);

        } else if (db.checkEmail(email) != null) {
            request.setAttribute("w_email", "Email " + email + " has already existed!");
//            response.getWriter().println("Tai khoan " + username + " da ton tai!");
            request.getRequestDispatcher("view/signup.jsp").forward(request, response);    
        } else {
            if (password.length() <= 7) {
                request.setAttribute("short", "Your password must has at least 8 character!");
                request.getRequestDispatcher("view/signup.jsp").forward(request, response);
            } else if (!password.equals(re_password)) {
                request.setAttribute("w_pass", "Re-password is incorrect! Please re-enter your password.");
                request.getRequestDispatcher("view/signup.jsp").forward(request, response);
            } else {
                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                db.insert(username, db.toMD5(password), email, date);
                HttpSession session = request.getSession();
                User u = new User();
                u.setUsername(username);
                u.setPassword(db.toMD5(password));
                u.setEmail(email);
                u.setCreated_date(date);
                session.setAttribute("acc", u);
                response.sendRedirect("home");
            }
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
