package controller.update;

import dal.InternalRecordDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Type;

/**
 *
 * @author asus
 */
@WebServlet(name = "UpdateInternalServlet", urlPatterns = {"/update-internal"})
public class UpdateInternalServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateInternalServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateInternalServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
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
        InternalRecordDAO dao = new InternalRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int select = Integer.parseInt(request.getParameter("select"));
        int blood = Integer.parseInt(request.getParameter("blood"));
        int respiratory = Integer.parseInt(request.getParameter("respiratory"));
        int GI = Integer.parseInt(request.getParameter("gi"));
        String kidneys = request.getParameter("kidneys");
        String musculo = request.getParameter("musculo");
        String logical = request.getParameter("logical");
        String psychiaric = request.getParameter("psychiaric");
        String code = request.getParameter("code");
        Type type = new Type();
        type = new TypeDAO().getOne(select);
        dao.updateInternalRecord(code,blood,respiratory,GI,kidneys,musculo,logical,psychiaric);
        response.sendRedirect("update_medical_record?id=" + id+"&code="+code);
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
