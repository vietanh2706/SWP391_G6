/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.DepartmentDAO;
import dal.DoctorDAO;
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
import model.Department;
import model.Doctor;
import model.User;


@WebServlet(name = "SignupForDoctor2", urlPatterns = {"/signup-doctor2"})
public class SignupForDoctor2 extends HttpServlet {

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
            out.println("<title>Servlet SignupForDoctor2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupForDoctor2 at " + request.getContextPath() + "</h1>");
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
        ArrayList<Department> list = new DepartmentDAO().getAll();
                request.setAttribute("dept", list);
       request.getRequestDispatcher("view/signup-for-doctor2.jsp").forward(request, response);
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
         try {
            HttpSession session = request.getSession();
            String user = (String) session.getAttribute("user");
            UserDAO dao = new UserDAO();
            User u = dao.getUserByUsername(user);
            int id = u.getId();
            int dept = Integer.parseInt(request.getParameter("department"));
            int room = Integer.parseInt(request.getParameter("room"));
            String year = request.getParameter("year");
             
            Doctor d = new Doctor();
            d.setId(id);
            d.setDept_id(dept);
            d.setRoom_number(room);
            d.setExp_year(year);
            new DoctorDAO().insert(d);
          
            response.sendRedirect("signin");
        } catch (Exception e) {
            ArrayList<Department> list = new DepartmentDAO().getAll();
                request.setAttribute("dept", list);
            request.getRequestDispatcher("view/signup-for-doctor2.jsp").forward(request, response);
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
