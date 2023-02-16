/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "signin", urlPatterns = {"/signin"})
public class SigninSevervlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
        User user = (User) request.getSession().getAttribute("acc");
        if (user == null) {
            request.getRequestDispatcher("view/signin.jsp").forward(request, response);

        } else { //dang nhap roi
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        UserDAO dao = new UserDAO();
        User user = new UserDAO().checkLogin(username, dao.toMD5(password));
//        System.out.println(user.getStatus());
        if (user == null) {   // check login success or not
            request.setAttribute("err", "Username password inccorect");
            request.getRequestDispatcher("view/signin.jsp").forward(request, response);
        }
        request.getSession().setAttribute("acc", user);
        response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
