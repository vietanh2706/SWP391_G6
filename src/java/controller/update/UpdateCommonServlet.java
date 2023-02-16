package controller.update;

import dal.MedicalRecordDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MedicalRecord;
import model.Type;

/**
 *
 * @author asus
 */
@WebServlet(name = "UpdateCommonServlet", urlPatterns = {"/update-common"})
public class UpdateCommonServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateCommonServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCommonServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MedicalRecordDAO dao = new MedicalRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
        int patient_id = Integer.parseInt(request.getParameter("patient_id"));
        int select = Integer.parseInt(request.getParameter("select"));
        String code = request.getParameter("code");

        String diag = request.getParameter("diagnostic");
        String conclusion = request.getParameter("conclusion");
        Type type = new Type();
        type = new TypeDAO().getOne(select);
        dao.updateMedicalRecord(code,diag, conclusion);
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
